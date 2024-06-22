import 'package:admindash/controller/Home/MenuAppController.dart';
import 'package:admindash/responsive.dart';
import 'package:admindash/view/widget/home/sidemenue.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    MenuAppController controller = Get.put(MenuAppController());

    return Scaffold(
      key: controller.scaffoldKey,
      // appBar: Responsive.isMobile(context) ? AppBar() : null,
      // drawer: SideMenu(
      //   onMenuItemSelected: (index) {
      //     controller.selectedIndex.value = index;
      //     if (!Responsive.isDesktop(context)) {
      //       Navigator.pop(context);
      //     }
      //   },
      // ),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              SideMenu(
                onMenuItemSelected: (index) {
                  controller.selectedIndex.value = index;
                },
              ),
            Expanded(
              flex: 5,
              child: ValueListenableBuilder<int>(
                valueListenable: controller.selectedIndex,
                builder: (context, index, _) {
                  return controller.screens[index];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
