import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTeacherController extends GetxController {
  late TextEditingController firstnaem;
  late TextEditingController lastname;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController pasword;
  late TextEditingController entreDate;
  late TextEditingController module;

  addTeaccher() {}

  @override
  void onInit() {
    firstnaem = TextEditingController();
    lastname = TextEditingController();
    email = TextEditingController();
    pasword = TextEditingController();
    entreDate = TextEditingController();
    entreDate.text = DateTime.now().toString();
    module = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    firstnaem.dispose();
    lastname.dispose();
    email.dispose();
    pasword.dispose();
    entreDate.dispose();
    module.dispose();
    super.dispose();
  }
}
