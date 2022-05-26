import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class FavoriteProvider extends ChangeNotifier {
  notifyFavorite() {
    notifyListeners();
  }
}
