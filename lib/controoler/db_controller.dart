import 'dart:developer';
import 'package:db_miner/helpers/db_helper.dart';
import 'package:db_miner/helpers/quotes_modal.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class DB_Controller extends GetxController {
  RxList<Quotesmodals> allQuotes = <Quotesmodals>[].obs;
  RxList<Quotesmodals> searchdata = <Quotesmodals>[].obs;

  QuotesController() {
    init();
  }

  init() async {
    allQuotes(await DBHelper.dbHelper.displayQuotes());
    allQuotes.value.forEach((element) {
      log("Data: ${element.id} => ${element.quote}");
    });
  }

  Future<int> addQuotes(
      {required String quotes, required String author}) async {
    log("${quotes} or ${author}");
    return await DBHelper.dbHelper.insertQuotes(quotes: quotes, author: author);
  }

  Future<List<Quotesmodals>> getAllQuotes() async {
    allQuotes(await DBHelper.dbHelper.displayQuotes());
    return allQuotes;
  }

  searchData({required String val}) async {
    searchdata(await DBHelper.dbHelper.searchData(val: val));
  }
}
