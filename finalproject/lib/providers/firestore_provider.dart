import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/Meal.dart';
import '../models/appUser.dart';

class FirestoreProvider {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  addUserToFirestore(AppUser appUser) async {
    try {
      firestore.collection('users').doc(AppUser.id).set(appUser.toMap());
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

  addFavoriteMealToUser() async {
    try {
      firestore.collection('users').doc(AppUser.id).update({
        'favorites': FieldValue.arrayUnion(AppUser.favorites)
      }).whenComplete(() {
        print('favorite created');
      });
    } catch (e) {
      log(e.toString());
    }
  }

  getAllListFavoritesUserMeals() async {
    try {
      firestore
          .collection('users')
          .doc(AppUser.id)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          try {
            List<dynamic> nested =
                documentSnapshot.get(FieldPath(['favorites']));

            for (var i = 0; i < nested.length; i++) {
              AppUser.favorites.add(nested[i].toString().trim());
            }
          } on StateError catch (e) {
            print('No nested field exists!');
          }
        } else {
          print('Document does not exist on the database ${AppUser.id}');
        }
      });
    } catch (e) {
      log(e.toString());
    }
  }

  deleteFavoriteMealFromUser(String value) async {
    try {
      firestore.collection('users').doc(AppUser.id).update({
        'favorites': FieldValue.arrayRemove([value])
      }).whenComplete(() {
        print('$value Deleted');
      });
    } catch (e) {}
  }

  addRecentlyMealToUser() async {
    try {
      firestore.collection('users').doc(AppUser.id).update({
        'recently': FieldValue.arrayUnion(AppUser.recently)
      }).whenComplete(() {
        print('recently created');
      });
    } catch (e) {
      log(e.toString());
    }
  }

  getAllListRecentlyUserMeals() async {
    try {
      firestore
          .collection('users')
          .doc(AppUser.id)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          try {
            List<dynamic> nested =
                documentSnapshot.get(FieldPath(['recently']));

            for (var i = 0; i < nested.length; i++) {
              AppUser.recently.add(nested[i].toString().trim());
            }
          } on StateError catch (e) {
            print('No nested field exists!');
          }
        } else {
          print('Document does not exist on the database ${AppUser.id}');
        }
      });
    } catch (e) {
      log(e.toString());
    }
  }

  getMeal(String id) {
    return FirebaseFirestore.instance
        .collection('meals')
        .doc(id)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print(documentSnapshot.get('name'));
      }
    });
  }

  Future<List<Map<String, dynamic>>> getAllMealsFromFirestore() async {
    QuerySnapshot<Map<String, dynamic>> data =
        await firestore.collection("meals").get();
    List<Map<String, dynamic>> dataDetails =
        data.docs.map((e) => e.data()).toList();
    return dataDetails;

    // snapshot.docs.map((docSnapshot) => Meal.fromMap(docSnapshot)).toList();
  }

  Future<List<Map<String, dynamic>>> getAllFreshMealsFromFirestore() async {
    QuerySnapshot<Map<String, dynamic>> data = await FirebaseFirestore.instance
        .collection("meals")
        .where('isToday', isEqualTo: true)
        .get();
    List<Map<String, dynamic>> dataDetails =
        data.docs.map((e) => e.data()).toList();
    return dataDetails;

    // snapshot.docs.map((docSnapshot) => Meal.fromMap(docSnapshot)).toList();
  }

  Future<List<Map<String, dynamic>>>
      getAllRecommendedMealsFromFirestore() async {
    QuerySnapshot<Map<String, dynamic>> data = await FirebaseFirestore.instance
        .collection("meals")
        .where('isRecommended', isEqualTo: true)
        .get();
    List<Map<String, dynamic>> dataDetails =
        data.docs.map((e) => e.data()).toList();

    return dataDetails;

    // snapshot.docs.map((docSnapshot) => Meal.fromMap(docSnapshot)).toList();
  }

  Future<int> getTodayFreshMealsCount() async {
    int count = 0;
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("meals").get();
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      var a = querySnapshot.docs[i];

      if (a.get('isToday') == true) {
        count++;
      }
    }
    return count;
  }
}
