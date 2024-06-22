import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Cahngepasscontroller extends GetxController {
  late GlobalKey<FormState> globalKey;
  late TextEditingController oldpassword;
  late TextEditingController newpassword;

  @override
  void dispose() {
    oldpassword.dispose();
    newpassword.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    oldpassword = TextEditingController();
    newpassword = TextEditingController();
    globalKey = GlobalKey<FormState>();
    super.onInit();
  }
}
