import 'package:admindash/view/screen/Home/Dashboard.dart';
import 'package:admindash/view/screen/Home/allCourses/ListCourseScrenn.dart';
import 'package:admindash/view/screen/Home/settingScreen.dart';
import 'package:admindash/view/screen/Home/student/SudentListScrenn.dart';
import 'package:admindash/view/screen/Home/teacher/TeacherList.dart';
import 'package:admindash/view/screen/Home/sss.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuAppController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);

  final List<Widget> screens = [
    const Dashscreen(),
    const TeacherListScreen(),
    const StudentList(),
    const ListCourseScreen(),
    ProfileScreen(),
    const SettingsScreen(),
  ];

  void controlMenu() {
    if (!scaffoldKey.currentState!.isDrawerOpen) {
      scaffoldKey.currentState!.openDrawer();
      update();
    }
  }
}
