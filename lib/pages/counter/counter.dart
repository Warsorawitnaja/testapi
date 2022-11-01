import 'package:flutter/material.dart';

class Counter extends ChangeNotifier{
  var value = 0;

  void incrementValue(){
    value += 1;
    notifyListeners();
  }
}