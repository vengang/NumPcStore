import 'package:flutter/material.dart';

class Isactive extends ChangeNotifier{
  bool _isAct = false; 
  bool get isAct => _isAct; 
  
  void isClick(){
    _isAct = ! _isAct; 
    notifyListeners(); 
  }
}