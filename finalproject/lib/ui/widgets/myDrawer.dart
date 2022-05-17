import 'package:flutter/material.dart';

import '../../Utilities/routes.dart';

class DrawerScreen extends StatefulWidget {
  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  bool homeSelected = true;
  bool favoritesSelected = false;
  bool recentlySelected = false;
  bool settingsSelected = false;
  bool aboutSelected = false;
  bool helpSelected = false;
  bool signOutSelected = false;
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
            selected: homeSelected,
            selectedColor: Colors.orange[800],
            textColor: Color.fromARGB(255, 138, 138, 138),
            iconColor: Color.fromARGB(255, 138, 138, 138),
            onTap: () {
              unSelectALL();
              homeSelected = true;
              setState(() {});
              Navigator.popUntil(
                  context, ModalRoute.withName(MyRoutes.homePage));
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite_border),
            title: Text(
              'Favorites',
              style: TextStyle(fontSize: 14),
            ),
            selected: favoritesSelected,
            selectedColor: Colors.orange[800],
            textColor: Color.fromARGB(255, 138, 138, 138),
            iconColor: Color.fromARGB(255, 138, 138, 138),
            onTap: () {
              unSelectALL();
              favoritesSelected = true;
              setState(() {});
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
            selected: recentlySelected,
            selectedColor: Colors.orange[800],
            textColor: Color.fromARGB(255, 138, 138, 138),
            iconColor: Color.fromARGB(255, 138, 138, 138),
            onTap: () {
              unSelectALL();
              recentlySelected = true;
              setState(() {});
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
            selected: settingsSelected,
            selectedColor: Colors.orange[800],
            textColor: Color.fromARGB(255, 138, 138, 138),
            iconColor: Color.fromARGB(255, 138, 138, 138),
            onTap: () {
              unSelectALL();
              settingsSelected = true;
              setState(() {});
            },
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text(
              'About Us',
              style: TextStyle(fontSize: 14),
            ),
            selected: aboutSelected,
            selectedColor: Colors.orange[800],
            textColor: Color.fromARGB(255, 138, 138, 138),
            iconColor: Color.fromARGB(255, 138, 138, 138),
            onTap: () {
              unSelectALL();
              aboutSelected = true;
              setState(() {});
            },
          ),
          ListTile(
            leading: Icon(Icons.help_outline),
            title: Text(
              'Help',
              style: TextStyle(fontSize: 14),
            ),
            selected: helpSelected,
            selectedColor: Colors.orange[800],
            textColor: Color.fromARGB(255, 138, 138, 138),
            iconColor: Color.fromARGB(255, 138, 138, 138),
            onTap: () {
              unSelectALL();
              helpSelected = true;
              setState(() {});
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text(
              'Sign Out',
              style: TextStyle(fontSize: 14),
            ),
            selected: signOutSelected,
            selectedColor: Colors.orange[800],
            textColor: Color.fromARGB(255, 138, 138, 138),
            iconColor: Color.fromARGB(255, 138, 138, 138),
            onTap: () {
              unSelectALL();
              signOutSelected = true;
              setState(() {});
            },
          ),
        ]));
  }

  unSelectALL() {
    homeSelected = false;
    favoritesSelected = false;
    recentlySelected = false;
    settingsSelected = false;
    aboutSelected = false;
    helpSelected = false;
    signOutSelected = false;
  }
}
