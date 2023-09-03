import 'package:db_miner/views/screens/detail_page.dart';
import 'package:db_miner/views/screens/homepage.dart';
import 'package:db_miner/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controoler/theme_controller.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final themeController themecontroller = Get.put(themeController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness:
            themecontroller.theme.value ? Brightness.light : Brightness.dark,
      ),
      getPages: [
        GetPage(
          name: '/HomePage',
          page: () => HomePage(),
        ),
        GetPage(
          name: '/DetailPage',
          page: () => DetailPage(),
        ),
        GetPage(
          name: '/',
          page: () => Splash_Screen_Page(),
        ),
      ],
    );
  }
}
