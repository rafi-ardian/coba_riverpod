import 'package:flutter/material.dart';

class ChangeNameModel extends ChangeNotifier {
  String name;
  ChangeNameModel({required this.name});

  void changeName(newName) {
    name = newName;
    notifyListeners();
  }
}
