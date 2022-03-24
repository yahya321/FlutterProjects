import 'package:assignment1/myWidget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Assignment1Screen(),
  ));
}

class Assignment1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text("SECOND ASSIGNMENT - 1",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
        ),
        drawer: Drawer(
          backgroundColor: Color.fromARGB(150, 255, 255, 255),
          child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: ListView(
                children: [
                  DrawerHeader(
                      child: Text("Flutter",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Colors.red,
                          ))),
                  ListTile(title: myWidget("Assignment2.1")),
                  ListTile(title: myWidget("يحيى محمود أبو شاويش")),
                  ListTile(title: myWidget("120170842")),
                  ListTile(title: myWidget("Drawer Button")),
                ],
              )),
        ),
        body: Container(
          color: Colors.red,
        ));
  }
}
