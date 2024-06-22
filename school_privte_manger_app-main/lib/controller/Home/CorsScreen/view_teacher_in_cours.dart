import 'package:admindash/core/class/state_raqust.dart';
import 'package:admindash/core/const/app_routes.dart';
import 'package:admindash/data/models/Teacher_model.dart';
import 'package:admindash/data/models/cours_modle.dart';
import 'package:admindash/data/remot/screen/cour_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/stautus.dart';
import '../../../core/funcion/alert_not_cox.dart';
import '../../../core/funcion/head_data.dart';

class ViewTeacherController extends GetxController {
  List<TeacherModle> modles = [];
  late CoursModel modle;
  late StateRaqust stateRaqust;
  final CourData _data = CourData(Get.find());

  getTecherList() async {
    stateRaqust = StateRaqust.Laoding;
    update();
    var respones = await _data.teacherViewCours(coursId: modle.coursId!);
    stateRaqust = headData(respones);
    if (stateRaqust == StateRaqust.succes) {
      if (respones[AppStatus.status] == AppStatus.sucsess) {
        List list = respones['data'];
        modles.addAll(list.map((e) => TeacherModle.fromJson(e)));
        list.clear();
      } else if (respones[AppStatus.status] == AppStatus.failure) {
        stateRaqust = StateRaqust.fuler;
      }
    } else {
      noIntrnat();
    }
    update();
  }

  void deleteTeacher(int index) {
    Get.defaultDialog(
      title: "Confirm Deletion",
      middleText: "Are you sure you want to delete this teacher?",
      textConfirm: "Yes",
      textCancel: "No",
      onConfirm: () {
        // _data.deleteTeacher(modles[index].teacherId!);
        // modles.removeAt(index);
        // update();
        // Get.back(); // Close the dialog
      },
      onCancel: () {
        Get.back(); // Close the dialog without doing anything
      },
      confirmTextColor:
          Colors.white, // Optional: make confirm button text white
    );
  }

  @override
  void onInit() {
    modle = Get.arguments['modle'];
    getTecherList();
    super.onInit();
  }
}
