import 'package:computer_store/service/apiModel.dart';
import 'package:flutter/material.dart';

class AddToCardProvider extends ChangeNotifier {
  List<ProductModel> _cardItem = [];
  List<ProductModel> get cardItem => _cardItem;

  // add to cart
  void addToCard(ProductModel pro) {
    _cardItem.add(
      ProductModel(
        id: pro.id,
        name: pro.name,
        price: pro.price,
        image: pro.image,
        description: pro.description,
        category: pro.category,
        stock: 1, 
        specs: pro.specs,
      ),
    );

    notifyListeners();
  }

  // remove item
  void remove(int index) {
    _cardItem.removeAt(index);
    notifyListeners();
  }

  // increment quantity
  void increment(int index) {
    _cardItem[index].stock++;
    notifyListeners();
  }

  // decrement quantity
  void decrement(int index) {
    if (_cardItem[index].stock > 1) {
      _cardItem[index].stock--;
    } else {
      _cardItem.removeAt(index);
    }

    notifyListeners();
  }

  // total price
  double total() {
    double sum = 0;
    for (int i = 0; i < _cardItem.length; i++) {
      sum += _cardItem[i].stock * _cardItem[i].price;
    }
    return sum;
  }

  // total items (quantity sum)
  int totalItem() {
    int sum = 0;
    for (int i = 0; i < _cardItem.length; i++) {
      sum += _cardItem[i].stock;
    }
    return sum;
  }
}
