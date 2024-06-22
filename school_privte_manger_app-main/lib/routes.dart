import 'package:admindash/core/const/app_routes.dart';
import 'package:admindash/core/middlewares/my_middlewares.dart';
import 'package:admindash/view/screen/Home/HomeScreen.dart';
import 'package:admindash/view/screen/Home/student/EditeStudent.dart';
import 'package:admindash/view/screen/Home/teacher/Addteacher.dart';
import 'package:admindash/view/screen/auth/Login.dart';
import 'package:admindash/view/screen/auth/Onboarding.dart';
import 'package:get/get.dart';

import 'view/screen/Home/teacher/Edite.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: AppRoutes.onboarding,
      page: () => const Onboarding(),
      middlewares: [MyMiddlewares()]),
  GetPage(name: AppRoutes.login, page: () => const LoginScreen()),
  GetPage(name: AppRoutes.homepage, page: () => const MainScreen()),
  GetPage(name: AppRoutes.addTeacher, page: () => const AddteacherScreen()),
  GetPage(name: AppRoutes.editeWindow, page: () => const EditeWindow()),
  GetPage(name: AppRoutes.studenteditInfo, page: () => const StudentEdite())
];
