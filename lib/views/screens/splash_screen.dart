import 'dart:async';

import 'package:db_miner/views/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Splash_Screen_Page extends StatefulWidget {
  const Splash_Screen_Page({Key? key}) : super(key: key);

  @override
  State<Splash_Screen_Page> createState() => _Splash_Screen_PageState();
}

class _Splash_Screen_PageState extends State<Splash_Screen_Page> {
  void MySplash() {
    Timer.periodic(
      const Duration(seconds: 3),
      (tick) {
        Get.off(
          () => HomePage(),
        );
        tick.cancel();
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    MySplash();
  }

  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              child: Image.asset(
                "assets/images/app_logo.png",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: s.height * 0.2,
            ),
            CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xff363636),
    );
  }
}
