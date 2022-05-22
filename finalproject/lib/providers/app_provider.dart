import 'package:flutter/cupertino.dart';
import 'auth_provider.dart';
import 'firestore_provider.dart';
import '../models/appUser.dart';
import 'package:provider/provider.dart';

class AppProvider {
  BuildContext context;
  AppProvider({required this.context});
  register(AppUser appUser) async {
    String? id = await Provider.of<AuthProvider>(context, listen: false)
        .createNewAccount(appUser);

    if (id != null) {
      AppUser.id = id;
      Provider.of<FirestoreProvider>(context, listen: false)
          .addUserToFirestore(appUser);
    }
  }

  login(String email, String password) async {
    String? id = await Provider.of<AuthProvider>(context, listen: false)
        .login(email, password);
    if (id != null) {
      Provider.of<FirestoreProvider>(context, listen: false)
          .getOneUserFromFirestore(id);
    }
  }
}
