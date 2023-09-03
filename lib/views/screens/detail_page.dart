import 'package:db_miner/controoler/spek_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controoler/db_controller.dart';
import '../../controoler/quotes_controller.dart';
import 'favrite_Page.dart';

class DetailPage extends StatelessWidget {
  quoteapicontroller controller = Get.find<quoteapicontroller>();
  speak_controller speak = Get.put(speak_controller());
  DB_Controller db_controller = Get.put(DB_Controller());

  String? text;
  DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    text = controller.quote.value[index].quote;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Detail Page"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: [
                Card(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          controller.quote.value[index].quote,
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            Text(
                              "- ${controller.quote.value[index].author}",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        speak.speak(text: text!);
                      },
                      icon: Icon(CupertinoIcons.speaker_2_fill),
                    ),
                    IconButton(
                      onPressed: () {
                        speak.stop();
                      },
                      icon: Icon(CupertinoIcons.speaker_slash_fill),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        db_controller.addQuotes(
                            quotes: controller.quote.value[index].quote,
                            author: controller.quote.value[index].author);
                      },
                      icon: const Icon(Icons.favorite_border),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(Favrite_Page());
          },
          child: Icon(Icons.next_plan),
        ));
  }
}
