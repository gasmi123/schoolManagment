import 'package:admindash/core/class/state_raqust.dart';
import 'package:admindash/data/remot/screen/teacher_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admindash/data/models/Teacher_model.dart';

import '../../../core/class/stautus.dart';
import '../../../core/funcion/alert_not_cox.dart';
import '../../../core/funcion/head_data.dart';

class TeacherEditController extends GetxController {
  late TeacherModle teacherModle;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late TextEditingController moduleController;
  late TextEditingController salary;
  StateRaqust? stateRaqust;
  final TeacherData _data = TeacherData(Get.find());

  editeTeachewr() async {
    stateRaqust = StateRaqust.Laoding;
    update();
    var respones = await _data.editeTeacher(
      id: teacherModle.teacherId!,
      teacher_email: emailController.text,
      teacher_fname: firstNameController.text,
      teacher_lname: lastNameController.text,
      teacher_model_name: moduleController.text,
      teacher_password: passwordController.text,
      teacher_phone: phoneController.text,
      teacher_salary: salary.text,
    );
    stateRaqust = headData(respones);
    if (stateRaqust == StateRaqust.succes) {
      if (respones[AppStatus.status] == AppStatus.sucsess) {
        Get.snackbar("تم", "تمت عملية اضافة الأستاذ بنجاح");
        // disposeText();
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
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    moduleController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    teacherModle = Get.arguments['modle'];
    firstNameController =
        TextEditingController(text: teacherModle.teacherFname);
    lastNameController = TextEditingController(text: teacherModle.teacherLname);
    emailController = TextEditingController(text: teacherModle.teacherEmail);
    phoneController = TextEditingController(text: teacherModle.teacherPhone);
    passwordController = TextEditingController();
    moduleController =
        TextEditingController(text: teacherModle.teacherModelName);
    salary = TextEditingController(text: teacherModle.teacherSalary);

    super.onInit();
  }
}
