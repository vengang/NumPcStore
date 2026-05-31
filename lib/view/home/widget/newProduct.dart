import 'package:computer_store/Model/newProductModel.dart';
import 'package:computer_store/core/const/color.dart';
import 'package:computer_store/service/apiModel.dart';
import 'package:computer_store/service/apiService.dart';
import 'package:flutter/material.dart';

class Newproduct extends StatelessWidget {
  const Newproduct({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Column(
        children: [
          _buildTitle(),
          Expanded(child: _buildBody()),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemCount: ProductItem.length,
      itemBuilder: (context, index) {
        final item = ProductItem[index];
        return Container(
          decoration: BoxDecoration(
            // color: Colors.amber,
            // borderRadius: BorderRadius.circular(25),
          ),
          margin: EdgeInsets.all(5),
          width: 180,
          //inside padding
          child: Padding(
            padding: EdgeInsetsGeometry.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(10),
                    child: Image.network(item.img, fit: BoxFit.cover),
                  ),
                ),

                Text(
                  item.title,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                Text(
                  "\$${item.price.toString()}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "New Arrival",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(
            "See All>",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
