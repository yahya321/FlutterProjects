import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerProvider extends ChangeNotifier {
  bool homeSelected = true;
  bool favoritesSelected = false;
  bool recentlySelected = false;
  bool settingsSelected = false;
  bool aboutSelected = false;
  bool helpSelected = false;

  madeSelected(int row) {
    unSelectALL();
    switch (row) {
      case 1:
        homeSelected = true;
        break;
      case 2:
        favoritesSelected = true;
        break;
      case 3:
        recentlySelected = true;
        break;
      case 4:
        settingsSelected = true;
        break;
      default:
        homeSelected = true;
    }
    notifyListeners();
  }

  unSelectALL() {
    homeSelected = false;
    favoritesSelected = false;
    recentlySelected = false;
    settingsSelected = false;
    aboutSelected = false;
    helpSelected = false;
  }
}
