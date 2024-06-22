import 'package:flutter/material.dart';
import 'package:admindash/data/models/Teacher_model.dart';
import 'package:get/get.dart';

class TeacherProfile extends StatelessWidget {
  final TeacherModle teacher;

  const TeacherProfile({super.key, required this.teacher});

  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InfoCard(label: '21'.tr, value: teacher.teacherFname!),
                    InfoCard(label: '22'.tr, value: teacher.teacherLname!),
                    InfoCard(
                        label: '3'.tr,
                        value: teacher
                            .teacherEmail!), // Uncomment when data is available
                    InfoCard(
                        label: '38'.tr,
                        value: teacher
                            .teacherPhone!), // Uncomment when data is available
                    InfoCard(label: '24'.tr, value: teacher.teacherModelName!),
                    InfoCard(label: '25'.tr, value: teacher.countGroup!),
                    InfoCard(label: '23'.tr, value: teacher.teacherDateCreate!),
                    InfoCard(
                      label: '39'.tr,
                      value: teacher.teacherSalary.toString(),
                    ), // Uncomment when data is available
                  ],
                ),
              ),
              Expanded(
                child: Image.asset(
                  'assets/images/male.png',
                  fit: BoxFit.contain,
                  height: sh * 0.4,
                ),
              ),
            ],
          ),
          const Spacer(),
        ],
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
