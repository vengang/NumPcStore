import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:computer_store/core/const/color.dart';
import 'package:computer_store/provider/add_to_card.dart';
import 'package:computer_store/provider/darkMode.dart';
import 'package:computer_store/provider/favorateProvider.dart';
import 'package:computer_store/provider/urlUtil.dart';
import 'package:computer_store/service/apiModel.dart';
import 'package:computer_store/view/home/page/add_to_card_page.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:provider/provider.dart';

class Productdetail extends StatelessWidget {
  // const Productdetail({super.key});
  final ProductModel item;
  final _urlUtil = Urlutil();

  Productdetail(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    final _favoriteProvider = context.watch<Favorateprovider>();
    //add to card
    final _addToCardProvider = context.read<AddToCardProvider>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: Text(
          "Our Product",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.lightBlue,
          ),
        ),
        actionsPadding: EdgeInsets.symmetric(horizontal: 18),
        actions: [
          InkWell(
            onTap: () {
              pushScreen(context, screen: AddToCardPage());
            },
            child: Badge(
              label: Text(
                context.watch<AddToCardProvider>().totalItem().toString(),
              ),
              child: Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: _buildBody(context),
      bottomNavigationBar: _addToCard(context),
    );
  }

  Widget _addToCard(BuildContext context) {
    // check favorite
    final _favoriteProvider = context.watch<Favorateprovider>();
    // add to card
    final _addToCard = context.watch<AddToCardProvider>().cardItem;
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // like
          IconButton(
            onPressed: () {
              context.read<Favorateprovider>().toggleFavorite(item);
            },
            icon: Icon(
              _favoriteProvider.isFav(item)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: _favoriteProvider.isFav(item) ? Colors.red : Colors.grey,
            ),
          ),
          // add to card
          InkWell(
            onTap: () {
              context.read<AddToCardProvider>().addToCard(item);
              bool res = false;
              if (!res) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Add is Successful!")));
              }
            },
            child: Padding(
              padding: EdgeInsetsGeometry.all(8),
              child: Container(
                width: 250,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.blue[800],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Text(
                      textAlign: TextAlign.center,
                      "Add to cart",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Icon(Icons.share),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    bool _isDark = context.watch<DarkMode>().isDarkMode;
    return ListView(
      children: [
        _sliderShow(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            item.description,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Text("Model : ${item.name}", style: TextStyle(fontSize: 15)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
          child: Row(
            children: [
              Text("Price : ", style: TextStyle(fontSize: 15)),
              Text(
                "\$ ${item.price.toString()}",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        //avali
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Row(
            children: [
              Text("Availability :", style: TextStyle(fontSize: 15)),
              Text(
                "${item.stock.toString()} in stock",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Divider(thickness: .5, color: Colors.grey),
        Center(
          child: Text(
            "Descriptions",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.lightBlue,
            ),
          ),
        ),
        SizedBox(height: 12),
        //=====Descriptions===========
        //outside padding
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Container(
            decoration: BoxDecoration(
              color: _isDark
                  ? Theme.of(context).colorScheme.surface
                  : Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            height: 180,
            //inside padding
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("- CPU: ${item.specs.cpu}"),
                SizedBox(height: 5),
                Text("- Ram: ${item.specs.ram}"),
                SizedBox(height: 5),
                Text("- SSD: ${item.specs.storage}"),
                SizedBox(height: 5),
                Text("- Display: ${item.specs.display}"),
                SizedBox(height: 5),
                Text("- VGA: ${item.specs.gpu}"),
                SizedBox(height: 5),
              ],
            ),
          ),
        ),

        SizedBox(height: 12),
        //contact us
        Divider(thickness: .5, color: Colors.grey),
        Center(
          child: Text(
            "Contact us to ask information",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.lightBlue,
            ),
          ),
        ),
        SizedBox(height: 12),
        // contact us to get information
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: _isDark
                  ? Theme.of(context).colorScheme.surface
                  : Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: .08),
                  blurRadius: 15,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                _contactItem(
                  icon: Icons.call,
                  iconColor: Colors.green,
                  text: "012345678",
                  onTap: () {
                    String numbers = "+855 12345678";
                    _urlUtil.open("tel:${numbers}");
                  },
                ),

                const Divider(color: Colors.grey),
                _contactItem(
                  icon: Icons.facebook,
                  iconColor: const Color(0xFF1877F2),
                  text: "Num FIT",
                  onTap: () {
                    String facebook = "https://web.facebook.com/num.fit.info";
                    _urlUtil.open(facebook);
                  },
                ),
                const Divider(color: Colors.grey),
                _contactItem(
                  icon: Icons.telegram,
                  iconColor: const Color(0xFF229ED9),
                  text: "Num FIT",
                  onTap: () {
                    String telegram = "https://t.me/numtelegram";
                    _urlUtil.open(telegram);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  //slider show
  Widget _sliderShow() {
    List images = [item.image];
    return Padding(
      padding: const EdgeInsets.all(12),
      child: CarouselSlider.builder(
        itemCount: images.length,
        itemBuilder: (context, index, viewIndex) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(16),
            // child: Image.network(images[index], fit: BoxFit.cover),
            child: CachedNetworkImage(
              placeholder: (context, url) => Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (context, url, error) => Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              imageUrl: images[index],
              fit: BoxFit.cover,
            ),
          );
        },
        options: CarouselOptions(
          height: 250,
          enlargeCenterPage: true,
          aspectRatio: 16 / 9,
          viewportFraction: 0.9,
        ),
      ),
    );
  }

  Widget _contactItem({
    required IconData icon,
    required Color iconColor,
    required String text,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: .12),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 24),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
