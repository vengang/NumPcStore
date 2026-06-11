import 'package:flutter/material.dart';

class Themlogic extends ChangeNotifier {
  bool _dark = false;
  bool get dark => _dark;
  void toggle() {
    _dark = !_dark;
    notifyListeners();
  }
}
