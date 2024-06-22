import 'package:admindash/core/services/servises.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/state_raqust.dart';
import '../../core/class/stautus.dart';
import '../../core/const/app_routes.dart';
import '../../core/funcion/alert_not_cox.dart';
import '../../core/funcion/head_data.dart';
import '../../data/remot/auth/login_data.dart';

abstract class LoginControler extends GetxController {
  void login();
  // void gotoSingUp();
  // void goToForgetPasword();
}

class LoginControlerImp extends LoginControler {
  late TextEditingController email;
  late TextEditingController pasword;
  StateRaqust? stateRaqust;
  LoginData loginDataRemot = LoginData(Get.find());
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool obscureText = true;
  AppServices myServisess = Get.find();
  @override
  void onInit() {
    email = TextEditingController();
    pasword = TextEditingController();
    super.onInit();
  }

  void showPaswored() {
    obscureText = !obscureText;
    update(['obscureText']);
  }

  @override
  void login() async {
    print(pasword.text);
    var k = globalKey.currentState;
    if (k!.validate()) {
      stateRaqust = StateRaqust.Laoding;
      update(["login"]);

      var respons =
          await loginDataRemot.login(email: email.text, password: pasword.text);
      stateRaqust = headData(respons);

      if (stateRaqust == StateRaqust.succes) {
        if (respons[AppStatus.status] == AppStatus.sucsess) {
          myServisess.sharpref
              .setString("admin_id", respons['data']['admin_id']);
          myServisess.sharpref
              .setString("admin_fname", respons['data']['admin_fname']);

          myServisess.sharpref
              .setString("admin_lname", respons['data']['admin_lname']);
          myServisess.sharpref
              .setString("admin_email", respons['data']['admin_email']);
          myServisess.sharpref
              .setString("admin_phone", respons['data']['admin_phone']);
          myServisess.sharpref.setString(
              "admin_date_create", respons['data']['admin_date_create']);
          myServisess.sharpref
              .setString("admin_image", respons['data']['admin_image']);
          myServisess.sharpref.setString(
              "admin_verfication", respons['data']['admin_verfication']);
          myServisess.sharpref
              .setString("admin_level", respons['data']['admin_level']);

          myServisess.sharpref.setInt("step", 2);
          Get.toNamed(AppRoutes.homepage);
        } else if (respons[AppStatus.status] == AppStatus.failure) {
          Get.defaultDialog(
              title: "waring ",
              middleText: 'the email or number phont is not fud');
        }
      } else {
        noIntrnat();
      }
      update(["login"]);
    }
    @override
    void dispose() {
      pasword.dispose();
      email.dispose();

      super.dispose();
    }
  }
}
