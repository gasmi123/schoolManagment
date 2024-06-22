import 'package:admindash/controller/Home/Student/StudentConroller.dart';
import 'package:admindash/core/const/app_colors.dart';
import 'package:admindash/responsive.dart';
import 'package:admindash/view/screen/Home/allCourses/AddStudentToCourse.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListStudentCours extends StatelessWidget {
  const ListStudentCours({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    // TeacherEditController c = Get.put(TeacherEditController(teacher));
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (!Responsive.isMobile(context))
                Text(
                  'Student Subscrib in '.tr,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              if (!Responsive.isMobile(context))
                // add student
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible:
                          false, // Prevents closing when clicking outside
                      builder: (BuildContext context) {
                        return AddStudentToCourse();
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 10)),
                  child: Row(
                    children: [
                      Text(
                        '46'.tr,
                        style: const TextStyle(
                            color: Appcolors.primarycolor, fontSize: 18),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Icon(
                        Icons.add,
                        color: Appcolors.primarycolor,
                      ),
                    ],
                  ),
                ),
              if (!Responsive.isMobile(context))
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 10)),
                  child: Row(
                    children: [
                      Text(
                        '27'.tr,
                        style: const TextStyle(
                            color: Appcolors.primarycolor, fontSize: 18),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Icon(
                        Icons.download,
                        color: Appcolors.primarycolor,
                      ),
                    ],
                  ),
                ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: GetBuilder<StudentViewController>(
              init: StudentViewController(),
              builder: (controller) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Table(
                    border: TableBorder.all(color: Colors.black),
                    columnWidths: const {
                      0: FlexColumnWidth(1),
                      1: FlexColumnWidth(1),
                      2: FlexColumnWidth(2),
                      5: FlexColumnWidth(1),
                    },
                    children: [
                      TableRow(
                        children: [
                          tableCell(celValue(content: '21'.tr, isHeader: true)),
                          tableCell(celValue(content: '22'.tr, isHeader: true)),
                          tableCell(celValue(
                              content: 'Student Code'.tr, isHeader: true)),
                          tableCell(
                              const celValue(content: '', isHeader: true)),
                        ],
                      ),
                      // for (int index = 0;
                      //     index < controller.techerList.length;
                      //     index++)
                      TableRow(
                        children: [
                          tableCell(
                            const celValue(
                              content: 'ayemn',
                              isHeader: false,
                            ),
                          ),
                          tableCell(
                              celValue(content: 'Gasmi', isHeader: false)),
                          tableCell(
                            celValue(
                              content: '555',
                              isHeader: false,
                            ),
                          ),
                          tableCell(
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {},
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
                );
              },
            ),
          ),
        ],
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
