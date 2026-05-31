// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
    int id;
    String name;
    double price;
    String image;
    String description;
    String category;
    int stock;
    Specs specs;

    ProductModel({
        required this.id,
        required this.name,
        required this.price,
        required this.image,
        required this.description,
        required this.category,
        required this.stock,
        required this.specs,
    });

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        price: json["price"].toDouble(),
        image: json["image"],
        description: json["description"],
        category: json["category"],
        stock: json["stock"],
        specs: Specs.fromJson(json["specs"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "image": image,
        "description": description,
        "category": category,
        "stock": stock,
        "specs": specs.toJson(),
    };
}

class Specs {
    String cpu;
    String ram;
    String storage;
    String gpu;
    String display;

    Specs({
        required this.cpu,
        required this.ram,
        required this.storage,
        required this.gpu,
        required this.display,
    });

    factory Specs.fromJson(Map<String, dynamic> json) => Specs(
        cpu: json["cpu"],
        ram: json["ram"],
        storage: json["storage"],
        gpu: json["gpu"],
        display: json["display"],
    );

    Map<String, dynamic> toJson() => {
        "cpu": cpu,
        "ram": ram,
        "storage": storage,
        "gpu": gpu,
        "display": display,
    };
}
