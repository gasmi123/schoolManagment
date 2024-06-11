import 'package:admindash/core/const/app_colors.dart';
import 'package:admindash/data/models/studentsmodel.dart';
import 'package:admindash/view/screen/Home/student/EditeStudent.dart';

import 'package:admindash/view/widget/home/Setings/CustomOptioncard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentPrile extends StatelessWidget {
  final StudentModel student;

  const StudentPrile({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;

    void showEditDialog(BuildContext context) {
      showDialog(
        context: context,
        barrierDismissible: false, // Prevents closing when clicking outside
        builder: (BuildContext context) {
          return EditeStudentinfo(
            student: student,
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Container(
                  child: Image.asset(
                    'assets/images/qr-code.png',
                    fit: BoxFit.contain,
                    height: sh * 0.4,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InfoCard(label: '21'.tr, value: student.firstName),
                    InfoCard(label: '22'.tr, value: student.lastName),
                    InfoCard(label: '3'.tr, value: student.email),
                    InfoCard(label: '38'.tr, value: student.phone),
                    InfoCard(label: '44'.tr, value: student.number),
                    InfoCard(label: '23'.tr, value: student.dateCreate),
                    InfoCard(label: '45'.tr, value: student.active),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: sw * 0.3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomCardOption(
                  titlecard: '40'.tr,
                  icon: const Icon(
                    Icons.edit,
                    color: Appcolors.primarycolor,
                  ),
                  function: () {
                    showEditDialog(context);
                  },
                ),
                CustomCardOption(
                  titlecard: '47'.tr,
                  icon: const Icon(
                    Icons.password,
                    color: Colors.green,
                  ),
                  function: () {},
                ),
                CustomCardOption(
                  titlecard: '41'.tr,
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  function: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String label;
  final String value;

  const InfoCard({Key? key, required this.label, required this.value})
      : super(key: key);

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
            SizedBox(width: 8),
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
