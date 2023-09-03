import 'dart:convert';
import 'dart:developer';
import 'package:db_miner/helpers/quotes_modal.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  ApiHelper._();
  static final ApiHelper apiHelper = ApiHelper._();

  List<quotesmodals> quotes = [];
  final String api = "https://dummyjson.com/quotes?limit=100";

  Future<List<quotesmodals>?> getApi() async {
    http.Response response = await http.get(
      Uri.parse(api),
    );

    if (response.statusCode == 200) {
      Map tmpquote = jsonDecode(response.body);
      log(tmpquote.toString());
      List data = tmpquote['quotes'];
      quotes = data.map((e) => quotesmodals.fromMap(data: e)).toList();
      return quotes;
    }
    return null;
  }
}
