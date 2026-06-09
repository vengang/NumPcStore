import 'package:cached_network_image/cached_network_image.dart';
import 'package:computer_store/core/const/color.dart';
import 'package:computer_store/provider/favorateProvider.dart';
import 'package:computer_store/view/home/widget/productDetail.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:provider/provider.dart';

class Favoratepage extends StatelessWidget {
  const Favoratepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorate',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.lightBlue,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<Favorateprovider>(
        builder: (context, provider, child) {
          // condition check
          if (provider.favorate.isEmpty) {
            return Center(child: Text("No Favorite Products"));
          }
          return ListView.builder(
            itemCount: provider.favorate.length,
            itemBuilder: (context, index) {
              final item = provider.favorate[index];
              return Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 12,
                  vertical: 2,
                ),
                child: InkWell(
                  onTap: () {
                    pushScreen(context, screen: Productdetail(item));
                  },
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
                      padding: const EdgeInsets.all(8),
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
                                errorWidget: (context, url, error) => Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(16),
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
                          IconButton(
                            icon: const Icon(Icons.favorite, color: Colors.red),
                            onPressed: () {
                              provider.toggleFavorite(item);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
