import 'package:admindash/core/class/state_raqust.dart';
import 'package:admindash/data/remot/screen/teacher_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/stautus.dart';
import '../../../core/funcion/alert_not_cox.dart';
import '../../../core/funcion/head_data.dart';

class AddTeacherController extends GetxController {
  late TextEditingController firstnaem;
  late TextEditingController lastname;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController pasword;
  late TextEditingController module;
  late TextEditingController salary;
  late GlobalKey<FormState> globalKey;

  StateRaqust? stateRaqust;
  final TeacherData _data = TeacherData(Get.find());

  addTeaccher() async {
    stateRaqust = StateRaqust.Laoding;
    update();
    var respones = await _data.addTeacher(
      teacher_email: email.text,
      teacher_fname: firstnaem.text,
      teacher_lname: lastname.text,
      teacher_model_name: module.text,
      teacher_password: pasword.text,
      teacher_phone: phone.text,
      teacher_salary: salary.text,
    );
    stateRaqust = headData(respones);
    if (stateRaqust == StateRaqust.succes) {
      if (respones[AppStatus.status] == AppStatus.sucsess) {
        Get.snackbar("تم", "تمت عملية اضافة الأستاذ بنجاح");
        disposeText();
      } else if (respones[AppStatus.status] == AppStatus.failure) {
        Get.snackbar("فشل", "فشل عملية اضافة الأستاذ ");

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
    salary = TextEditingController();
    phone = TextEditingController();

    lastname = TextEditingController();
    email = TextEditingController();
    pasword = TextEditingController();
    module = TextEditingController();
    globalKey = GlobalKey<FormState>();
    super.onInit();
  }

  void disposeText() {
    firstnaem.clear();
    lastname.clear();
    email.clear();
    pasword.clear();
    module.clear();
    salary.clear();
    phone.clear();
  }

  @override
  void dispose() {
    firstnaem.dispose();
    lastname.dispose();
    email.dispose();
    pasword.dispose();
    module.dispose();
    super.dispose();
  }
}
