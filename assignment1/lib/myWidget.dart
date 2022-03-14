import 'package:flutter/material.dart';

class myWidget extends StatelessWidget {
  String label;
  String value;
  myWidget(this.label, this.value);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          color: Colors.orange[100],
          border: Border.all(
            color: Colors.black,
            width: 1,
          )),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(child: myBox(value)),
          SizedBox(width: 160, child: myBox(label)),
        ],
      ),
    );
  }
}

class myBox extends StatelessWidget {
  String text;
  myBox(this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 3, 3, 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          color: Colors.white,
          border: Border.all(
            color: Colors.black,
            width: 1,
          )),
      child: Text(text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w200,
          )),
    );
  }
}
