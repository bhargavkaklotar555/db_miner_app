import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:db_miner/controoler/spek_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';
import 'package:share_plus/share_plus.dart';

import '../../controoler/db_controller.dart';
import '../../controoler/img_list.dart';
import '../../controoler/quotes_controller.dart';
import '../../helpers/favrite_helper.dart';
import 'favrite_Page.dart';

class DetailPage extends StatelessWidget {
  RxBool isSelectd = false.obs;

  quoteapicontroller controller = Get.find<quoteapicontroller>();
  speak_controller speak = Get.find<speak_controller>();
  DB_Controller db_controller = Get.find<DB_Controller>();
  All_Imges all_Imges = Get.find<All_Imges>();

  String? text;
  DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    int index = ModalRoute.of(context)!.settings.arguments as int;
    text = controller.quote.value[index].quote;
    GlobalKey imageKey = GlobalKey();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${controller.quote.value[index].author}",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (Favrite_helper.favrite_helper.checkFirstTime) {
                Favrite_helper.favrite_helper.doneFirst();
                db_controller.addQuotes(
                    quotes: controller.quote.value[index].quote,
                    author: controller.quote.value[index].author);
              } else {
                Get.snackbar(
                  "Alredy",
                  "to your Wishlist",
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                  icon: Icon(
                    Icons.error,
                    color: Colors.white,
                  ),
                );
              }
            },
            icon: Icon(
              Favrite_helper.favrite_helper.checkFirstTime
                  ? Icons.favorite_border
                  : Icons.favorite,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () async {
              String a;
              String b;
              a = controller.quote.value[index].quote;
              b = "- ${controller.quote.value[index].author}";

              ShareExtend.share(
                a,
                b,
              );

              log('" ${controller.quote.value[index].quote} "');
              log("- ${controller.quote.value[index].author}");
            },
            icon: Icon(
              Icons.share,
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Obx(() {
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: s.height,
              width: s.width,
              // color: Colors.amber,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(all_Imges.currentImageAsset.value),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            '" ${controller.quote.value[index].quote} "',
                            style: GoogleFonts.lobster(
                              fontSize: 22,
                              wordSpacing: 1,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            children: [
                              const Spacer(),
                              Column(
                                children: [
                                  Text(
                                    "- ${controller.quote.value[index].author}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white,
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          speak.speak(text: text!);
                                        },
                                        icon: Icon(
                                          CupertinoIcons.speaker_2_fill,
                                          color: Colors.white,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          speak.stop();
                                        },
                                        icon: Icon(
                                          CupertinoIcons.speaker_slash_fill,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
