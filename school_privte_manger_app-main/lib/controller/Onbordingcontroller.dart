import 'package:admindash/core/const/app_routes.dart';
import 'package:admindash/core/services/servises.dart';
import 'package:get/get.dart';

abstract class OncboardingController extends GetxController {
  nextpage();
}

class OncboardingControllerIMP extends OncboardingController {
  AppServices myServises = Get.find();

  @override
  nextpage() {
    print(myServises.sharpref.getInt("step"));
    myServises.sharpref.setInt("step", 1);
    Get.offAndToNamed(AppRoutes.login);
  }
}
