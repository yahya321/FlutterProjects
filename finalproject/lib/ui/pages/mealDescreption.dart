import 'package:favorite_button/favorite_button.dart';
import 'package:finalproject/ui/widgets/recommendedCard.dart';
import 'package:flutter/material.dart';
import 'package:finalproject/ui/widgets/myAppBar.dart';
import 'package:provider/provider.dart';

import '../../Utilities/routes.dart';
import '../../models/Meal.dart';
import '../../models/appUser.dart';
import '../../providers/firestore_provider.dart';

class MealDescreptionPage extends StatelessWidget {
  TextEditingController searchController = TextEditingController();
  Meal meal;

  MealDescreptionPage({required this.meal});

  @override
  Widget build(BuildContext context) {
    bool isFavorite = AppUser.favorites.contains(meal.name.trim());
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
        appBar: NavBar(),
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 15, 15, 20),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 5),
                child: Text(
                  meal.type.trim(),
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 8, 124, 153),
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: Text(
                          meal.name.trim(),
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: FavoriteButton(
                          iconSize: 60.0,
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
                  )),
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: Text(
                  meal.calories.trim(),
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.orange[800],
                  ),
                ),
              ),
              SizedBox(
                width: 160,
                height: 40,
                child: Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      for (int i = meal.rate.toInt(); i > 0; i--)
                        Icon(
                          Icons.star,
                          color: Colors.orange[800],
                          size: 25,
                        ),
                      for (int i = 5 - meal.rate.toInt(); i > 0; i--)
                        Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 141, 141, 141),
                          size: 25,
                        ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: Stack(children: [
                  Row(children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 30),
                          width: 100,
                          child: Row(children: [
                            Icon(
                              Icons.timer,
                              color: Color.fromARGB(255, 138, 138, 138),
                            ),
                            Text(
                              meal.timeCook.trim(),
                              style: TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 138, 138, 138),
                              ),
                            ),
                          ]),
                        ),
                        Container(
                          width: 100,
                          child: Row(children: [
                            Icon(
                              Icons.room_service_outlined,
                              color: Color.fromARGB(255, 138, 138, 138),
                            ),
                            Text(
                              meal.serving.trim(),
                              style: TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 138, 138, 138),
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: 270,
                              child: Image(
                                image: AssetImage(
                                    "assets/images/${meal.imageName.trim()}"),
                                width: 280,
                                height: 180,
                              )),
                        ])
                  ]),
                ]),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                  "Ingredients",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: EdgeInsets.only(bottom: 20),
                child: ListView.builder(
                    itemCount: meal.ingredients.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(right: 10),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  'assets/images/${meal.ingredients[index].toString().trim()}')),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          color: Colors.redAccent,
                        ),
                      );
                    }),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 20),
                child: Text(
                  "Directions",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 500,
                child: ListView.builder(
                    itemCount: meal.directions.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          margin: EdgeInsets.only(bottom: 20),
                          width: 350,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.fiber_manual_record,
                                color: Colors.orange[800],
                                size: 12,
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: 10),
                                  width: 350,
                                  child: Text(
                                    meal.directions[index].toString().trim(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  )),
                            ],
                          ));
                    }),
              ),
            ],
          ),
        ));
  }
}
