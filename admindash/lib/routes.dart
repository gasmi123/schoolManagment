import 'package:admindash/core/const/app_routes.dart';
import 'package:admindash/core/middlewares/my_middlewares.dart';
import 'package:admindash/view/screen/Home/HomeScreen.dart';
import 'package:admindash/view/screen/Home/teacher/Addteacher.dart';
import 'package:admindash/view/screen/auth/Login.dart';
import 'package:admindash/view/screen/auth/Onboarding.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? Routes = [
  GetPage(
      name: AppRoutes.onboarding,
      page: () => const Onboarding(),
      middlewares: [MyMiddlewares()]),
  GetPage(name: AppRoutes.login, page: () => const LoginScreen()),
  GetPage(name: AppRoutes.homepage, page: () => const MainScreen()),
  GetPage(name: AppRoutes.addTeacher, page: () => const AddteacherScreen()),
];
