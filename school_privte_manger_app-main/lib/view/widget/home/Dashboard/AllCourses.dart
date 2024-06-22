import 'package:admindash/controller/Home/dashboardController.dart';
import 'package:admindash/core/class/handling_data.dart';
import 'package:admindash/core/const/ScreenSize.dart';
import 'package:admindash/core/const/app_colors.dart';
import 'package:admindash/data/models/grad_modle.dart';
import 'package:admindash/responsive.dart';
import 'package:admindash/view/widget/home/Dashboard/ProgressLine.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllCourses extends StatelessWidget {
  const AllCourses({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    DashboardController c = Get.put(DashboardController());
    return Column(
      children: [
        if (Responsive.isMobile(context))
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "19".tr,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Appcolors.seconderyColor,
                ),
                padding: const EdgeInsets.all(defaultPadding),
                child: Row(
                  children: [
                    Text(
                      '18'.tr,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      " : ",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    GetBuilder<DashboardController>(builder: (c) {
                      if (c.modles.isNotEmpty) {
                        return Text(
                          // Get the total Student numer
                          "${c.getTotalStudent()}",
                          style: Theme.of(context).textTheme.titleMedium,
                        );
                      } else {
                        return Text(
                          // Get the total Student numer
                          "0",
                          style: Theme.of(context).textTheme.titleMedium,
                        );
                      }
                    }),
                  ],
                ),
              )
            ],
          ),
        if (Responsive.isDesktop(context))
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '19'.tr,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Appcolors.seconderyColor,
                ),
                padding: const EdgeInsets.all(defaultPadding),
                child: Row(
                  children: [
                    Text("18".tr,
                        style: const TextStyle(color: Appcolors.whithe)),
                    const Text(
                      " : ",
                      style: TextStyle(color: Appcolors.whithe),
                    ),
                    GetBuilder<DashboardController>(builder: (c) {
                      if (c.modles.isNotEmpty) {
                        return Text(
                          // Get the total Student numer
                          "${c.getTotalStudent()}",
                          style: TextStyle(color: Appcolors.whithe),
                        );
                      } else {
                        return Text(
                          // Get the total Student numer
                          "0",
                          style: TextStyle(color: Appcolors.whithe),
                        );
                      }
                    }),
                  ],
                ),
              )
            ],
          ),
        const SizedBox(height: defaultPadding),
        Container(
          height: _size.height * 0.7, // Example: 50% of the screen height
          child: GetBuilder<DashboardController>(builder: (c) {
            return HadlingData(
              stateRaqust: c.stateRaqust,
              child: ListView.builder(
                itemCount: c.modles.length,
                itemBuilder: (context, i) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    child: LevelsCardInfo(
                      gard: c.modles[i],
                      levelString: c.level[i],
                      totalStudentNuber: c.getTotalStudent(),
                    ),
                  );
                },
              ),
            );
          }),
        ),
      ],
    );
  }
}

class LevelsCardInfo extends StatelessWidget {
  final GradMode gard;
  final int totalStudentNuber;
  final String levelString;
  const LevelsCardInfo(
      {super.key,
      required this.gard,
      required this.totalStudentNuber,
      required this.levelString});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: Appcolors.seconderyColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            levelString,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          ProgressLine(
            percentage: int.tryParse(gard.totalradNumber!),
            totalStudentNubr: totalStudentNuber,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                "${gard.totalradNumber}",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.white70),
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                '20'.tr,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.white70),
              ),
            ],
          )
        ],
      ),
    );
  }
}
