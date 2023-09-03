import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controoler/db_controller.dart';

class Favrite_Page extends StatelessWidget {
  const Favrite_Page({super.key});

  @override
  Widget build(BuildContext context) {
    DB_Controller data = Get.find<DB_Controller>();
    double s = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Favrite_Page"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: FutureBuilder(
          future: data.getAllQuotes(),
          builder: (context, snap) {
            if (snap.hasData) {
              if (snap.data!.isEmpty) {
                return const Center(
                  child: Text(
                    "Empty Data",
                    style: TextStyle(fontSize: 24),
                  ),
                );
              } else {
                return ListView(
                  children: [
                    Text(
                      data.allQuotes.value.toString(),
                    ),
                  ],
                );
              }
            } else if (snap.hasError) {
              return Center(
                child: Text("${snap.error}"),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
