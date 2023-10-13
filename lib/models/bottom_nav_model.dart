import 'package:flutter/cupertino.dart';

class BottomNavModel extends ChangeNotifier {
  int _activeIndex = 0;
  get activeIndex => _activeIndex;

  void setActiveIndex(int index) {
    _activeIndex = index;
    notifyListeners();
  }
}