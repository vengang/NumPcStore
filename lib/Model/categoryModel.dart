import 'package:flutter/material.dart';

class CategoryModel {
  final String title;
  final IconData icon;

  CategoryModel({required this.title, required this.icon});
}

List<CategoryModel> categories = [
  CategoryModel(title: "Laptop", icon: Icons.laptop),
  CategoryModel(title: "Peripherals", icon: Icons.mouse),
  CategoryModel(title: "Components", icon: Icons.memory),
  CategoryModel(title: "Audio", icon: Icons.headphones),
];
