import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../core/class/state_raqust.dart';
import '../../../core/class/stautus.dart';
import '../../../core/funcion/alert_not_cox.dart';
import '../../../core/funcion/head_data.dart';
import '../../../data/remot/screen/cour_data.dart';

class AddCourseController extends GetxController {
  late TextEditingController coursName;
  late TextEditingController sectionName;
  late TextEditingController coursLevel;
  late TextEditingController prise;
  late GlobalKey<FormState> globalKey;
  late StateRaqust stateRaqust;
  final CourData _data = CourData(Get.find());

  addCourse() async {
    if (globalKey.currentState!.validate()) {
      stateRaqust = StateRaqust.Laoding;
      update();
      var respones = await _data.addCours(
        cours_level: coursLevel.text,
        cours_name: coursName.text,
        cours_price: prise.text,
        cours_section: sectionName.text,
      );
      stateRaqust = headData(respones);
      if (stateRaqust == StateRaqust.succes) {
        if (respones[AppStatus.status] == AppStatus.sucsess) {
          Get.rawSnackbar(title: "تم", message: "تمت عملية اضافة الدورة بنجاح");
        } else if (respones[AppStatus.status] == AppStatus.failure) {
          Get.rawSnackbar(title: "فشل", message: "فشل عملية اضافة الدورة ");

          stateRaqust = StateRaqust.fuler;
        }
      } else {
        noIntrnat();
      }
      update();
    }
  }

  @override
  void onInit() {
    coursName = TextEditingController();
    sectionName = TextEditingController();
    coursLevel = TextEditingController();
    coursLevel = TextEditingController();
    prise = TextEditingController();
    globalKey = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  void dispose() {
    coursName.dispose();
    sectionName.dispose();
    coursLevel.dispose();
    super.dispose();
  }
}
