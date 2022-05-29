import 'package:finalproject/providers/drawer_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Utilities/routes.dart';
import 'AuthAlert.dart';

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
                        backgroundImage:
                            AssetImage("assets/images/Ellipse3.png"),
                        radius: 30,
                      )
                    ]),
                    Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                child: Text(
                              "Emma Holmes",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            )),
                            Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Text(
                                  "View Profile",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                )),
                          ],
                        )),
                  ],
                ),
              ])),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              'Home',
              style: TextStyle(fontSize: 14),
            ),
            selected: Provider.of<DrawerProvider>(context).homeSelected,
            selectedColor: Colors.orange[800],
            textColor: Color.fromARGB(255, 138, 138, 138),
            iconColor: Color.fromARGB(255, 138, 138, 138),
            onTap: () {
              Provider.of<DrawerProvider>(context, listen: false)
                  .madeSelected(1);
              Navigator.pushNamed(context, MyRoutes.homePage);
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite_border),
            title: Text(
              'Favorites',
              style: TextStyle(fontSize: 14),
            ),
            selected: Provider.of<DrawerProvider>(context).favoritesSelected,
            selectedColor: Colors.orange[800],
            textColor: Color.fromARGB(255, 138, 138, 138),
            iconColor: Color.fromARGB(255, 138, 138, 138),
            onTap: () {
              Provider.of<DrawerProvider>(context, listen: false)
                  .madeSelected(2);
              Navigator.popUntil(
                  context, ModalRoute.withName(MyRoutes.homePage));
              Navigator.pushNamed(context, MyRoutes.favoritesPage);
            },
          ),
          ListTile(
            leading: Icon(Icons.play_arrow),
            title: Text(
              'Recently Viewed',
              style: TextStyle(fontSize: 14),
            ),
            selected: Provider.of<DrawerProvider>(context).recentlySelected,
            selectedColor: Colors.orange[800],
            textColor: Color.fromARGB(255, 138, 138, 138),
            iconColor: Color.fromARGB(255, 138, 138, 138),
            onTap: () {
              Provider.of<DrawerProvider>(context, listen: false)
                  .madeSelected(3);
              Navigator.popUntil(
                  context, ModalRoute.withName(MyRoutes.homePage));
              Navigator.pushNamed(context, MyRoutes.recentlyPage);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'Settings',
              style: TextStyle(fontSize: 14),
            ),
            selected: Provider.of<DrawerProvider>(context).settingsSelected,
            selectedColor: Colors.orange[800],
            textColor: Color.fromARGB(255, 138, 138, 138),
            iconColor: Color.fromARGB(255, 138, 138, 138),
            onTap: () {
              Provider.of<DrawerProvider>(context, listen: false)
                  .madeSelected(4);
              Navigator.popUntil(
                  context, ModalRoute.withName(MyRoutes.homePage));
              Navigator.pushNamed(context, MyRoutes.settingsPage);
            },
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text(
              'About Us',
              style: TextStyle(fontSize: 14),
            ),
            selected: false,
            selectedColor: Colors.orange[800],
            textColor: Color.fromARGB(255, 138, 138, 138),
            iconColor: Color.fromARGB(255, 138, 138, 138),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.help_outline),
            title: Text(
              'Help',
              style: TextStyle(fontSize: 14),
            ),
            selected: false,
            selectedColor: Colors.orange[800],
            textColor: Color.fromARGB(255, 138, 138, 138),
            iconColor: Color.fromARGB(255, 138, 138, 138),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text(
              'Sign Out',
              style: TextStyle(fontSize: 14),
            ),
            selected: false,
            selectedColor: Colors.orange[800],
            textColor: Color.fromARGB(255, 138, 138, 138),
            iconColor: Color.fromARGB(255, 138, 138, 138),
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.popUntil(
                  context, ModalRoute.withName(MyRoutes.splashPage));
              Navigator.pushNamed(context, MyRoutes.splashPage);
              showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AuthAlert(
                        title: 'Logout Succsses',
                        content: 'See you next time',
                      ));
            },
          ),
        ]));
  }
}
