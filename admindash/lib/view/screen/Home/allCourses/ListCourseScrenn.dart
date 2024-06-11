import 'package:admindash/controller/Home/CorsScreen/CoursePageController.dart';
import 'package:admindash/view/screen/Home/allCourses/CoursePageScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admindash/core/const/app_colors.dart';
import 'package:admindash/view/widget/home/CourcesPages/CustomeCoursesHeaders.dart';

class ListCourseScreen extends StatelessWidget {
  const ListCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CoursePgeController controller = Get.put(CoursePgeController());

    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: CupertinoSearchTextField(
              onChanged: (value) {
                controller.updateSearchQuery(value);
              },
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                color: Appcolors.whithe,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          const SizedBox(height: 30),
          const CustomeCoursesHeade(),
          const SizedBox(height: 30),
          Obx(() {
            return Container(
              padding: const EdgeInsets.all(20),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.results.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  var course = controller.results[index];
                  return InkWell(
                    onTap: () {
                      Get.to(
                        () => CoursePageScreen(
                          course: course,
                        ),
                      );
                    },
                    child: CorsCard(
                      title: '${course.tutorialsTitle}',
                      subtitle: '${course.tutorialsSubtitle}',
                      datecreate: '${course.tutorialsDateCreate}',
                    ),
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}

class CorsCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String datecreate;

  const CorsCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.datecreate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Appcolors.whithe,
        border: Border.all(
          width: 2,
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                '48'.tr,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(width: 20),
              Text(
                title,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                '49'.tr,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(width: 20),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                '50'.tr,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(width: 20),
              Text(
                datecreate,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
