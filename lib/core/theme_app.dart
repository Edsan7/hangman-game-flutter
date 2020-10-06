import 'package:flutter/material.dart';

final themeApp = ThemeData(
  primarySwatch: Colors.indigo,
  backgroundColor: Colors.grey,
  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
    bodyText1: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.indigo),
    button: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)
  ),
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
    height: 50,
    padding: EdgeInsets.all(20),
  ),
);
