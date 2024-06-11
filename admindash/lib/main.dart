import 'package:admindash/view/screen/Home/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admindash/core/const/app_colors.dart';
import 'package:admindash/core/localization/change_local.dart';
import 'package:admindash/core/localization/my_translations.dart';
import 'package:admindash/core/services/servises.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  await initializedServices();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(1366, 700),
    minimumSize: Size(1366, 700),
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
    await windowManager.maximize(); // fullscreen window
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Localcontroller controller = Get.put(Localcontroller());
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      translations: MyTranslations(),
      locale: controller.language,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Appcolors.primarycolor),
        useMaterial3: true,
      ),
      // getPages: Routes,
      home: MainScreen(),
    );
  }
}
