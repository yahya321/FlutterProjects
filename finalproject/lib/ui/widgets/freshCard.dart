import 'package:favorite_button/favorite_button.dart';
import 'package:finalproject/models/Meal.dart';
import 'package:finalproject/models/appUser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Utilities/routes.dart';
import '../../providers/firestore_provider.dart';

class FreshCard extends StatelessWidget {
  Meal meal;
  bool isFavorite;

  FreshCard({
    required this.meal,
    required this.isFavorite,
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: 240,
      height: 270,
      child: Card(
        color: Colors.black,
        child: InkWell(
            radius: 20,
            splashColor: Color.fromARGB(255, 60, 61, 63).withAlpha(30),
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.mealDescreptionPage);
            },
            child: Stack(
              children: [
                Container(
                  width: 180,
                  height: 265,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 63, 63, 63),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 70, top: 15),
                        child: FavoriteButton(
                          iconSize: 40.0,
                          isFavorite: isFavorite,
                          valueChanged: (_isFavorite) {
                            if (_isFavorite) {
                              AppUser.favorites.addAll([meal.name]);
                              Provider.of<FirestoreProvider>(context,
                                      listen: false)
                                  .addFavoriteMealToUser();
                            } else {
                              AppUser.favorites.remove(meal.id);
                              Provider.of<FirestoreProvider>(context,
                                      listen: false)
                                  .deleteFavoriteMealFromUser(meal.id);
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Text(
                            '${meal.type}',
                            style: TextStyle(
                              fontSize: 8,
                              color: Color.fromARGB(255, 8, 124, 153),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Text(
                            '${meal.name.trim()}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 160,
                        height: 30,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              for (int i = meal.rate.toInt(); i > 0; i--)
                                Icon(
                                  Icons.star,
                                  color: Colors.orange[800],
                                  size: 15,
                                ),
                              for (int i = 5 - meal.rate.toInt(); i > 0; i--)
                                Icon(
                                  Icons.star,
                                  color: Color.fromARGB(255, 141, 141, 141),
                                  size: 15,
                                ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Text(
                            '${meal.calories}',
                            style: TextStyle(
                              fontSize: 8,
                              color: Colors.orange[800],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        child: Container(
                            margin: EdgeInsets.only(bottom: 5),
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
                                      '${meal.timeCook}',
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
                                      '${meal.serving}',
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
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: SizedBox(
                      width: 150,
                      height: 150,
                      child: Image(
                        image: AssetImage("assets/images/${meal.imageName}"),
                      )),
                ),
              ],
            )),
      ),
    );
  }
}
