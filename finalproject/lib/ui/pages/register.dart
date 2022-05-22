import 'package:finalproject/models/appUser.dart';
import 'package:finalproject/providers/firestore_provider.dart';
import 'package:finalproject/ui/widgets/AuthAlert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:string_validator/string_validator.dart';
import '../../Utilities/routes.dart';
import '../../providers/auth_provider.dart';

class RegisterPage extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey();
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
                    'Register',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
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
                height: 50,
                margin: EdgeInsets.fromLTRB(10, 70, 10, 0),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      AppUser user = new AppUser(
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text);

                      String? userID = await Provider.of<AuthProvider>(context,
                              listen: false)
                          .createNewAccount(user);
                      AppUser.id = userID;

                      Provider.of<FirestoreProvider>(context, listen: false)
                          .addUserToFirestore(user);

                      Navigator.popUntil(
                          context, ModalRoute.withName(MyRoutes.splashPage));
                      Navigator.pushNamed(context, MyRoutes.loginPage);
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AuthAlert(
                                title: 'Register Succssesfully',
                                content:
                                    'Now you can Login with your registeration info',
                              ));
                    }
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
                          Navigator.popUntil(context,
                              ModalRoute.withName(MyRoutes.splashPage));
                          Navigator.pushNamed(context, MyRoutes.loginPage);
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
