import 'package:admindash/controller/Home/teacher/editeTecherController.dart';
import 'package:admindash/view/widget/ustomINputefielde.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditeWindow extends StatelessWidget {
  const EditeWindow({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    TeacherEditController c = Get.put(TeacherEditController());
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
                        controller: c.firstNameController,
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
                        controller: c.lastNameController,
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
                  hintext: 'Teacher Email',
                  controller: c.emailController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CustomInputeField(
                  enable: true,
                  obscureText: false,
                  title: 'Phone',
                  hintext: 'Teacher Phone',
                  controller: c.phoneController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CustomInputeField(
                  enable: true,
                  obscureText: false,
                  title: 'password',
                  hintext: 'enter the password',
                  controller: c.passwordController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CustomInputeField(
                  enable: true,
                  obscureText: false,
                  title: 'salary',
                  hintext: 'enter salary',
                  controller: c.salary,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CustomInputeField(
                  obscureText: false,
                  enable: true,
                  title: 'module',
                  hintext: 'enter module',
                  controller: c.moduleController,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
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
