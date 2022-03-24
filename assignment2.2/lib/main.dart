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
        title: Text("SECOND ASSIGNMENT - 2",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
      ),
      body: Row(children: [
        Expanded(
            child: Column(
          children: [
            myWidget("Flutter"),
            myWidget("Assginment2.2"),
            myWidget("يحيى محمود أبو شاويش"),
            myWidget("120170842"),
            myWidget("SPLIT SCREEN"),
          ],
        )),
        Expanded(
            child: Container(
          color: Colors.red,
        ))
      ]),
    );
  }
}
