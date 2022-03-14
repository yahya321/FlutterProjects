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
          centerTitle: true,
          title: Text("عاصمة فلسطين",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
        ),
        body: ListView(
          children: [
            Image.asset('assets/images/aqsa.jpg'),
            Text("مدينة القدس",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[700])),
            myWidget(
              'الاسم ',
              'القدس',
            ),
            myWidget(
              'المساحة ',
              '١٢٥ كم',
            ),
            myWidget(
              'السكان ',
              '٣٥٨٠٠٠ نسمة',
            ),
            myWidget(
              'الدولة ',
              'فلسطين',
            ),
            myWidget(
              'اسم الطالب ',
              'يحيى محمود ابو شاويش',
            ),
          ],
        ));
  }
}
