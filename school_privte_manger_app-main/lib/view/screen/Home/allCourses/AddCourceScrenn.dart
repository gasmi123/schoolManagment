import 'package:admindash/controller/Home/CorsScreen/AddCorseController.dart';
import 'package:admindash/core/const/app_colors.dart';
import 'package:admindash/view/widget/ustomINputefielde.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCorseScreen extends StatelessWidget {
  const AddCorseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AddCourseController controller = Get.put(AddCourseController());
    return Scaffold(
      appBar: AppBar(
        title: Text('29'.tr),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
            border: Border.all(width: 3),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: CustomInputeField(
                          title: '48'.tr,
                          obscureText: true,
                          hintext: '',
                          controller: controller.coursName,
                          enable: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: CustomInputeField(
                          enable: true,
                          obscureText: true,
                          title: '49'.tr,
                          hintext: '',
                          controller: controller.sectionName,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: CustomInputeField(
                          enable: false,
                          title: 'Date',
                          obscureText: false,
                          hintext: '${DateTime.now()}',
                          controller: controller.coursLevel,
                        ),
                      ),
                      // Add more fields as needed
                    ],
                  ),
                ),
              ),
              Spacer(),
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
                  onTap: () {
                    // controller.login();
                  },
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
    );
  }
}
