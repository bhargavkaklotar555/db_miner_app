import 'package:db_miner/helpers/db_helper.dart';
import 'package:db_miner/views/screens/detail_page.dart';
import 'package:db_miner/views/screens/favrite_Page.dart';
import 'package:db_miner/views/screens/homepage.dart';
import 'package:db_miner/views/screens/search_page.dart';
import 'package:db_miner/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controoler/db_controller.dart';
import 'controoler/img_list.dart';
import 'controoler/quotes_controller.dart';
import 'controoler/spek_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.dbHelper.initDB();
  quoteapicontroller controller = Get.put(quoteapicontroller());

  speak_controller speak = Get.put(speak_controller());
  DB_Controller db_controller = Get.put(DB_Controller());
  All_Imges all_Imges = Get.put(All_Imges());
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
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
          name: '/Search_Page',
          page: () => Search_Page(),
        ),
        GetPage(
          name: '/',
          page: () => Splash_Screen(),
        ),
      ],
    );
  }
}
