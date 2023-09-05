import 'package:db_miner/views/screens/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../controoler/db_controller.dart';
import '../../controoler/img_list.dart';
import '../../controoler/quotes_controller.dart';
import '../../helpers/db_helper.dart';
import '../../helpers/favrite_helper.dart';
import 'detail_page.dart';
import 'favrite_Page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  quoteapicontroller controller = Get.find<quoteapicontroller>();
  DB_Controller data = Get.find<DB_Controller>();
  All_Imges all_Imges = Get.find<All_Imges>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DB Miner"),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(
                Search_Page(),
              );
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              Get.to(
                Favrite_Page(),
              );
            },
            icon: Icon(Icons.favorite),
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
                      all_Imges.changeImage();
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
