import 'package:admindash/core/const/app_routes.dart';
import 'package:admindash/data/models/student_modle.dart';
import 'package:admindash/data/remot/screen/student_data.dart';
import 'package:get/get.dart';

import '../../../core/class/state_raqust.dart';
import '../../../core/class/stautus.dart';
import '../../../core/funcion/alert_not_cox.dart';
import '../../../core/funcion/head_data.dart';

class StudentViewController extends GetxController {
  List<StudentModle> modles = [];
  late StateRaqust stateRaqust;
  final StudentData _data = StudentData(Get.find());

  getStudent() async {
    stateRaqust = StateRaqust.Laoding;
    update();
    var respones = await _data.getData();
    stateRaqust = headData(respones);
    if (stateRaqust == StateRaqust.succes) {
      if (respones[AppStatus.status] == AppStatus.sucsess) {
        List list = respones['data'];
        modles.addAll(list.map((e) => StudentModle.fromJson(e)));
        list.clear();
      } else if (respones[AppStatus.status] == AppStatus.failure) {
        stateRaqust = StateRaqust.fuler;
      }
    } else {
      noIntrnat();
    }
    update();
  }

  goToEdite(int index) {
    Get.toNamed(AppRoutes.studenteditInfo, arguments: {"modle": modles[index]});
  }

  void DeleteStudent(int index) {}
  @override
  void onInit() {
    getStudent();
    super.onInit();
  }
}
