import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:computer_store/service/apiModel.dart';
import 'package:computer_store/service/apiService.dart';
import 'package:computer_store/view/home/widget/productDetail.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class Searchscreen extends StatefulWidget {
  const Searchscreen({super.key});

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  final _searchCtal = TextEditingController();
  final _service = Apiservice();

  late Future<List<ProductModel>> _futureData = _service.search(
    _searchCtal.text.trim(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 50,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.blueAccent),
          ),
          child: TextField(
            controller: _searchCtal,
            onSubmitted: (text) {
              setState(() {
                _futureData = _service.search(_searchCtal.text.trim());
              });
            },
            decoration: const InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search),
              hintText: "Search Product",
            ),
          ),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return FutureBuilder<List<ProductModel>>(
      future: _futureData,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text("Error loading data"));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        final items = snapshot.data ?? [];
        if (items.isEmpty) {
          return const Center(child: Text("No products found"));
        }
        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return InkWell(
              onTap: () {
                pushScreen(
                  context,
                  screen: Productdetail(item),
                  withNavBar: false,
                );
              },
              child: Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  leading: CachedNetworkImage(
                    imageUrl: item.image,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.broken_image),
                  ),
                  title: Text(item.name),
                  subtitle: Text("USD ${item.price}"),
                  trailing: const Icon(Icons.favorite_border),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
