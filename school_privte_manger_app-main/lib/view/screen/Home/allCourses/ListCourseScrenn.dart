import 'package:admindash/controller/Home/CorsScreen/CoursePageController.dart';
import 'package:admindash/core/class/handling_data.dart';
import 'package:admindash/view/screen/Home/allCourses/CoursePageScreen.dart';
import 'package:admindash/view/widget/home/Setings/CustomOptioncard.dart';
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
      body: GetBuilder<CoursePgeController>(builder: (c) {
        return Column(
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
            Expanded(
              child: Obx(() {
                return Container(
                  padding: const EdgeInsets.all(20),
                  child: HadlingData(
                    stateRaqust: controller.stateRaqust,
                    child: GridView.builder(
                      itemCount: controller.results.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 2,
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
                            title: '${course.coursName}',
                            subtitle: '${course.coursSection}',
                            datecreate: '',
                          ),
                        );
                      },
                    ),
                  ),
                );
              }),
            ),
          ],
        );
      }),
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
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CustomCardOption(
                  titlecard: '41'.tr,
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  function: () {
                    print('delete');
                  },
                ),
              ),
              Expanded(
                child: CustomCardOption(
                  titlecard: '40'.tr,
                  icon: const Icon(
                    Icons.edit,
                    color: Appcolors.primarycolor,
                  ),
                  function: () {
                    print('edite');
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
