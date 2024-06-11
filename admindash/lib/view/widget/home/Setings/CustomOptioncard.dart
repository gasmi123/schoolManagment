import 'package:admindash/core/const/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCardOption extends StatelessWidget {
  final String titlecard;
  final Icon icon;
  final VoidCallback function;
  const CustomCardOption({
    Key? key,
    required this.titlecard,
    required this.icon,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        decoration: const BoxDecoration(
          color: Appcolors.whithe,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6,
            ),
          ],
        ),
        margin: const EdgeInsets.all(5),
        child: ListTile(
          title: Text(
            titlecard,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          trailing: icon,
        ),
      ),
    );
  }
}
