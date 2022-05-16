import 'package:flutter/material.dart';
import 'package:login_todo_database/test_provider.dart';
import 'package:login_todo_database/ui/screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: testHive(),
    );
  }
}

class testHive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider<TestProvider>(
      create: (context) => TestProvider(),
      child: Scaffold(
        body: Builder(builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(Provider.of<TestProvider>(context).title),
              RaisedButton(onPressed: () {
                Provider.of<TestProvider>(context, listen: false)
                    .changeTitle('value');
              })
            ],
          );
        }),
      ),
    );
  }
}
