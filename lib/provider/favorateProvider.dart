import 'package:computer_store/service/apiModel.dart';
import 'package:flutter/material.dart';

class Favorateprovider extends ChangeNotifier {
  final List<ProductModel> _favorate = [];
  List<ProductModel> get favorate => _favorate;
  // add
  void addFavorite(ProductModel product) {
    if (!_favorate.any((item) => item.id == product.id)) {
      _favorate.add(product);
      notifyListeners();
    }
  }

  // remove
  void removeFavorite(ProductModel product) {
    _favorate.removeWhere((item) => item.id == product.id);
    notifyListeners();
  }

  //check
  bool isFav(ProductModel product) {
    return _favorate.any((item) => item.id == product.id);
  }

  // toggle
  void toggleFavorite(ProductModel product) {
    if (isFav(product)) {
      removeFavorite(product);
    } else {
      addFavorite(product);
    }
  }
}
