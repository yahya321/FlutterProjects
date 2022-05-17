import 'package:finalproject/ui/widgets/recommendedCard.dart';
import 'package:flutter/material.dart';
import 'package:finalproject/ui/widgets/myAppBar.dart';

import '../../Utilities/routes.dart';
import '../widgets/FreshCard.dart';
import '../widgets/myDrawer.dart';

class HomePage extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
        appBar: MyAppBar.build(),
        drawer: DrawerScreen(),
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 15, 15, 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        onPressed: () {},
                      )),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: 240,
                    child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return FreshCard();
                        }),
                  )
                ]),
              ),
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
                    height: 233,
                    child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return RecommendedCard();
                        }),
                  )
                ]),
              ),
            ],
          ),
        ));
  }
}
