import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/services.dart';

class speak_controller extends GetxController {
  FlutterTts flutterTts = FlutterTts();

  speak({required String text}) {
    flutterTts.setLanguage("en-US");
    flutterTts.setPitch(1);
    flutterTts.speak(text);
  }

  stop() {
    flutterTts.stop();
  }
}
