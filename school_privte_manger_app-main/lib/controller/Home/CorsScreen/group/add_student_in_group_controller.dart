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
    var respones = await _data.getStudentNotInGroup(lessonId: modle.lessonId!);
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

  addStudent(int index) async {
    stateRaqust = StateRaqust.Laoding;
    update();
    var respones = await _data.addStudentInGroup(
        group_student_id: modles[index].studentId!,
        group_lesson_id: modle.lessonId!);
    stateRaqust = headData(respones);
    if (stateRaqust == StateRaqust.succes) {
      if (respones[AppStatus.status] == AppStatus.sucsess) {
        Get.rawSnackbar(
            title: "تم", message: "تمت عملية اضافة التلميذ الى المجموعة بنجاح");
        modles.removeAt(index);
      } else if (respones[AppStatus.status] == AppStatus.failure) {
        Get.rawSnackbar(
            title: "فشل", message: "فشل عملية اضافة التلميذ الى المجموعة ");

        stateRaqust = StateRaqust.succes;
      }
    } else {
      noIntrnat();
    }
    update();
  }

  @override
  void onInit() {
    modle = Get.arguments['modle'];
    getStudent();
    super.onInit();
  }
}
