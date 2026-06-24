import 'package:flutter/material.dart';

class NavbarController extends ChangeNotifier {
  int _activeIndex = 0;

  int get activeIndex => _activeIndex;

  void setActiveIndex(int index) {
    if (_activeIndex == index) return;

    _activeIndex = index;
    notifyListeners();
  }
}