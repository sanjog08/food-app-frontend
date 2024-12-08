import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/mainpage.dart';
import 'package:food_app/sessionmanager.dart';
import 'package:food_app/splash_screen.dart';

import 'auth_wraper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final SessionManager _sessionManager = SessionManager();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food-App',
      debugShowCheckedModeBanner: false,
      // home: AuthWrapper(authenticatedScreen: MainPage()),
      home: SplashScreen(),
    );
  }
}