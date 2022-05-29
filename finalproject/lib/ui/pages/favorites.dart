import 'package:finalproject/ui/widgets/recommendedCard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:finalproject/ui/widgets/myAppBar.dart';
import 'package:provider/provider.dart';

import '../../Utilities/routes.dart';
import '../../models/Meal.dart';
import '../../models/appUser.dart';
import '../../providers/firestore_provider.dart';
import '../widgets/FreshCard.dart';
import '../widgets/myDrawer.dart';

class FavoritesPage extends StatefulWidget {
  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  TextEditingController searchController = TextEditingController();
  Future<List<Map<String, dynamic>>>? mealsList;
  List<Map<String, dynamic>>? retrievedmealsList;

  @override
  void initState() {
    AppUser.id = FirebaseAuth.instance.currentUser!.uid;

    super.initState();
    _init2Retrieval();
    _init3Retrieval();
  }

  Future<void> _init2Retrieval() async {
    mealsList = Provider.of<FirestoreProvider>(context, listen: false)
        .getAllMealsFromFirestore();
    retrievedmealsList =
        await Provider.of<FirestoreProvider>(context, listen: false)
            .getAllMealsFromFirestore();
  }

  Future<void> _init3Retrieval() async {
    Provider.of<FirestoreProvider>(context, listen: false)
        .getAllListFavoritesUserMeals();

    Provider.of<FirestoreProvider>(context, listen: false)
        .getAllListRecentlyUserMeals();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      appBar: NavBar(),
      drawer: DrawerScreen(),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 15, 15, 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text(
              "Favorites",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 30),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 63, 63, 63),
                      ),
                      width: 300,
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Color.fromARGB(255, 138, 138, 138),
                            ),
                            hintText: 'Search for recipes',
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 138, 138, 138)),
                            fillColor: Colors.grey,
                            hoverColor: Colors.grey,
                            border: InputBorder.none,
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 138, 138, 138))),
                        cursorColor: Color.fromARGB(255, 138, 138, 138),
                        style: TextStyle(
                            color: Color.fromARGB(255, 138, 138, 138)),
                      ),
                    ),
                    Spacer(),
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 63, 63, 63),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.reorder,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        )),
                  ])),
          Container(
            width: double.infinity,
            height: 633,
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: mealsList,
              builder: (BuildContext context,
                  AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                // Checking if future is resolved or not
                if (snapshot.connectionState == ConnectionState.done) {
                  // If we got an error
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        '${snapshot.error} occured ',
                        style: TextStyle(fontSize: 18, color: Colors.red),
                      ),
                    );

                    // if we got our data
                  } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    // Extracting data from snapshot object
                    return ListView.builder(
                        itemCount: retrievedmealsList!.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          Meal meal = Meal(
                            id: retrievedmealsList![index]['name'],
                            calories: retrievedmealsList![index]['calories'],
                            imageName: retrievedmealsList![index]['imageName'],
                            isRecommended: retrievedmealsList![index]
                                ['isRecommended'],
                            isToday: retrievedmealsList![index]['isToday'],
                            name: retrievedmealsList![index]['name'],
                            rate: retrievedmealsList![index]['rate'],
                            serving: retrievedmealsList![index]['serving'],
                            timeCook: retrievedmealsList![index]['timeCook'],
                            type: retrievedmealsList![index]['type'],
                            directions: retrievedmealsList![index]
                                ['directions'],
                            ingredients: retrievedmealsList![index]
                                ['ingredients'],
                          );

                          print("iam recocc ${meal.name}");

                          if (AppUser.favorites.contains(meal.name.trim())) {
                            return RecommendedCard(
                                meal: meal, isFavorite: true);
                          } else {
                            return SizedBox.shrink();
                          }
                        });
                  }
                }

                // Displaying LoadingSpinner to indicate waiting state
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.orange[800],
                  ),
                );
              },
            ),
          )
        ]),
      ),
    );
    ;
  }
}
