import 'package:admindash/core/class/state_raqust.dart';
import 'package:admindash/data/models/student_modle.dart';

import 'package:admindash/data/models/subscription_modle.dart';
import 'package:admindash/data/remot/screen/cour_data.dart';
import 'package:admindash/data/remot/screen/subscription_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/stautus.dart';
import '../../../core/funcion/alert_not_cox.dart';
import '../../../core/funcion/head_data.dart';
import '../../../data/models/cours_modle.dart';

class ViewTeacherController extends GetxController {
  List<StudentModle> modles = [];
  late CoursModel modle;
  late StateRaqust stateRaqust;
  final CourData _data = CourData(Get.find());
  final SubscriptionData _subscriptionData = SubscriptionData(Get.find());
  DateTime now = DateTime.now();
  late DateTime nextMonth;

  getStudent() async {
    stateRaqust = StateRaqust.Laoding;
    update();
    var respones = await _data.studentViewNotInCours(coursId: modle.coursId!);
    stateRaqust = headData(respones);
    if (stateRaqust == StateRaqust.succes) {
      if (respones[AppStatus.status] == AppStatus.sucsess) {
        List list = respones['data'];
        modles.addAll(list.map((e) => StudentModle.fromJson(e)));
        list.clear();
      } else if (respones[AppStatus.status] == AppStatus.failure) {
        stateRaqust = StateRaqust.fuler;
      }
    } else {
      noIntrnat();
    }
    update();
  }

  // اخدم دالة يخير بيها تاريخ انتهاء الشتراك
  void selectExpiryDate() {}

// أضافة اشتراك
  void addStudent(int index) async {
    stateRaqust = StateRaqust.Laoding;
    update();
    var respones = await _subscriptionData.addSubscription(
        cours_id: modle.coursId!,
        student_id: modles[index].studentId!,
        subscription_prise: modle.coursPrice!, //سعر الأشتراك
        subscription_expiry_date:
            "${nextMonth.year}-${(nextMonth.month)}-${(nextMonth.day)}"); //سعر الأشتراك
    stateRaqust = headData(respones);
    if (stateRaqust == StateRaqust.succes) {
      if (respones[AppStatus.status] == AppStatus.sucsess) {
        Get.rawSnackbar(
            title: "تم", message: "تمت عملية اضافة التلميذ الى الدورة بنجاح");
        modles.removeAt(index);
      } else if (respones[AppStatus.status] == AppStatus.failure) {
        Get.rawSnackbar(
            title: "فشل", message: "فشل عملية اضافة التلميذ الى الدورة ");
        stateRaqust = StateRaqust.succes;
      }
    } else {
      noIntrnat();
    }
    update();
  }

  @override
  void onInit() {
    nextMonth = DateTime(now.year, now.month + 1, now.day);

    modle = Get.arguments['modle'];
    getStudent();
    super.onInit();
  }
}
