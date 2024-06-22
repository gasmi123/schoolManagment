import 'package:admindash/controller/Home/Student/CahngepassController.dart';
import 'package:admindash/core/const/app_colors.dart';
import 'package:admindash/view/widget/ustomINputefielde.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Changepassword extends StatelessWidget {
  final studentid;
  const Changepassword({super.key, required this.studentid});
  @override
  Widget build(BuildContext context) {
    Cahngepasscontroller controller = Get.put(Cahngepasscontroller());

    return Scaffold(
      appBar: AppBar(
        title: Text('change password'.tr),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 100),
          width: MediaQuery.of(context).size.width * 0.7,
          height: double.maxFinite,
          decoration: BoxDecoration(
            border: Border.all(width: 3),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CustomInputeField(
                      enable: true,
                      obscureText: false,
                      title: 'oldpassword'.tr,
                      hintext: 'entre old password',
                      controller: controller.oldpassword,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CustomInputeField(
                      enable: true,
                      obscureText: false,
                      title: 'new password'.tr,
                      hintext: 'entre new password',
                      controller: controller.newpassword,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 50,
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Appcolors.seconderyColor,
                        ),
                        color: Appcolors.seconderyColor),
                    child: InkWell(
                      onTap: () {},
                      child: Center(
                        child: Text(
                          "37".tr,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Appcolors.whithe,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
