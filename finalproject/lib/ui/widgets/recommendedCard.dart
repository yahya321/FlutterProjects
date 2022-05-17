import 'package:flutter/material.dart';
import '../../Utilities/routes.dart';

class RecommendedCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      color: Colors.black,
      child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            Navigator.popUntil(context, ModalRoute.withName(MyRoutes.homePage));
            Navigator.pushNamed(context, MyRoutes.mealDescreptionPage);
          },
          child: cardLayout),
    );
  }

  final cardLayout = Container(
    width: double.infinity,
    height: 140,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Color.fromARGB(255, 63, 63, 63),
    ),
    child: Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/images/frenshtoast2.png"),
              width: 120,
              height: 120,
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 10),
              child: Text(
                'Breakfast',
                style: TextStyle(
                  fontSize: 8,
                  color: Color.fromARGB(255, 8, 124, 153),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                'French Toast with Berries',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
            Row(
              children: [
                Container(
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
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    '120 Calories',
                    style: TextStyle(
                      fontSize: 8,
                      color: Colors.orange[800],
                    ),
                  ),
                ),
              ],
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
                          '10 mins',
                          style: TextStyle(
                            fontSize: 8,
                            color: Color.fromARGB(255, 138, 138, 138),
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
                          '1 Serving',
                          style: TextStyle(
                            fontSize: 8,
                            color: Color.fromARGB(255, 138, 138, 138),
                          ),
                        ),
                      ]),
                    ),
                  ],
                )),
          ],
        ),
        Spacer(),
        Column(
          children: [
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
        ),
      ],
    ),
  );
}
