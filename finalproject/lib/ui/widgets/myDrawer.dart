import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
        backgroundColor: Color.fromARGB(255, 66, 66, 66),
        child: ListView(children: [
          DrawerHeader(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/images/Logo.png"),
                        radius: 25,
                      )
                    ]),
                    Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                        child: Column(
                          children: [
                            Text(
                              "Emma Holmes",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "View Profile",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ])),
        ]));
  }
}
