import 'package:computer_store/Model/categoryModel.dart';
import 'package:computer_store/core/const/color.dart';
import 'package:computer_store/provider/isActive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    // is active provider
    // bool isclick = context.watch<Isactive>().isAct;
    return SizedBox(
      height: 95,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final item = categories[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 85,
                        height: 65,
                        decoration: BoxDecoration(
                          border: BoxBorder.all(color: AppColors.primary),
                          // color: Colors.grey.shade900,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(item.icon, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Row(children: [Text(item.title)]),
              ],
            ),
          );
        },
      ),
    );
  }
}
