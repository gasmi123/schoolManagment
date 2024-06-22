import 'package:admindash/core/class/state_raqust.dart';
import 'package:admindash/data/remot/screen/group_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/class/stautus.dart';
import '../../../../core/funcion/alert_not_cox.dart';
import '../../../../core/funcion/head_data.dart';
import '../../../../data/models/Teacher_model.dart';
import '../../../../data/models/cours_modle.dart';
import '../../../../data/remot/screen/teacher_data.dart';

class ViewTeacherController extends GetxController {
  List<TeacherModle> modles = [];
  late CoursModel modle;
  late StateRaqust stateRaqust;
  // final CourData _data = CourData(Get.find());
  final GroupData _data = GroupData(Get.find());
  final TeacherData _teacherData = TeacherData(Get.find());

  late TextEditingController groupName;
  getTecherList() async {
    stateRaqust = StateRaqust.Laoding;
    update();
    var respones = await _teacherData.getData();
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

  addGroup(int index) async {
    stateRaqust = StateRaqust.Laoding;
    update();
    var respones = await _data.addGroup(
        coursId: modle.coursId!,
        teacherId: modles[index].teacherId!,
        groupName: groupName.text);
    stateRaqust = headData(respones);
    if (stateRaqust == StateRaqust.succes) {
      if (respones[AppStatus.status] == AppStatus.sucsess) {
        Get.rawSnackbar(
            title: "تم", message: "تمت عملية اضافة  المجموعة بنجاح");
      } else if (respones[AppStatus.status] == AppStatus.failure) {
        Get.rawSnackbar(title: "فشل", message: "فشل عملية اضافة  المجموعة ");
        stateRaqust = StateRaqust.succes;
      }
    } else {
      noIntrnat();
    }
    update();
  }

  @override
  void onInit() {
    modle = Get.arguments['modle'];
    groupName = TextEditingController();

    getTecherList();
    super.onInit();
  }
}
