import 'package:admindash/data/models/group_modle.dart';
import 'package:admindash/data/models/student_modle.dart';
import 'package:admindash/data/remot/screen/group_data.dart';
import 'package:get/get.dart';

import '../../../../core/class/state_raqust.dart';
import '../../../../core/class/stautus.dart';
import '../../../../core/funcion/alert_not_cox.dart';
import '../../../../core/funcion/head_data.dart';

class StudentViewController extends GetxController {
  List<StudentModle> modles = [];
  late GroupModle modle;
  late StateRaqust stateRaqust;
  final GroupData _data = GroupData(Get.find());

  getStudent() async {
    stateRaqust = StateRaqust.Laoding;
    update();
    var respones = await _data.getStudentInGroup(lessonId: modle.lessonId!);
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

  void deleteStudentInGroup(int index) {
    Get.defaultDialog(
        title: "تحذير",
        middleText: "انت على وشك حذف هاته الدورة",
        onCancel: () {},
        textCancel: "الغاء",
        textConfirm: "متأكد",
        onConfirm: () {
          _data.deleteStudentInGroup(
              group_lesson_id: modle.lessonId!,
              group_student_id: modles[index].studentId!);
          modles.removeAt(index);
          update();
        });
  }

  @override
  void onInit() {
    modle = Get.arguments['modle'];
    getStudent();
    super.onInit();
  }
}
