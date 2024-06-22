import 'package:admindash/controller/Home/teacher/TeacherListController.dart';
import 'package:admindash/core/class/handling_data.dart';
import 'package:admindash/view/screen/Home/teacher/teacherProfile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomeTeacherTable extends StatelessWidget {
  const CustomeTeacherTable({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<ViewTeacherController>(
        init: ViewTeacherController(),
        builder: (controller) {
          return HadlingData(
            stateRaqust: controller.stateRaqust,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Table(
                  border: TableBorder.all(color: Colors.black),
                  columnWidths: const {
                    0: FlexColumnWidth(1),
                    1: FlexColumnWidth(1),
                    2: FlexColumnWidth(2),
                    3: FlexColumnWidth(1),
                    4: FlexColumnWidth(1),
                    5: FlexColumnWidth(1),
                  },
                  children: [
                    TableRow(
                      children: [
                        tableCell(celValue(content: '21'.tr, isHeader: true)),
                        tableCell(celValue(content: '22'.tr, isHeader: true)),
                        tableCell(celValue(content: '23'.tr, isHeader: true)),
                        tableCell(celValue(content: '24'.tr, isHeader: true)),
                        tableCell(celValue(content: '25'.tr, isHeader: true)),
                        tableCell(const celValue(content: '', isHeader: true)),
                      ],
                    ),
                    for (int index = 0;
                        index < controller.modles.length;
                        index++)
                      TableRow(
                        children: [
                          tableCell(
                            celValue(
                              content: controller.modles[index].teacherFname!,
                              isHeader: false,
                            ),
                          ),
                          tableCell(celValue(
                              content: controller.modles[index].teacherLname!,
                              isHeader: false)),
                          tableCell(
                            celValue(
                              content: controller
                                  .modles[index].teacherDateCreate
                                  .toString(),
                              isHeader: false,
                            ),
                          ),
                          tableCell(
                            celValue(
                              content:
                                  controller.modles[index].teacherModelName!,
                              isHeader: false,
                            ),
                          ),
                          tableCell(
                            celValue(
                              content: controller.modles[index].countGroup
                                  .toString(),
                              isHeader: false,
                            ),
                          ),
                          tableCell(
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Get.to(() => TeacherProfile(
                                          teacher: controller.modles[index],
                                        ));
                                  },
                                  icon:
                                      const Icon(Icons.remove_red_eye_outlined),
                                ),
                                IconButton(
                                  onPressed: () {
                                    controller.goToEdite(index);
                                  },
                                  icon: const Icon(Icons.edit,
                                      color: Colors.blue),
                                ),
                                IconButton(
                                  onPressed: () {
                                    controller.deleteTeacher(index);
                                  },
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget tableCell(Widget content) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: content,
  );
}

class celValue extends StatelessWidget {
  final String content;
  final bool isHeader;

  const celValue({super.key, required this.content, required this.isHeader});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      content,
      style: TextStyle(
        fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
        fontSize: 16,
        color: isHeader ? Colors.black : Colors.black,
      ),
    );
  }
}
