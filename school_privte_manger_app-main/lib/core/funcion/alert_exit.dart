import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';

Future<bool> alertExit() async {
  Get.defaultDialog(
      title: "34".tr,
      middleText: '',
      textCancel: '35'.tr,
      textConfirm: '36'.tr,
      onConfirm: () {
        exit(0);
      },
      onCancel: () {
        Get.back();
      });

  return Future.value(false);
}
