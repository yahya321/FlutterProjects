import 'package:flutter/material.dart';

class TestProvider extends ChangeNotifier {
  TestProvider() {
    print('hello');
  }
  String title = 'shady';
  changeTitle(String value) {
    title = value;
    notifyListeners();
  }
}
