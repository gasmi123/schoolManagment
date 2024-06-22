import 'package:admindash/core/const/app_colors.dart';
import 'package:flutter/material.dart';

class CustomBuutonLang extends StatelessWidget {
  final String Title;
  final void Function() function;
  const CustomBuutonLang(
      {super.key, required this.Title, required this.function});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Appcolors.seconderyColor,
          ),
          color: Appcolors.seconderyColor),
      child: InkWell(
        onTap: function,
        child: Center(
          child: Text(
            Title,
            style: const TextStyle(fontSize: 20, color: Appcolors.whithe),
          ),
        ),
      ),
    );
  }
}
