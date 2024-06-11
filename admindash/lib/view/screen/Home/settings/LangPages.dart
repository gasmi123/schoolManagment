import 'package:admindash/core/localization/change_local.dart';
import 'package:admindash/view/widget/home/Setings/CustoLangButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangelangScreen extends StatelessWidget {
  const ChangelangScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Localcontroller controller = Get.put(Localcontroller());
    return Scaffold(
      appBar: AppBar(
        title: Text("30".tr),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "36".tr,
              style: const TextStyle(fontSize: 20),
            ),
            CustomBuutonLang(
              Title: '31'.tr,
              function: () {
                controller.cahngeLang("ar");
                Get.back();
              },
            ),
            CustomBuutonLang(
              Title: '32'.tr,
              function: () {
                controller.cahngeLang("en");
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
