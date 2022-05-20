import 'package:finalproject/providers/app_provider.dart';
import 'package:finalproject/providers/auth_provider.dart';
import 'package:finalproject/providers/drawer_provider.dart';
import 'package:finalproject/providers/firestore_provider.dart';
import 'package:finalproject/ui/pages/favorites.dart';
import 'package:finalproject/ui/pages/home.dart';
import 'package:finalproject/ui/pages/login.dart';
import 'package:finalproject/ui/pages/mealDescreption.dart';
import 'package:finalproject/ui/pages/notification.dart';
import 'package:finalproject/ui/pages/recently.dart';
import 'package:finalproject/ui/pages/register.dart';
import 'package:finalproject/ui/pages/settings.dart';
import 'package:finalproject/ui/pages/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Utilities/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) {
      return DrawerProvider();
    }),
    Provider<AuthProvider>(
      create: (context) => AuthProvider(),
    ),
    Provider<FirestoreProvider>(
      create: (context) => FirestoreProvider(),
    ),
    Provider<AppProvider>(
      create: (context) => AppProvider(context: context),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        MyRoutes.splashPage: (context) => SplashPage(),
        MyRoutes.loginPage: (context) => LoginPage(),
        MyRoutes.registerPage: (context) => RegisterPage(),
        MyRoutes.homePage: (context) => HomePage(),
        MyRoutes.mealDescreptionPage: (context) => MealDescreptionPage(),
        MyRoutes.favoritesPage: (context) => FavoritesPage(),
        MyRoutes.recentlyPage: (context) => RecentlyPage(),
        MyRoutes.notificationPage: (context) => NotificationPage(),
        MyRoutes.settingsPage: (context) => SettingsPage(),
      },
    );
  }
}
