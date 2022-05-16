import 'package:flutter/material.dart';

import '../../Utilities/routes.dart';

class RegisterPage extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            color: const Color(0xff7c94b6),
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.8), BlendMode.darken),
              image: AssetImage("assets/images/splashImg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: <
              Widget>[
            Container(
              alignment: Alignment.center,
              child: const Image(
                image: AssetImage("assets/images/Logo.png"),
              ),
            ),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(0, 40, 0, 20),
                child: const Text(
                  'Register',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.person_outline,
                    color: Color.fromARGB(255, 138, 138, 138),
                  ),
                  border: InputBorder.none,
                  fillColor: Color.fromARGB(255, 138, 138, 138),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 138, 138, 138), width: 2),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 138, 138, 138)),
                  ),
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 138, 138, 138)),
                  labelText: 'Full Name',
                ),
                cursorColor: Color.fromARGB(255, 138, 138, 138),
                style: TextStyle(color: Color.fromARGB(255, 138, 138, 138)),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: Color.fromARGB(255, 138, 138, 138),
                  ),
                  border: InputBorder.none,
                  fillColor: Color.fromARGB(255, 138, 138, 138),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 138, 138, 138), width: 2),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 138, 138, 138)),
                  ),
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 138, 138, 138)),
                  labelText: 'Email Address',
                ),
                cursorColor: Color.fromARGB(255, 138, 138, 138),
                style: TextStyle(color: Color.fromARGB(255, 138, 138, 138)),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: Color.fromARGB(255, 138, 138, 138),
                  ),
                  border: InputBorder.none,
                  fillColor: Color.fromARGB(255, 138, 138, 138),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 138, 138, 138), width: 2),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 138, 138, 138)),
                  ),
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 138, 138, 138)),
                  labelText: 'Password',
                ),
                cursorColor: Color.fromARGB(255, 138, 138, 138),
                style: TextStyle(color: Color.fromARGB(255, 138, 138, 138)),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.fromLTRB(10, 70, 10, 0),
              child: MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: () {},
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
            ),
            Container(
                margin: EdgeInsets.fromLTRB(10, 150, 10, 0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Already registered?',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 138, 138, 138),
                      ),
                    ),
                    TextButton(
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.orange[800],
                        ),
                      ),
                      onPressed: () {
                        Navigator.popUntil(
                            context, ModalRoute.withName(MyRoutes.splashPage));
                        Navigator.pushNamed(context, MyRoutes.loginPage);
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ))
          ]),
        ));
  }
}
