import 'package:admindash/core/services/servises.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const/app_routes.dart';

class MyMiddlewares extends GetMiddleware {
  @override
  int? get priority => 1;
  AppServices myServises = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myServises.sharpref.getInt('step') == 2) {
      return const RouteSettings(name: AppRoutes.homepage);
    }
    if (myServises.sharpref.getInt('step') == 1) {
      return const RouteSettings(name: AppRoutes.login);
    }
    return null;
  }
}
