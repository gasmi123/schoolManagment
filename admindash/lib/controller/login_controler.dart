import 'package:admindash/core/const/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class LoginControler extends GetxController {
  void login();
}

class LoginControlerImp extends LoginControler {
  late TextEditingController email;
  late TextEditingController pasword;
  // StateRaqust? stateRaqust;
  // LoginData loginDataRemot = LoginData(Get.find());
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool obscureText = true;
  // Servises myServisess = Get.find();
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
    var k = globalKey.currentState;
    if (k!.validate()) {
      Get.offAllNamed(AppRoutes.homepage);
    }
  }

  @override
  void dispose() {
    pasword.dispose();
    email.dispose();

    super.dispose();
  }
}
