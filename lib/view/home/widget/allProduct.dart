import 'package:cached_network_image/cached_network_image.dart';
import 'package:computer_store/core/const/color.dart';
import 'package:computer_store/provider/favorateProvider.dart';
import 'package:computer_store/provider/themlogic.dart';
import 'package:computer_store/service/apiModel.dart';
import 'package:computer_store/service/apiService.dart';
import 'package:computer_store/view/home/widget/productDetail.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:provider/provider.dart';

class Allproduct extends StatelessWidget {
  const Allproduct({super.key});

  @override
  Widget build(BuildContext context) {
    final service = Apiservice();
    late Future<List<ProductModel>> _futureData = service.fetchApi();
    return FutureBuilder<List<ProductModel>>(
      future: _futureData,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Errre");
        } else if (snapshot.connectionState == ConnectionState.done) {
          return _buildListView(snapshot.data, context);
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  //data respone
  Widget _buildListView(List<ProductModel>? items, BuildContext context) {
    final _favorite = context.watch<Favorateprovider>();
    final _darkMode = context.watch<Themlogic>();
    if (items == null) {
      return Center();
    }
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              pushScreen(
                context,
                screen: Productdetail(item),
                withNavBar: false,
              );
            },
            child: SizedBox(
              height: 100,
              child: Card(
              
                color: _darkMode.dark ? Theme.of(context).hoverColor : null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // imgaes
                    Container(
                      padding: EdgeInsets.all(1),
                      width: 120,
                      height: 80,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: CachedNetworkImage(
                          imageUrl: item.image,
                          placeholder: (context, url) => Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(child: CircularProgressIndicator()),
                          ),
                          errorWidget: (context, url, error) => Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // tittle
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          item.name,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'USD ${item.price.toString()}',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                    //more view
                    IconButton(
                      onPressed: () {
                        context.read<Favorateprovider>().toggleFavorite(item);
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: _favorite.isFav(item) ? Colors.red : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
