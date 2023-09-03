import 'package:db_miner/helpers/quotes_helper.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../helpers/quotes_modal.dart';

class quoteapicontroller extends GetxController {
  RxList<Quotesmodals> quote = <Quotesmodals>[].obs;

  quoteapicontroller() {
    getquote();
  }

  getquote() async {
    quote.value = (await ApiHelper.apiHelper.getApi())!;
  }
}
