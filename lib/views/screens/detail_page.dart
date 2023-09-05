import 'dart:io';
import 'dart:ui';

import 'package:db_miner/controoler/spek_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';
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
        title: const Text(
          "Detail Page",
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
              RenderRepaintBoundary bountry = imageKey.currentContext!
                  .findRenderObject() as RenderRepaintBoundary;
              var img = await bountry.toImage(
                pixelRatio: 5,
              );
              var bit = await img.toByteData(format: ImageByteFormat.png);
              var uList = bit!.buffer.asUint8List();

              print(".................................");
              print(uList.toString());
              print(".................................");

              if (uList != null) {
                Directory dir = await getApplicationDocumentsDirectory();

                DateTime d = DateTime.now();
                File file = await File(
                        "${dir.path}/FA${d.year}${d.month}${d.day}${d.hour}${d.minute}${d.second}.png")
                    .create();
                await file.writeAsBytes(uList);

                print(".................................");

                print("Image path: ${file.path}");
                print(".................................");

                Share.shareXFiles([XFile(file.path)]);
              }
            },
            icon: Icon(
              Icons.share,
              color: Colors.white,
            ),
          )
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
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          ),
                          Row(
                            children: [
                              const Spacer(),
                              Text(
                                "- ${controller.quote.value[index].author}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                    fontSize: 16),
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
