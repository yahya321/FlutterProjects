import 'package:flutter/material.dart';

class MyAppBar {
  static AppBar build() {
    // TODO: implement build
    return AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.notifications_none_outlined,
              color: Colors.white,
            ),
          ],
        ));
  }
}
