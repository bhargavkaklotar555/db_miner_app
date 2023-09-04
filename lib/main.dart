import 'package:db_miner/helpers/db_helper.dart';
import 'package:db_miner/views/screens/detail_page.dart';
import 'package:db_miner/views/screens/favrite_Page.dart';
import 'package:db_miner/views/screens/homepage.dart';
import 'package:db_miner/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controoler/quotes_controller.dart';
import 'controoler/theme_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.dbHelper.initDB();
  themeController themecontroller = Get.put(themeController());
  quoteapicontroller controller = Get.put(quoteapicontroller());
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  themeController themecontroller = Get.find<themeController>();

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
          name: '/Favrite_Page',
          page: () => Favrite_Page(),
        ),
        GetPage(
          name: '/',
          page: () => Splash_Screen(),
        ),
      ],
    );
  }
}
