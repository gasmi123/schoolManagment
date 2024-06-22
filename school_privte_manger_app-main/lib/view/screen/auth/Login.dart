import 'package:admindash/core/class/state_raqust.dart';
import 'package:admindash/core/const/Rgexpression.dart';
import 'package:admindash/core/const/ScreenSize.dart';
import 'package:admindash/core/const/app_colors.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControlerImp controller = Get.put(LoginControlerImp());

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final widthScreen = constraints.maxWidth;
          return SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(50),
                    child: Image.asset(
                      "assets/images/male.png",
                      width: 200,
                    ),
                  ),
                  Form(
                    key: controller.globalKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: widthScreen < sm
                                ? widthScreen
                                : widthScreen * 0.5,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextFormField(
                              controller: controller.email,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '6'.tr;
                                }
                                if (!EmailValidator.validate(value) &&
                                    !regExp.hasMatch(value)) {
                                  return '7'.tr;
                                }

                                return null;
                              },
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: '3'.tr,
                              ),
                            ),
                          ),
                          Container(
                            width: widthScreen < sm
                                ? widthScreen
                                : widthScreen * 0.5,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: GetBuilder<LoginControlerImp>(
                                id: "obscureText",
                                builder: (c) {
                                  return TextFormField(
                                    controller: controller.pasword,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return '5'.tr;
                                      }

                                      return null;
                                    },
                                    obscureText: c.obscureText,
                                    decoration: InputDecoration(
                                      border: const OutlineInputBorder(),
                                      labelText: "4".tr,
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          c.obscureText
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                        ),
                                        onPressed: () {
                                          c.showPaswored();
                                        },
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: widthScreen < sm ? widthScreen : widthScreen * 0.5,
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Appcolors.seconderyColor,
                        ),
                        color: Appcolors.seconderyColor),
                    child: InkWell(
                      onTap: () {
                        controller.login();
                      },
                      child: Center(
                        child: GetBuilder<LoginControlerImp>(
                            id: "login",
                            builder: (c) {
                              return c.stateRaqust != StateRaqust.Laoding
                                  ? Text(
                                      "2".tr,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Appcolors.whithe,
                                      ),
                                    )
                                  : const CircularProgressIndicator(
                                      color: Appcolors.whithe,
                                    );
                            }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
