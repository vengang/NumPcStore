import 'package:computer_store/core/const/color.dart';
import 'package:computer_store/view/home/widget/allProduct.dart';
import 'package:computer_store/view/home/widget/category.dart';
import 'package:computer_store/view/home/widget/newProduct.dart';
import 'package:computer_store/view/home/widget/silderShow.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        // toolbarHeight: 70,
        actions: [
          Icon(Icons.notifications_outlined, size: 25),
          SizedBox(width: 25),
          Icon(Icons.shopping_bag_outlined, size: 25),
        ],

        title: Text(
          'Computer Store',
          style: TextStyle(
            // color: AppColors.primary,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppColors.lightBlue,
          ),
        ),
        actionsPadding: EdgeInsets.only(right: 25),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          Sildershow(),
          SizedBox(height: 12),
          Category(),
          Newproduct(),
          _buildProductTitile(),
          Allproduct(),
        ],
      ),
    );
  }

  Widget _buildProductTitile() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Product Popular",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              // color: Colors.lightBlueAccent.shade400,
            ),
          ),
          Text(
            "See All >",
            style: TextStyle(
              fontSize: 15,
              // color: Colors.lightBlueAccent.shade400,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
