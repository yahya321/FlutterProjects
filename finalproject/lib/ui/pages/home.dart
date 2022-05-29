import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/models/appUser.dart';
import 'package:finalproject/ui/widgets/recommendedCard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:finalproject/ui/widgets/myAppBar.dart';
import 'package:provider/provider.dart';
import '../../Utilities/routes.dart';
import '../../models/Meal.dart';
import '../../providers/firestore_provider.dart';
import '../widgets/FreshCard.dart';
import '../widgets/myDrawer.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Map<String, dynamic>>>? mealFreshList;
  List<Map<String, dynamic>>? retrievedMealFreshList;

  Future<List<Map<String, dynamic>>>? mealRecommendedList;
  List<Map<String, dynamic>>? retrievedmealRecommendedList;

  @override
  void initState() {
    AppUser.id = FirebaseAuth.instance.currentUser!.uid;
    _init2Retrieval();

    super.initState();
    _initRetrieval();
    _init3Retrieval();

  }

  Future<void> _initRetrieval() async {
    mealFreshList = Provider.of<FirestoreProvider>(context, listen: false)
        .getAllFreshMealsFromFirestore();
    retrievedMealFreshList =
        await Provider.of<FirestoreProvider>(context, listen: false)
            .getAllFreshMealsFromFirestore();
  }

  Future<void> _init2Retrieval() async {
    mealRecommendedList = Provider.of<FirestoreProvider>(context, listen: false)
        .getAllRecommendedMealsFromFirestore();
    retrievedmealRecommendedList =
        await Provider.of<FirestoreProvider>(context, listen: false)
            .getAllRecommendedMealsFromFirestore();
  }

  Future<void> _init3Retrieval() async {
    
    Provider.of<FirestoreProvider>(context, listen: false)
        .getAllListFavoritesUserMeals();
  }

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: true,
      appBar: NavBar(),
      drawer: DrawerScreen(),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 15, 15, 20),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text(
                "Bonjour, Emma",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text(
                "What would you like to cook today?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
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
                margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: Column(children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          "Today's Fresh Recipes",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                          child: TextButton(
                              child: Text(
                                'See All',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.orange[800],
                                ),
                              ),
                              onPressed: () {})),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: 280,
                    child: FutureBuilder<List<Map<String, dynamic>>>(
                      future: mealFreshList,
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                        // Checking if future is resolved or not
                        if (snapshot.connectionState == ConnectionState.done) {
                          // If we got an error
                          if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                '${snapshot.error} occured ',
                                style:
                                    TextStyle(fontSize: 18, color: Colors.red),
                              ),
                            );

                            // if we got our data
                          } else if (snapshot.hasData &&
                              snapshot.data!.isNotEmpty) {
                            // Extracting data from snapshot object
                            return ListView.builder(
                                itemCount: retrievedMealFreshList!.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  Meal m = Meal(
                                      id: retrievedMealFreshList![index]
                                          ['name'],
                                      calories: retrievedMealFreshList![index]
                                          ['calories'],
                                      imageName: retrievedMealFreshList![index]
                                          ['imageName'],
                                      isRecommended:
                                          retrievedMealFreshList![index]
                                              ['isRecommended'],
                                      isToday: retrievedMealFreshList![index]
                                          ['isToday'],
                                      name: retrievedMealFreshList![index]
                                          ['name'],
                                      rate: retrievedMealFreshList![index]
                                          ['rate'],
                                      serving: retrievedMealFreshList![index]
                                          ['serving'],
                                      timeCook: retrievedMealFreshList![index]
                                          ['timeCook'],
                                      type: retrievedMealFreshList![index]
                                          ['type'],
                                      directions: retrievedMealFreshList![index]
                                          ['directions'],
                                      ingredients:
                                          retrievedMealFreshList![index]
                                              ['ingredients']);

                                  bool isFavorite =
                                      AppUser.favorites.contains(m.name.trim());
                                  return FreshCard(
                                      meal: m, isFavorite: isFavorite);
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
                  ),
                ])),
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: Column(children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "Recommended",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                        child: TextButton(
                      child: Text(
                        'See All',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.orange[800],
                        ),
                      ),
                      onPressed: () {},
                    )),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 500,
                  child: FutureBuilder<List<Map<String, dynamic>>>(
                    future: mealRecommendedList,
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
                        } else if (snapshot.hasData &&
                            snapshot.data!.isNotEmpty) {
                          // Extracting data from snapshot object
                          return ListView.builder(
                              itemCount: retrievedmealRecommendedList!.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (BuildContext context, int index) {
                                Meal recommendedMeal = Meal(
                                    id: retrievedmealRecommendedList![index]
                                        ['name'],
                                    calories: retrievedmealRecommendedList![index]
                                        ['calories'],
                                    imageName: retrievedmealRecommendedList![index]
                                        ['imageName'],
                                    isRecommended: retrievedmealRecommendedList![index]
                                        ['isRecommended'],
                                    isToday: retrievedmealRecommendedList![index]
                                        ['isToday'],
                                    name: retrievedmealRecommendedList![index]
                                        ['name'],
                                    rate: retrievedmealRecommendedList![index]
                                        ['rate'],
                                    serving: retrievedmealRecommendedList![index]
                                        ['serving'],
                                    timeCook: retrievedmealRecommendedList![index]
                                        ['timeCook'],
                                    type: retrievedmealRecommendedList![index]
                                        ['type'],
                                    directions: retrievedmealRecommendedList![index]
                                        ['directions'],
                                    ingredients: retrievedmealRecommendedList![index]
                                        ['ingredients']);

                                bool isFavorite = AppUser.favorites
                                    .contains(recommendedMeal.name.trim());

                                return RecommendedCard(
                                    meal: recommendedMeal,
                                    isFavorite: isFavorite);
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
          ],
        ),
      ));
}
