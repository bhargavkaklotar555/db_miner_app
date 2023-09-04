import 'dart:developer';

import 'package:db_miner/helpers/quotes_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();

  static final DBHelper dbHelper = DBHelper._();

  late Database database;

  String quotesTable = "Quotes_App_Table";

  String qtId = "Id";
  String qtQuotes = "QUOTE";
  String qtAuthor = "AUTHOR";

  initDB() async {
    String dbPath = await getDatabasesPath();
    String dbName = "demo2.db";

    String finalPath = join(dbPath, dbName);

    database = await openDatabase(
      finalPath,
      version: 1,
      onCreate: (db, version) {
        db
            .execute(
                'CREATE TABLE $quotesTable ( $qtId INTEGER PRIMARY KEY AUTOINCREMENT , $qtQuotes TEXT , $qtAuthor TEXT ) ')
            .then(
              (value) => log("Transaction Table are Created : DONE "),
            );
      },
    );
  }

  insertQuotes({required String quotes, required String author}) async {
    String query =
        " INSERT INTO $quotesTable($qtQuotes,$qtAuthor) VALUES( ? , ? ) ";

    List args = [quotes, author];

    int Quotes = await database.rawInsert(query, args);
    Get.snackbar("data", "added!!", backgroundColor: Colors.green);

    return Quotes;
  }

  displayQuotes() async {
    String query = "SELECT * FROM $quotesTable ";

    List quotes = await database.rawQuery(query);
    log(quotes.toString());

    List<Quotesmodals> allQuotes =
        quotes.map((e) => Quotesmodals.fromMap(data: e)).toList();

    return allQuotes;
  }
}
