import 'package:admindash/data/models/student_modle.dart';
import 'package:admindash/view/screen/Home/student/changePassword.dart';

import 'package:admindash/view/widget/home/Setings/CustomOptioncard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentPrile extends StatelessWidget {
  final StudentModle student;

  const StudentPrile({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 200),
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InfoCard(label: '21'.tr, value: student.studentFname!),
                InfoCard(label: '22'.tr, value: student.studentLname!),
                InfoCard(label: '3'.tr, value: student.studentEmail!),
                InfoCard(label: '38'.tr, value: student.studentPhone!),
                InfoCard(label: '44'.tr, value: student.studentNumber!),
                InfoCard(label: '23'.tr, value: student.studentDateCreate!),
                InfoCard(label: '45'.tr, value: student.studentActive!),
                const SizedBox(
                  height: 60,
                ),
                CustomCardOption(
                  titlecard: '47'.tr,
                  icon: const Icon(
                    Icons.password,
                    color: Colors.green,
                  ),
                  function: () {
                    Get.to(
                      () => Changepassword(
                        studentid: student.studentId,
                      ),
                    );
                  },
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
