import 'package:admindash/core/services/servises.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Localcontroller extends GetxController {
  Locale? language;

  AppServices myservices = Get.find();

  cahngeLang(String langcodee) {
    Locale locale = Locale(langcodee);
    myservices.sharpref.setString("lang", langcodee);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    super.onInit();
    String? langsharedprefirence = myservices.sharpref.getString("lang");

    if (langsharedprefirence == "ar") {
      language = const Locale("ar");
    } else if (langsharedprefirence == "en") {
      language = const Locale("en");
    } else {
      language = const Locale("ar");
    }
  }
}
