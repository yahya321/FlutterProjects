import 'package:cloud_firestore/cloud_firestore.dart';

class Meal {
  String id;
  String imageName;
  String name;
  String type;
  bool isRecommended;
  bool isToday;
  num rate;
  String serving;
  String timeCook;
  String calories;
  Meal(
      {required this.calories,
      required this.id,
      required this.imageName,
      required this.isRecommended,
      required this.isToday,
      required this.name,
      required this.rate,
      required this.serving,
      required this.timeCook,
      required this.type});

  toMap() {
    return {
      'id': id,
      "imageName": imageName,
      "type": type,
      "isRecommended": isRecommended,
      "isToday": isToday,
      "rate": rate,
      "serving": serving,
      "timeCook": timeCook,
      "calories": calories
    };
  }

//Meal.fromMap(Map<String, dynamic> doc)
//    : calories = doc['calories'],
//      imageName = doc['imageName'],
//      isRecommended = doc['isRecommended'],
//      type = doc['type'],
//      isToday = doc['isToday'],
//      rate = doc['rate'],
//      serving = doc['serving'],
//      timeCook = doc['timeCook'];
}
