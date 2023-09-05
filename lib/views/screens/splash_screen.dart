import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:db_miner/views/screens/homepage.dart';
import 'package:flutter/material.dart';

class Splash_Screen extends StatelessWidget {
  Splash_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: Image.asset("assets/images/app_logo.png"),
        nextScreen: HomePage(),
        duration: 3000,
        backgroundColor: Color(0xff363436),
      ),
    );
  }
}
