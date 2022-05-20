import 'package:finalproject/ui/pages/home.dart';
import 'package:finalproject/ui/pages/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Utilities/routes.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
          body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return Scaffold(
                body: Container(
              constraints: BoxConstraints.expand(),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/splashImg.png"),
                    fit: BoxFit.cover),
              ),
              child: Container(
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Image(
                    image: AssetImage("assets/images/Logo.png"),
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(0, 40, 0, 20),
                      child: Text(
                        "Cooking Done The Easy Way",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                        ),
                      )),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 260, 20, 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () {
                            Navigator.pushNamed(context, MyRoutes.registerPage);
                          },
                          color: Colors.orange[800],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "Register",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.fromLTRB(0, 50, 0, 20),
                            child: TextButton(
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, MyRoutes.loginPage);
                              },
                            )),
                      ],
                    ),
                  ),
                ]),
              ),
            ));
          }
        },
      ));

  // TODO: implement build

}
