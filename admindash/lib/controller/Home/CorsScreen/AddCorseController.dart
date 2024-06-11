import 'package:admindash/data/models/courseModel.dart';
import 'package:admindash/data/test/courseList.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddCourseController extends GetxController {
  late TextEditingController cTitle;
  late TextEditingController cSubtitle;
  late TextEditingController cDateCreat;

  addCourse() {
    final course = TutorialsModle(
      tutorialsTitle: cTitle.text,
      tutorialsDateCreate: cDateCreat.text,
      tutorialsSubtitle: cSubtitle.text,
    );

    Get.back();

    courseslist.add(course);
    cTitle.clear();
    cSubtitle.clear();
    cDateCreat.clear();
    update();
  }

  @override
  void onInit() {
    cTitle = TextEditingController();
    cSubtitle = TextEditingController();
    cDateCreat = TextEditingController();
    cDateCreat.text = DateTime.now().toString();
    super.onInit();
  }

  @override
  void dispose() {
    cTitle.dispose();
    cSubtitle.dispose();
    cDateCreat.dispose();
    super.dispose();
  }
}
