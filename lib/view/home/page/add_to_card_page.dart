import 'package:cached_network_image/cached_network_image.dart';
import 'package:computer_store/provider/add_to_card.dart';
import 'package:computer_store/provider/favorateProvider.dart';
import 'package:computer_store/service/apiModel.dart';
import 'package:computer_store/view/home/widget/productDetail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddToCardPage extends StatelessWidget {
  const AddToCardPage({super.key});
  @override
  Widget build(BuildContext context) {
    final _addTocardProvider = context.watch<AddToCardProvider>().cardItem;
    final _addTocardTotal = context.watch<AddToCardProvider>();
    //check fav
    final _favoritePro = context.watch<Favorateprovider>();
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("My Card")),
      body: _addTocardProvider.isEmpty
          ? Center(child: Text('Card Is Empty!'))
          : ListView.builder(
              itemCount: _addTocardProvider.length,
              itemBuilder: (context, index) {
                final item = _addTocardProvider[index];
                return Dismissible(
                  background: Container(
                    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Delete",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.delete, color: Colors.white, size: 30),
                      ],
                    ),
                  ),

                  // id is key
                  key: Key(item.id.toString()),
                  //act delete
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    context.read<AddToCardProvider>().remove(index);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${item.name} removed from cart')),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsetsGeometry.symmetric(
                      horizontal: 12,
                      vertical: 2,
                    ),
                    child: InkWell(
                      // onTap: () {
                      //   pushScreen(context, screen: Productdetail(item));
                      // },
                      child: Card(
                        elevation: 2,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 4,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Row(
                            children: [
                              // Image
                              Container(
                                padding: const EdgeInsets.all(1),
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
                                      child: const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade300,
                                            borderRadius: BorderRadius.circular(
                                              16,
                                            ),
                                          ),
                                        ),
                                  ),
                                ),
                              ),

                              const SizedBox(width: 12),
                              // Product Info
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                      ),
                                    ),

                                    const SizedBox(height: 6),

                                    Text(
                                      'USD ${item.price}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Favorite Button
                              // InkWell(
                              //   onTap: () => context
                              //       .read<Favorateprovider>()
                              //       .isFav(item),
                              //   child: Icon(
                              //     Icons.favorite,
                              //     color: _favoritePro.isFav(item)
                              //         ? Colors.red
                              //         : Colors.grey,
                              //   ),
                              // ),
                              // add and remove
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      context
                                          .read<AddToCardProvider>()
                                          .decrement(index);
                                    },
                                    icon: Icon(
                                      Icons.remove_circle_outline_outlined,
                                    ),
                                  ),
                                  Text(
                                    item.stock.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      context
                                          .read<AddToCardProvider>()
                                          .increment(index);
                                    },
                                    icon: Icon(
                                      Icons.add_circle_outline_outlined,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: Container(
        height: 180,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 28),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .1),
              blurRadius: 10,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: Column(
          children: [
            // sub total
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Sub Total:'),
                Text('\$${_addTocardTotal.total().toString()}'),
              ],
            ),
            SizedBox(height: 12),
            // total
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'TOTAL :',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${_addTocardTotal.total().toString()}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Spacer(),
            //check out btn
            FilledButton(onPressed: () {}, child: Text('Check Out')),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
