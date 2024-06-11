import 'package:admindash/controller/Onbordingcontroller.dart';
import 'package:admindash/core/const/app_colors.dart';
import 'package:admindash/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final OncboardingController controller =
        Get.put(OncboardingControllerIMP());
    return Scaffold(
      backgroundColor: Appcolors.primarycolor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Expanded(
                flex: 2,
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 100),
                    child: Image.asset(
                      "assets/images/school.png",
                      width: 300,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Container(
                height: 70,
                width: Responsive.isDesktop(context) ? 800 : double.infinity,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Appcolors.whithe),
                ),
                child: InkWell(
                  onTap: () {
                    controller.nextpage();
                  },
                  child: Center(
                    child: Text(
                      '1'.tr,
                      style: const TextStyle(
                          fontSize: 20, color: Appcolors.whithe),
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 1,
              )
            ],
          );
        },
      ),
    );
  }
}
