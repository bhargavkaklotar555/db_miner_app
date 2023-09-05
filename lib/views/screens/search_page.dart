import 'package:db_miner/helpers/quotes_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controoler/db_controller.dart';

class Search_Page extends StatelessWidget {
  DB_Controller db_controller = Get.find<DB_Controller>();

  Search_Page({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                onChanged: (val) {
                  db_controller.searchData(val: val);
                },
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.8,
                child: Obx(
                  () {
                    return ListView.builder(
                      itemCount: db_controller.searchdata.value.length,
                      itemBuilder: (context, index) {
                        Quotesmodals modal =
                            db_controller.searchdata.value[index];
                        return ListTile(
                          title: Text(modal.quote),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
