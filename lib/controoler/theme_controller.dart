import 'package:get/get.dart';

class themeController extends GetxController {
  RxBool theme = true.obs;

  changeTheme() {
    theme.value = !theme.value;
  }
}
