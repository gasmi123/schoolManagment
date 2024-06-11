import 'package:admindash/data/models/studentsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentEditeControllr extends GetxController {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController enterDateController;
  late TextEditingController activeControleller;

  StudentEditeControllr(StudentModel student) {
    firstNameController = TextEditingController(text: student.firstName);
    lastNameController = TextEditingController(text: student.lastName);
    emailController = TextEditingController(text: student.email);
    phoneController = TextEditingController(text: student.phone);
    enterDateController = TextEditingController(text: student.dateCreate);
    activeControleller = TextEditingController(text: student.active);
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    enterDateController.dispose();
    activeControleller.dispose();
    super.dispose();
  }
}
