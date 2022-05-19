import 'package:finalproject/ui/widgets/notificationCard.dart';
import 'package:finalproject/ui/widgets/recommendedCard.dart';
import 'package:flutter/material.dart';
import 'package:finalproject/ui/widgets/myAppBar.dart';

import '../../Utilities/routes.dart';
import '../widgets/FreshCard.dart';
import '../widgets/myDrawer.dart';

class SettingsPage extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

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
        child: ListView(children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Text(
              "Settings",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 63, 63, 63),
            ),
            child: ListTile(
              leading: Icon(Icons.language_outlined),
              title: Text(
                'Language',
                style: TextStyle(fontSize: 14),
              ),
              trailing: TextButton(
                  onPressed: () {},
                  child: Text(
                    'English',
                    style: TextStyle(fontSize: 14, color: Colors.orange[800]),
                  )),
              textColor: Colors.white,
              iconColor: Colors.white,
            ),
          ),
          Divider(
            color: Color.fromARGB(255, 63, 63, 63),
            thickness: 2,
          ),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              "Notifications",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            width: double.infinity,
            height: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 63, 63, 63),
            ),
            child: Column(children: [
              ListTile(
                leading: Icon(Icons.notifications_none),
                title: Text(
                  'Push Notifications',
                  style: TextStyle(fontSize: 14),
                ),
                trailing: Switch(
                  value: true,
                  onChanged: (value) {},
                  activeColor: Colors.orange[800],
                ),
                textColor: Colors.white,
                iconColor: Colors.white,
              ),
              Divider(
                color: Color.fromARGB(255, 104, 104, 104),
                thickness: 2,
              ),
              ListTile(
                leading: Icon(Icons.email_outlined),
                title: Text(
                  'Email Notifications',
                  style: TextStyle(fontSize: 14),
                ),
                trailing: Switch(
                  value: true,
                  onChanged: (value) {},
                  activeColor: Colors.orange[800],
                ),
                textColor: Colors.white,
                iconColor: Colors.white,
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
