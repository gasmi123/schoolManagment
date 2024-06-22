import 'package:admindash/core/class/state_raqust.dart';
import 'package:admindash/data/models/cours_modle.dart';
import 'package:admindash/data/remot/screen/cour_data.dart';
import 'package:get/get.dart';
import 'package:admindash/data/test/courseList.dart';

import '../../../core/class/stautus.dart';
import '../../../core/funcion/alert_not_cox.dart';
import '../../../core/funcion/head_data.dart';

class CoursePgeController extends GetxController {
  late StateRaqust stateRaqust;
  final CourData _data = CourData(Get.find());
  List<CoursModel> modles = [];

  var searchQuery = "".obs;
  var results = courseslist.obs;

  getAllCourse() async {
    stateRaqust = StateRaqust.Laoding;
    update();
    var respones = await _data.getCours();
    stateRaqust = headData(respones);
    if (stateRaqust == StateRaqust.succes) {
      if (respones[AppStatus.status] == AppStatus.sucsess) {
        List list = respones['data'];
        modles.addAll(list.map((e) => CoursModel.fromJson(e)));
        results.value = modles;
        list.clear();
      } else if (respones[AppStatus.status] == AppStatus.failure) {
        stateRaqust = StateRaqust.fuler;
      }
    } else {
      noIntrnat();
    }
    update();
  }

  void deleteCours(int index) {
    Get.defaultDialog(
        title: "تحذير",
        middleText: "انت على وشك حذف هاته الدورة",
        onCancel: () {},
        textCancel: "الغاء",
        textConfirm: "متأكد",
        onConfirm: () {
          _data.deleteCours(id: modles[index].coursId!);
          modles.removeAt(index);
          update();
        });
  }

  // Move to screen add cours
  void goToAddCours() {}
  // move to screen edite cours
  void goToEditeCours() {}

  void updateSearchQuery(String query) {
    searchQuery.value = query;
    results.value = query.isEmpty
        ? modles
        : modles
            .where((course) =>
                course.coursName!.toLowerCase().contains(query.toLowerCase()) ||
                course.coursSection!
                    .toLowerCase()
                    .contains(query.toLowerCase()))
            .toList();
  }

  @override
  void onInit() {
    getAllCourse();
    super.onInit();
  }
}
