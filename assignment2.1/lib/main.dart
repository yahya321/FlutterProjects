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

class StatefulTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StatefulTestState();
  }
}

// create widgets or screens
class StatefulTestState extends State<StatefulWidget> {
  bool isDark = false;
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: isDark ? Colors.black : Colors.white,
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('content',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20, color: isDark ? Colors.white : Colors.black)),
            ElevatedButton(
              child: const Text('change content'),
              onPressed: () {
                isDark = !isDark;
                setState(() {});
              },
            ),
            ElevatedButton(
              child: const Text('print isDark value'),
              onPressed: () {},
            )
          ],
        ));
  }
}
