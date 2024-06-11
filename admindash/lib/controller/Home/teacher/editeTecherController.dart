import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admindash/data/models/TeacherModel.dart';

class TeacherEditController extends GetxController {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late TextEditingController enterDateController;
  late TextEditingController moduleController;

  TeacherEditController(Teacher teacher) {
    firstNameController = TextEditingController(text: teacher.firstName);
    lastNameController = TextEditingController(text: teacher.lastName);
    emailController = TextEditingController(text: teacher.email);
    phoneController = TextEditingController(text: teacher.phone);
    passwordController = TextEditingController();
    enterDateController = TextEditingController(text: teacher.dateOfEntry);
    moduleController = TextEditingController(text: teacher.module);
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    enterDateController.dispose();
    moduleController.dispose();
    super.dispose();
  }
}
