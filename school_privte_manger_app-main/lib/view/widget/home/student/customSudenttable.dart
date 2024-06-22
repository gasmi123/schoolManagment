import 'package:admindash/core/class/handling_data.dart';
import 'package:admindash/view/screen/Home/student/StudentProfile.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/Home/Student/StudentConroller.dart';

class CustomStudenttable extends StatelessWidget {
  const CustomStudenttable({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<StudentViewController>(
        init: StudentViewController(),
        builder: (controller) {
          return HadlingData(
            stateRaqust: controller.stateRaqust,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
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
                        tableCell(
                            celValue(content: 'الرقم'.tr, isHeader: true)),
                        tableCell(celValue(
                            content: 'السنة الدراسية'.tr, isHeader: true)),
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
                              content: controller.modles[index].studentFname!,
                              isHeader: false,
                            ),
                          ),
                          tableCell(celValue(
                              content: controller.modles[index].studentLname!,
                              isHeader: false)),
                          tableCell(
                            celValue(
                              content: controller
                                  .modles[index].studentDateCreate
                                  .toString(),
                              isHeader: false,
                            ),
                          ),
                          tableCell(
                            celValue(
                              content: controller.modles[index].studentNumber!,
                              isHeader: false,
                            ),
                          ),
                          tableCell(
                            celValue(
                              content: controller.modles[index].studentLevel
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
                                    Get.to(() => StudentPrile(
                                        student: controller.modles[index]));
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
                                    controller.DeleteStudent(index);
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
