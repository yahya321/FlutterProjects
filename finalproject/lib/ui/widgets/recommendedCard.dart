import 'package:favorite_button/favorite_button.dart';
import 'package:finalproject/providers/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Utilities/routes.dart';
import '../../models/Meal.dart';
import '../../models/appUser.dart';
import '../../providers/firestore_provider.dart';
import '../pages/mealDescreption.dart';

class RecommendedCard extends StatelessWidget {
  Meal meal;
  bool isFavorite;

  RecommendedCard({required this.meal, required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: 300,
      height: 160,
      child: Card(
        color: Colors.black,
        child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              AppUser.recently.addAll([meal.name.trim()]);
              Provider.of<FirestoreProvider>(context, listen: false)
                  .addRecentlyMealToUser();
              Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => MealDescreptionPage(
                            meal: meal,
                          )));
            },
            child: Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 63, 63, 63),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 120,
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage("assets/images/${meal.imageName}"),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 30),
                          child: SizedBox(
                            height: 20,
                            child: Text(
                              meal.type.toString().trim(),
                              style: TextStyle(
                                fontSize: 8,
                                color: Color.fromARGB(255, 8, 124, 153),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          child: Text(
                            meal.name.toString().trim(),
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200,
                          height: 20,
                          child: Row(
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    for (int i = meal.rate.toInt(); i > 0; i--)
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange[800],
                                        size: 15,
                                      ),
                                    for (int i = 5 - meal.rate.toInt();
                                        i > 0;
                                        i--)
                                      Icon(
                                        Icons.star,
                                        color:
                                            Color.fromARGB(255, 141, 141, 141),
                                        size: 15,
                                      ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text(
                                  meal.calories.toString().trim(),
                                  style: TextStyle(
                                    fontSize: 8,
                                    color: Colors.orange[800],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 70,
                                  child: Row(children: [
                                    Icon(
                                      Icons.timer,
                                      color: Color.fromARGB(255, 138, 138, 138),
                                    ),
                                    Text(
                                      meal.timeCook.toString().trim(),
                                      style: TextStyle(
                                        fontSize: 8,
                                        color:
                                            Color.fromARGB(255, 138, 138, 138),
                                      ),
                                    ),
                                  ]),
                                ),
                                Container(
                                  width: 70,
                                  child: Row(children: [
                                    Icon(
                                      Icons.room_service_outlined,
                                      color: Color.fromARGB(255, 138, 138, 138),
                                    ),
                                    Text(
                                      meal.serving.toString().trim(),
                                      style: TextStyle(
                                        fontSize: 8,
                                        color:
                                            Color.fromARGB(255, 138, 138, 138),
                                      ),
                                    ),
                                  ]),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: 50,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: FavoriteButton(
                            iconSize: 40.0,
                            isFavorite: isFavorite,
                            valueChanged: (_isFavorite) {
                              if (_isFavorite) {
                                AppUser.favorites.addAll([meal.name.trim()]);
                                Provider.of<FirestoreProvider>(context,
                                        listen: false)
                                    .addFavoriteMealToUser();
                              } else {
                                AppUser.favorites.remove(meal.id.trim());
                                Provider.of<FirestoreProvider>(context,
                                        listen: false)
                                    .deleteFavoriteMealFromUser(meal.id.trim());
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
