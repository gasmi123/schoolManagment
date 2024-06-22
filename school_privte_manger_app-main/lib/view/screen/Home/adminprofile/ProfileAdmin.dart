import 'package:admindash/controller/Home/MenuAppController.dart';
import 'package:admindash/core/const/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profileadmine extends StatelessWidget {
  const Profileadmine({super.key});
  @override
  Widget build(BuildContext context) {
    MenuAppController c = Get.put(MenuAppController());
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 50, vertical: 200),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InfoCard(label: '21'.tr, value: c.modle.adminFname!),
                      InfoCard(label: '22'.tr, value: c.modle.adminLname!),
                      InfoCard(label: '3'.tr, value: c.modle.adminEmail!),
                    ],
                  ),
                ),
                // admin image  :
                Expanded(
                  child: Image.asset(
                    'assets/images/male.png',
                    fit: BoxFit.contain,
                    height: 200,
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String label;
  final String value;

  const InfoCard({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              '$label:',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge, // Consider using a more appropriate text style
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                value,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
