import 'package:carousel_slider/carousel_slider.dart';
import 'package:computer_store/core/const/color.dart';
import 'package:computer_store/service/apiModel.dart';
import 'package:flutter/material.dart';

class Productdetail extends StatelessWidget {
  // const Productdetail({super.key});
  final ProductModel item;

  const Productdetail(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    // final item = this.wi.item;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About Product Detail",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.lightBlue,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
        ],
      ),
      body: _buildBody(),
      bottomNavigationBar: _addToCard(),
    );
  }

  Widget _addToCard() {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // like
          Icon(Icons.favorite),
          // add to card
          Padding(
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
                  Icon(Icons.shopping_cart, color: Colors.white, size: 20),
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
          Icon(Icons.share),
        ],
      ),
    );
  }

  Widget _buildBody() {
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
        Divider(thickness: .5),
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
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            height: 200,
            //inside padding
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("- Brand: ${item.name}"),
                SizedBox(height: 5),
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
            child: Image.network(images[index], fit: BoxFit.cover),
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
}
