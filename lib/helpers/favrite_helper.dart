import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Favrite_helper {
  Favrite_helper._();
  static final Favrite_helper favrite_helper = Favrite_helper._();

  GetStorage storage = GetStorage();
  RxBool a = true.obs;

  String _check = 'first';

  get checkFirstTime {
    return storage.read(_check) ?? true;
  }

  doneFirst() {
    storage.write(_check, false);
  }

  First() {
    storage.write(_check, true);
  }
}
