import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/appUser.dart';

class FirestoreProvider {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  addUserToFirestore(AppUser appUser) async {
    try {
      firestore.collection('users').doc(appUser.id).set(appUser.toMap());
    } catch (e) {
      log(e.toString());
    }
  }

  getAllUsersFromFirestore() async {
    QuerySnapshot<Map<String, dynamic>> data =
        await firestore.collection('users').get();
    List<Map<String, dynamic>> dataDetails =
        data.docs.map((e) => e.data()).toList();
    log(dataDetails.toString());
  }

  getOneUserFromFirestore(String id) async {
    DocumentSnapshot<Map<String, dynamic>> doc =
        await firestore.collection('users').doc(id).get();
    Map<String, dynamic>? data = doc.data();
    log(data.toString());
  }
}
