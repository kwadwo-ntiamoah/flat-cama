import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier {
  int _x = 0;

  get x => _x;

  void incrementX() {
    _x++;
    notifyListeners();
  }

  void decrementX() {
    _x--;
    notifyListeners();
  }
}