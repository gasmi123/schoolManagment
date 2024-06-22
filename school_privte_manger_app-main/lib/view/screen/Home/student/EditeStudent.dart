import 'package:admindash/controller/Home/Student/EditStudentInfocontroller.dart';
import 'package:admindash/view/widget/ustomINputefielde.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentEdite extends StatelessWidget {
  const StudentEdite({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    StudentEditeControllr c = Get.put(StudentEditeControllr());
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        // width: MediaQuery.of(context).size.width * 0.3,
        // دير تحقق في كل حقل ادخال
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CustomInputeField(
                        enable: true,
                        title: 'first name',
                        obscureText: false,
                        hintext: 'enter your first name',
                        controller: c.firstnaem,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CustomInputeField(
                        enable: true,
                        obscureText: false,
                        title: 'last name',
                        hintext: 'enter your last name',
                        controller: c.lastname,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CustomInputeField(
                  enable: true,
                  obscureText: false,
                  title: 'email',
                  hintext: 'student Email',
                  controller: c.email,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CustomInputeField(
                  enable: true,
                  obscureText: false,
                  title: 'Phone',
                  hintext: 'student Phone',
                  controller: c.phone,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        c.editeinfo();
                      },
                      child: Text('40'.tr),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text('42'.tr),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
