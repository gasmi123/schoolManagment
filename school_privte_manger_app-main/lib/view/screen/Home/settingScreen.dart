import 'package:admindash/view/screen/Home/settings/LangPages.dart';
import 'package:admindash/view/widget/home/Setings/CustomOptioncard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 500,
              child: CustomCardOption(
                titlecard: '30'.tr,
                icon: const Icon(Icons.language),
                function: () {
                  Get.to(() => const ChangelangScreen());
                },
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: 500,
              child: CustomCardOption(
                titlecard: '33'.tr,
                icon: const Icon(Icons.admin_panel_settings),
                function: () {},
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: 500,
              child: CustomCardOption(
                titlecard: '35'.tr,
                icon: const Icon(Icons.security),
                function: () {},
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: 500,
              child: CustomCardOption(
                titlecard: '34'.tr,
                icon: const Icon(Icons.mode_night_outlined),
                function: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
