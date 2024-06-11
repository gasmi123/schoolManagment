import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppServices extends GetxService {
  late SharedPreferences sharpref;
  Future<AppServices> inite() async {
    sharpref = await SharedPreferences.getInstance();
    return this;
  }
}

initializedServices() async {
  await Get.putAsync(() => AppServices().inite());
}
