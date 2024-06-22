import 'package:admindash/core/services/servises.dart';
import 'package:admindash/data/models/admin_modle.dart';
import 'package:admindash/view/screen/Home/Dashboard.dart';
import 'package:admindash/view/screen/Home/adminprofile/ProfileAdmin.dart';
import 'package:admindash/view/screen/Home/allCourses/ListCourseScrenn.dart';
import 'package:admindash/view/screen/Home/settingScreen.dart';
import 'package:admindash/view/screen/Home/student/SudentListScrenn.dart';
import 'package:admindash/view/screen/Home/teacher/TeacherList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuAppController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);
  AppServices services = Get.find();
  late AdminModle modle;

  final List<Widget> screens = [
    const Dashscreen(),
    const TeacherListScreen(),
    const StudentList(),
    const ListCourseScreen(),
    const Profileadmine(),
    const SettingsScreen(),
  ];

  void controlMenu() {
    if (!scaffoldKey.currentState!.isDrawerOpen) {
      scaffoldKey.currentState!.openDrawer();
      update();
    }
  }

  void loadAdminData() {
    modle = AdminModle(
      adminId: services.sharpref.getString("admin_id"),
      adminFname: services.sharpref.getString("admin_fname"),
      adminLname: services.sharpref.getString("admin_lname"),
      adminEmail: services.sharpref.getString("admin_email"),
      adminPhone: services.sharpref.getString("admin_phone"),
      adminDateCreate: services.sharpref.getString("admin_date_create"),
      adminImage: services.sharpref.getString("admin_image"),
      adminVerfication: services.sharpref.getString("admin_verfication"),
      adminLevel: services.sharpref.getString("admin_level"),
    );
  }

  @override
  void onInit() {
    loadAdminData();
    super.onInit();
  }
}
