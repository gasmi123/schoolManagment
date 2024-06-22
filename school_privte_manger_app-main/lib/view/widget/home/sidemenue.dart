import 'package:admindash/core/const/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  final Function(int) onMenuItemSelected;

  const SideMenu({required this.onMenuItemSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Appcolors.primarycolor,
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/school.png",
                  width: 100,
                ),
                Text('9'.tr)
              ],
            ),
          ),
          DrawerListTile(
            title: '10'.tr,
            icon: const Icon(
              Icons.home,
              color: Appcolors.bluelight,
            ),
            press: () => onMenuItemSelected(0),
          ),
          DrawerListTile(
            title: '11'.tr,
            icon: const Icon(
              Icons.list,
              color: Appcolors.bluelight,
            ),
            press: () => onMenuItemSelected(1),
          ),
          DrawerListTile(
            title: '43'.tr,
            icon: const Icon(
              Icons.list,
              color: Appcolors.bluelight,
            ),
            press: () => onMenuItemSelected(2),
          ),
          DrawerListTile(
            title: '12'.tr,
            icon: const Icon(
              Icons.grade,
              color: Appcolors.bluelight,
            ),
            press: () => onMenuItemSelected(3),
          ),
          DrawerListTile(
            title: '14'.tr,
            icon: const Icon(
              Icons.home,
              color: Appcolors.bluelight,
            ),
            press: () => onMenuItemSelected(4),
          ),
          DrawerListTile(
            title: '15'.tr,
            icon: const Icon(
              Icons.settings,
              color: Appcolors.bluelight,
            ),
            press: () => onMenuItemSelected(5),
          ),
          DrawerListTile(
            title: '16'.tr,
            icon: const Icon(
              Icons.logout,
              color: Appcolors.bluelight,
            ),
            press: () {
              // Handle logout functionality
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.title,
    required this.icon,
    required this.press,
  });

  final String title;
  final Icon icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      title: Text(
        title,
        style: const TextStyle(color: Appcolors.whithe),
      ),
      leading: icon,
    );
  }
}
