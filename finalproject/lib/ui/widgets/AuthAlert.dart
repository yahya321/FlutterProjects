import 'package:flutter/material.dart';

class AuthAlert extends StatelessWidget {
  String title;
  String content;
  AuthAlert({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
      title: Text(
        this.title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
      content: Text(
        this.content,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(
            'ok',
            style: TextStyle(
              fontSize: 14,
              color: Colors.orange[800],
            ),
          ),
          onPressed: () {
            Navigator.pop(context, 'OK');
          },
        )
      ],
      elevation: 24,
      backgroundColor: Colors.black,
    );
    ;
  }
}
