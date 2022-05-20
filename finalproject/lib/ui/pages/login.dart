import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:string_validator/string_validator.dart';

import '../../Utilities/routes.dart';
import '../../providers/auth_provider.dart';
import '../widgets/AuthAlert.dart';

class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

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
          child: Form(
            key: formKey,
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
                    'Sign in',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!isEmail(value)) {
                      return "Please enter a valid email";
                    }
                    return null;
                  },
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
                child: TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 6) {
                      return 'Your Password less than 6 Charachtars';
                    }
                    return null;
                  },
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
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  alignment: AlignmentDirectional.centerEnd,
                  child: TextButton(
                    onPressed: () {
                      //forgot password screen
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(fontSize: 12),
                    ),
                  )),
              Container(
                height: 50,
                margin: EdgeInsets.fromLTRB(10, 50, 10, 0),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      String? logined = await Provider.of<AuthProvider>(context,
                              listen: false)
                          .login(emailController.text, passwordController.text);
                      if (logined != null) {
                        Navigator.popUntil(
                            context, ModalRoute.withName(MyRoutes.splashPage));
                        Navigator.pushNamed(context, MyRoutes.homePage);
                        showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AuthAlert(
                                  title: 'Login Succsseed',
                                  content: 'What would you like to cook today?',
                                ));
                      } else {
                        showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AuthAlert(
                                  title: 'Login Failed',
                                  content:
                                      'Please Enter A Valid Email or Password',
                                ));
                      }
                    }
                  },
                  color: Colors.orange[800],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Sign In",
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
                        'Dont have an account?',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 138, 138, 138),
                        ),
                      ),
                      TextButton(
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.orange[800],
                          ),
                        ),
                        onPressed: () {
                          Navigator.popUntil(context,
                              ModalRoute.withName(MyRoutes.splashPage));
                          Navigator.pushNamed(context, MyRoutes.registerPage);
                        },
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ))
            ]),
          ),
        ));
  }
}
