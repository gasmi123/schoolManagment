import 'package:admindash/core/const/app_colors.dart';
import 'package:admindash/responsive.dart';
import 'package:admindash/view/screen/Home/student/AddStudent.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomStudentHead extends StatelessWidget {
  const CustomStudentHead({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        if (!Responsive.isMobile(context))
          Text(
            '43'.tr,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        if (!Responsive.isMobile(context))
          ElevatedButton(
            onPressed: () {
              Get.to(() => const AddStudentScreen());
            },
            style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 10)),
            child: Row(
              children: [
                Text(
                  '46'.tr,
                  style: const TextStyle(
                      color: Appcolors.primarycolor, fontSize: 18),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Icon(
                  Icons.add,
                  color: Appcolors.primarycolor,
                ),
              ],
            ),
          ),
        if (!Responsive.isMobile(context))
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 10)),
            child: Row(
              children: [
                Text(
                  '27'.tr,
                  style: const TextStyle(
                      color: Appcolors.primarycolor, fontSize: 18),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Icon(
                  Icons.download,
                  color: Appcolors.primarycolor,
                ),
              ],
            ),
          )
      ],
    );
  }
}
