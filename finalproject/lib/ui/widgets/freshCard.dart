import 'package:flutter/material.dart';
import '../../Utilities/routes.dart';

class FreshCard extends StatelessWidget {
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
          child: Stack(
            children: [
              cardLayout,
              Container(
                  margin: EdgeInsets.fromLTRB(55, 0, 0, 0),
                  child: Image(
                    image: AssetImage("assets/images/frenshtoast2.png"),
                    width: 150,
                    height: 130,
                  )),
            ],
          )),
    );
  }

  final cardLayout = Container(
    width: 180,
    height: 230,
    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Color.fromARGB(255, 63, 63, 63),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: EdgeInsets.only(bottom: 50),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_outline,
                color: Color.fromARGB(255, 134, 134, 134),
              ),
            )),
        Container(
          margin: EdgeInsets.only(bottom: 5),
          child: Text(
            'Breakfast',
            style: TextStyle(
              fontSize: 8,
              color: Color.fromARGB(255, 8, 124, 153),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 5),
          child: Text(
            'French Toast with Berries',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
        Container(
            margin: EdgeInsets.only(bottom: 5),
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
          margin: EdgeInsets.only(bottom: 5),
          child: Text(
            '120 Calories',
            style: TextStyle(
              fontSize: 8,
              color: Colors.orange[800],
            ),
          ),
        ),
        Container(
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
  );
}
