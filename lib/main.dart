import 'package:custom_splash/custom_splash.dart';
import 'package:flutter/material.dart';
import 'package:hangman_game/core/constants.dart';
import 'package:hangman_game/core/theme_app.dart';
import 'package:hangman_game/views/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: GAME_TITLE,
      theme: themeApp,
      home: CustomSplash(
        imagePath: 'assets/images/hangman00.png',
        animationEffect: 'fade-in',
        duration: 3000,
        logoSize: 200,
        backGroundColor: Colors.indigo,
        home: HomePage(),
      ),
    );
  }
}
