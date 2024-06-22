import 'package:admindash/core/class/state_raqust.dart';
import 'package:admindash/data/remot/screen/student_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/stautus.dart';
import '../../../core/funcion/alert_not_cox.dart';
import '../../../core/funcion/head_data.dart';

class AddStudentController extends GetxController {
  late TextEditingController firstnaem;
  late TextEditingController lastname;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController pasword;
  late TextEditingController studentLevel;
  final StudentData _data = StudentData(Get.find());
  StateRaqust? stateRaqust;

  late GlobalKey<FormState>
      globalKey; // using this variable for make validation in form plase

  addStudent() async {
    stateRaqust = StateRaqust.Laoding;
    update();
    var respones = await _data.addStudent(
        student_email: email.text,
        student_fname: firstnaem.text,
        student_level: studentLevel.text,
        student_lname: lastname.text,
        student_password: pasword.text,
        student_phone: phone.text);
    stateRaqust = headData(respones);
    if (stateRaqust == StateRaqust.succes) {
      if (respones[AppStatus.status] == AppStatus.sucsess) {
        Get.rawSnackbar(title: "تم", message: "تمت عملية اضافة التلميذ بنجاح");
        // List list = respones['data'];
        // modles.addAll(list.map((e) => StudentModle.fromJson(e)));
        // list.clear();
      } else if (respones[AppStatus.status] == AppStatus.failure) {
        Get.rawSnackbar(title: "فشل", message: "فشل عملية اضافة التلميذ ");

        stateRaqust = StateRaqust.fuler;
      }
    } else {
      noIntrnat();
    }
    update();
  }

  @override
  void onInit() {
    firstnaem = TextEditingController();
    lastname = TextEditingController();
    email = TextEditingController();
    pasword = TextEditingController();
    studentLevel = TextEditingController();
    phone = TextEditingController();
    globalKey = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  void dispose() {
    firstnaem.dispose();
    lastname.dispose();
    email.dispose();
    pasword.dispose();
    super.dispose();
  }
}
