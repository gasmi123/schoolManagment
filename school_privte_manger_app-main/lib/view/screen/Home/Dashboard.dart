import 'package:admindash/core/const/ScreenSize.dart';
import 'package:admindash/view/widget/home/Dashboard/AllCourses.dart';
import 'package:admindash/view/widget/home/Dashboard/header.dart';
import 'package:flutter/material.dart';

class Dashscreen extends StatelessWidget {
  const Dashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: const [
            SizedBox(height: defaultPadding * 2),
            Header(),
            SizedBox(height: defaultPadding),
            AllCourses(),
          ],
        ),
      ),
    );
  }
}
