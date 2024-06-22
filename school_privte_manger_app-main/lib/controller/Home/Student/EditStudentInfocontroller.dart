import 'package:admindash/data/models/student_modle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/state_raqust.dart';

class StudentEditeControllr extends GetxController {
  late StudentModle modle;
  late TextEditingController firstnaem;
  late TextEditingController lastname;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController studentLevel;
  late TextEditingController activation;

  StateRaqust? stateRaqust;

  late GlobalKey<FormState>
      globalKey; // using this variable for make validation in form plase

  editeinfo() {}

  @override
  void dispose() {
    firstnaem.dispose();
    lastname.dispose();
    email.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    modle = Get.arguments['modle'];
    firstnaem = TextEditingController(text: modle.studentFname);
    lastname = TextEditingController(text: modle.studentLname);
    email = TextEditingController(text: modle.studentEmail);
    studentLevel = TextEditingController(text: modle.studentLevel);
    activation = TextEditingController(text: modle.studentActive);
    phone = TextEditingController(text: modle.studentPhone);

    globalKey = GlobalKey<FormState>();
    super.onInit();
  }
}
