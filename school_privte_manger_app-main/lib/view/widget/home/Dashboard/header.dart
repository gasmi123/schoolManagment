import 'package:admindash/core/const/ScreenSize.dart';
import 'package:admindash/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../controller/Home/MenuAppController.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
    MenuAppController controller = Get.find<MenuAppController>();

    // Find the existing instance
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        if (!Responsive.isMobile(context))
          Text(
            '17'.tr,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        if (!Responsive.isMobile(context))
          ProfileCard(
            adminName: controller.modle.adminFname! +
                " " +
                controller.modle.adminLname!,
          ),
        if (!Responsive.isMobile(context))
          Text(
            formattedDate,
            style: Theme.of(context).textTheme.titleLarge,
          ),
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String adminName;

  const ProfileCard({
    super.key,
    required this.adminName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: defaultPadding),
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          if (!Responsive.isMobile(context))
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '8'.tr,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    adminName,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
