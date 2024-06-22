import 'package:admindash/core/class/state_raqust.dart';
import 'package:admindash/data/models/group_modle.dart';

import 'package:admindash/data/models/subscription_modle.dart';
import 'package:admindash/data/remot/screen/cour_data.dart';
import 'package:admindash/data/remot/screen/group_data.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/class/stautus.dart';
import '../../../../core/funcion/alert_not_cox.dart';
import '../../../../core/funcion/head_data.dart';
import '../../../../data/models/cours_modle.dart';

class ViewTeacherController extends GetxController {
  List<GroupModle> modles = [];
  late CoursModel modle;
  late StateRaqust stateRaqust;
  // final CourData _data = CourData(Get.find());
  final GroupData _data = GroupData(Get.find());
  late TextEditingController groupName;

  getGroup() async {
    stateRaqust = StateRaqust.Laoding;
    update();
    var respones = await _data.getGroup(coursId: modle.coursId!);
    stateRaqust = headData(respones);
    if (stateRaqust == StateRaqust.succes) {
      if (respones[AppStatus.status] == AppStatus.sucsess) {
        List list = respones['data'];
        modles.addAll(list.map((e) => GroupModle.fromJson(e)));
        list.clear();
      } else if (respones[AppStatus.status] == AppStatus.failure) {
        stateRaqust = StateRaqust.fuler;
      }
    } else {
      noIntrnat();
    }
    update();
  }

  void deleteStudent(int index) {
    Get.defaultDialog(
      title: "Confirm Deletion",
      middleText: "Are you sure you want to delete this teacher?",
      textConfirm: "Yes",
      textCancel: "No",
      onConfirm: () {
        _data.deleteGroup(
          coursId: modle.coursId!,
          teacherId: modles[index].teacherId!,
        );
        modles.removeAt(index);
        update();
        Get.back(); // Close the dialog
      },
      onCancel: () {
        Get.back(); // Close the dialog without doing anything
      },
      confirmTextColor:
          Colors.white, // Optional: make confirm button text white
    );
  }

  // تعديل معلومات القروب
  editeGroup(int index) async {
    stateRaqust = StateRaqust.Laoding;
    update();
    var respones = await _data.editeGroup(
        coursId: modle.coursId!,
        teacherId: modles[index].teacherId!,
        groupName: groupName.text); // نهاية الأشتراك
    stateRaqust = headData(respones);
    if (stateRaqust == StateRaqust.succes) {
      if (respones[AppStatus.status] == AppStatus.sucsess) {
        Get.rawSnackbar(
            title: "تم", message: "تمت عملية تعديل   اسم المجموعة بنجاح");
        modles[index].lessonName = groupName.text;
      } else if (respones[AppStatus.status] == AppStatus.failure) {
        Get.rawSnackbar(title: "فشل", message: "فشل عملية تعديل اسم المجموعة ");
        stateRaqust = StateRaqust.succes;
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
            title: "تم", message: "تمت عملية تعديل   اسم المجموعة بنجاح");
        modles[index].lessonName = groupName.text;
      } else if (respones[AppStatus.status] == AppStatus.failure) {
        Get.rawSnackbar(title: "فشل", message: "فشل عملية تعديل اسم المجموعة ");
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

    getGroup();
    super.onInit();
  }
}
