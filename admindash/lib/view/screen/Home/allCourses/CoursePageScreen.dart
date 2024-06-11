import 'package:admindash/core/const/ScreenSize.dart';
import 'package:admindash/core/const/app_colors.dart';
import 'package:admindash/data/models/courseModel.dart';
import 'package:admindash/view/screen/Home/allCourses/ListCourseStudent.dart';
import 'package:admindash/view/screen/Home/allCourses/ListecherCours.dart';
import 'package:admindash/view/widget/home/Setings/CustomOptioncard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoursePageScreen extends StatelessWidget {
  final TutorialsModle course;

  const CoursePageScreen({super.key, required this.course});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InfoCard(
                      label: 'Course Title', value: '${course.tutorialsTitle}'),
                  InfoCard(
                      label: 'Course Title',
                      value: '${course.tutorialsSubtitle}'),
                  InfoCard(
                      label: 'Date Create',
                      value: '${course.tutorialsDateCreate}'),
                  InfoCard(
                      label: 'Techar Number',
                      value: '${course.tutorialTeacherNuber}'),
                  InfoCard(
                      label: 'Student number',
                      value: '${course.studentNumber}'),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomCardOption(
                    titlecard: '40'.tr,
                    icon: const Icon(
                      Icons.edit,
                      color: Appcolors.primarycolor,
                    ),
                    function: () {
                      print('edite');
                    },
                  ),
                  CustomCardOption(
                    titlecard: '41'.tr,
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    function: () {
                      print('delete');
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(20),
              padding: EdgeInsets.all(defaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomCardOption(
                    titlecard: 'Teacherlist'.tr,
                    icon: const Icon(
                      Icons.list,
                      color: Colors.black,
                    ),
                    function: () {
                      Get.to(() => ListTeacherForCourse());
                    },
                  ),
                  CustomCardOption(
                    titlecard: 'Student List'.tr,
                    icon: const Icon(
                      Icons.list,
                      color: Colors.black,
                    ),
                    function: () {
                      Get.to(() => ListStudentCours());
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String label;
  final String value;

  const InfoCard({Key? key, required this.label, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              '$label:',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge, // Consider using a more appropriate text style
            ),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                value,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
