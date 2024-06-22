import 'package:get/get.dart';

import '../core/class/read_updata_delete_inser_view.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ReadUpdateDeleteInsertView());
  }
}
