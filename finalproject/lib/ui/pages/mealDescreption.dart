import 'package:finalproject/ui/widgets/recommendedCard.dart';
import 'package:flutter/material.dart';
import 'package:finalproject/ui/widgets/myAppBar.dart';

import '../../Utilities/routes.dart';

class MealDescreptionPage extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
        appBar: MyAppBar.build(),
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 15, 15, 20),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 5),
                child: Text(
                  'Breakfast',
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
                          'French Toast with Berries',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                          child: IconButton(
                              onPressed: () {},
                              icon: IconButton(
                                icon: const Icon(
                                  Icons.favorite_outline,
                                  color: Color.fromARGB(255, 134, 134, 134),
                                ),
                                onPressed: () {},
                              ))),
                    ],
                  )),
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: Text(
                  '120 Calories',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.orange[800],
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.orange[800],
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.orange[800],
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.orange[800],
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.orange[800],
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.orange[800],
                      )
                    ],
                  )),
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
                              '10 mins',
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
                              '1 Serving',
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
                                    "assets/images/frenshtoast2.png"),
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
                    itemCount: 9,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(right: 10),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  AssetImage('assets/images/restorapry.png')),
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
                    itemCount: 13,
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
                                    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut.",
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
