import 'dart:math';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class All_Imges extends GetxController {
  final List<String> imageAssets = [
    'assets/images/1.jpg',
    'assets/images/2.jpeg',
    'assets/images/3.jpeg',
    'assets/images/4.jpg',
    'assets/images/5.jpg',
    'assets/images/6.jpg',
  ];

  final RxString currentImageAsset = "assets/images/1.jpg".obs;

  void changeImage() {
    final random = Random();
    final randomIndex = random.nextInt(imageAssets.length);
    final newImageAsset = imageAssets[randomIndex];
    currentImageAsset.value = newImageAsset;
  }
}
