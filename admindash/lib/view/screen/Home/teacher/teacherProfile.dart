import 'package:admindash/core/const/app_colors.dart';
import 'package:admindash/view/screen/Home/teacher/Edite.dart';
import 'package:admindash/view/widget/home/Setings/CustomOptioncard.dart';
import 'package:flutter/material.dart';
import 'package:admindash/data/models/TeacherModel.dart';
import 'package:get/get.dart';

class TeacherProfile extends StatelessWidget {
  final Teacher teacher;

  const TeacherProfile({super.key, required this.teacher});

  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;

    void showEditDialog(BuildContext context) {
      showDialog(
        context: context,
        barrierDismissible: false, // Prevents closing when clicking outside
        builder: (BuildContext context) {
          return EditeWindow(
            teacher: teacher,
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Container(
                  child: Image.asset(
                    'assets/images/male.png',
                    fit: BoxFit.contain,
                    height: sh * 0.4,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InfoCard(label: '21'.tr, value: teacher.firstName),
                    InfoCard(label: '22'.tr, value: teacher.lastName),
                    InfoCard(
                        label: '3'.tr,
                        value:
                            teacher.email), // Uncomment when data is available
                    InfoCard(
                        label: '38'.tr,
                        value:
                            teacher.phone), // Uncomment when data is available
                    InfoCard(label: '24'.tr, value: teacher.module),
                    InfoCard(
                        label: '25'.tr,
                        value: teacher.numberOfGroups.toString()),
                    InfoCard(label: '23'.tr, value: teacher.dateOfEntry),
                    InfoCard(
                      label: '39'.tr,
                      value: teacher.salary.toString(),
                    ), // Uncomment when data is available
                  ],
                ),
              ),
            ],
          ),
          Spacer(),
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
          Spacer(),
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
