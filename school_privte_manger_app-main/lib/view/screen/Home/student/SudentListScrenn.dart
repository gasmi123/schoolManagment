import 'package:admindash/core/const/app_colors.dart';
import 'package:admindash/view/widget/home/student/CustomeStudentHeader.dart';
import 'package:admindash/view/widget/home/student/customSudenttable.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentList extends StatelessWidget {
  const StudentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: CupertinoSearchTextField(
              onChanged: (value) {},
              decoration: BoxDecoration(
                color: Appcolors.whithe,
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          CustomStudentHead(),
          SizedBox(
            height: 30,
          ),
          CustomStudenttable(),
        ],
      ),
    );
  }
}
