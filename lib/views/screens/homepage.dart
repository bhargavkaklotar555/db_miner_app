import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../controoler/quotes_controller.dart';
import '../../controoler/theme_controller.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  themeController theme = Get.find<themeController>();
  quoteapicontroller controller = Get.find<quoteapicontroller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DB Miner"),
        actions: [
          IconButton(
            onPressed: () {
              theme.changeTheme();
            },
            icon: Icon(Icons.dark_mode),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Obx(() {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: controller.quote.value.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Get.to(
                        DetailPage(),
                        arguments: index,
                      );
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(
                          controller.quote.value[index].quote,
                          maxLines: 2,
                        ),
                        leading: CircleAvatar(
                          radius: 22,
                          child: Text("${index + 1}"),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
