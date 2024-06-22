import 'package:admindash/core/class/state_raqust.dart';
import 'package:admindash/core/class/stautus.dart';
import 'package:admindash/core/funcion/alert_not_cox.dart';
import 'package:admindash/core/funcion/head_data.dart';
import 'package:get/get.dart';

import '../../data/models/grad_modle.dart';
import '../../data/remot/screen/grad_data.dart';

class DashboardController extends GetxController {
  late StateRaqust stateRaqust;
  List<GradMode> modles = [];
  final GradData _data = GradData(Get.find());

  List<String> level = [
    " First hignt schoole",
    " second hignt schoole",
    " third hignt schoole"
  ];

  int getTotalStudent() {
    int t = 0;
    for (var e in modles) {
      t = t + int.parse(e.totalradNumber!);
    }
    return t;
  }

  getData() async {
    stateRaqust = StateRaqust.Laoding;
    update();
    var respones = await _data.getGradData();
    stateRaqust = headData(respones);
    if (stateRaqust == StateRaqust.succes) {
      if (respones[AppStatus.status] == AppStatus.sucsess) {
        List list = respones['data'];
        modles.addAll(list.map((e) => GradMode.fromJson(e)));
        list.clear();
      } else if (respones[AppStatus.status] == AppStatus.failure) {
        stateRaqust = StateRaqust.fuler;
      }
    } else {
      noIntrnat();
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
