import 'package:admindash/core/class/state_raqust.dart';

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
  List<SubscriptionModle> modles = [];
  late CoursModel modle;
  late StateRaqust stateRaqust;
  final CourData _data = CourData(Get.find());
  final SubscriptionData _subscriptionData = SubscriptionData(Get.find());
  late TextEditingController expiryDate;
  late TextEditingController priseCours;

  getStudent() async {
    stateRaqust = StateRaqust.Laoding;
    update();
    var respones = await _data.studentViewCours(coursId: modle.coursId!);
    stateRaqust = headData(respones);
    if (stateRaqust == StateRaqust.succes) {
      if (respones[AppStatus.status] == AppStatus.sucsess) {
        List list = respones['data'];
        modles.addAll(list.map((e) => SubscriptionModle.fromJson(e)));
        list.clear();
      } else if (respones[AppStatus.status] == AppStatus.failure) {
        stateRaqust = StateRaqust.fuler;
      }
    } else {
      noIntrnat();
    }
    update();
  }

  // دالة ذي تخير بيها ويكت ينتهي اشتراك
  void selectedExpiryDate() {}

// حذف اشتراك تلميذ من الدورة
  void deleteStudent(int index) {
    Get.defaultDialog(
      title: "Confirm Deletion",
      middleText: "Are you sure you want to delete this teacher?",
      textConfirm: "Yes",
      textCancel: "No",
      onConfirm: () {
        _subscriptionData.deleteSubscriptionData(
            subscriptionId: modles[index].subscriptionId!);
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

  // تعديل معلومات الأشتراك
  void editeSubscription(int index) async {
    stateRaqust = StateRaqust.Laoding;
    update();
    var respones = await _subscriptionData.editeSubscriptionData(
        id: modles[index].studentId!,
        subscription_prise: modle.coursPrice!, //سعر الأشتراك
        subscription_expiry_date: expiryDate.text); // نهاية الأشتراك
    stateRaqust = headData(respones);
    if (stateRaqust == StateRaqust.succes) {
      if (respones[AppStatus.status] == AppStatus.sucsess) {
        Get.rawSnackbar(
            title: "تم", message: "تمت عملية اضافة التلميذ الى الدورة بنجاح");
      } else if (respones[AppStatus.status] == AppStatus.failure) {
        Get.rawSnackbar(
            title: "فشل", message: "فشل عملية اضافة التلميذ الى الدورة ");
        stateRaqust = StateRaqust.fuler;
      }
    } else {
      noIntrnat();
    }
    update();
  }

  @override
  void onInit() {
    modle = Get.arguments['modle'];
    expiryDate = TextEditingController();
    priseCours = TextEditingController();

    getStudent();
    super.onInit();
  }
}
