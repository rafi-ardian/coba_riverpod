import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier {
  int value;
  CounterModel({required this.value});

  void increment() {
    value++;
    notifyListeners();
  }

  void decrement() {
    value--;
    notifyListeners();
  }

  void reset() {
    value = 0;
    notifyListeners();
  }
}
