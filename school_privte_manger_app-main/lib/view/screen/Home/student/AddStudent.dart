import 'package:admindash/controller/Home/Student/add_student_controller.dart';
import 'package:admindash/core/const/app_colors.dart';
import 'package:admindash/view/widget/ustomINputefielde.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddStudentScreen extends StatelessWidget {
  const AddStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AddStudentController controller = Get.put(AddStudentController());

    return Scaffold(
      appBar: AppBar(
        title: Text('add student'.tr),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 50),
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
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: CustomInputeField(
                              enable: true,
                              obscureText: false,
                              title: '21'.tr,
                              hintext: 'entre your firstname',
                              controller: controller.firstnaem),
                        ),
                      ),
                      const SizedBox(width: 20), // Spacing between fields
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: CustomInputeField(
                              enable: true,
                              obscureText: false,
                              title: '22'.tr,
                              hintext: 'entre your lasname',
                              controller: controller.lastname),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CustomInputeField(
                      enable: true,
                      obscureText: false,
                      title: '3'.tr,
                      hintext: 'Teacher Email',
                      controller: controller.email,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CustomInputeField(
                      enable: true,
                      obscureText: false,
                      title: '38'.tr,
                      hintext: 'Teacher Phone',
                      controller: controller.email,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CustomInputeField(
                      enable: true,
                      obscureText: true,
                      title: '4'.tr,
                      hintext: '5'.tr,
                      controller: controller.pasword,
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
