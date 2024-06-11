import 'package:flutter/material.dart';

class CustomInputeField extends StatelessWidget {
  final String title;
  final String hintext;
  final TextEditingController controller;
  final bool enable;
  final bool obscureText;
  const CustomInputeField(
      {super.key,
      required this.title,
      required this.hintext,
      required this.controller,
      required this.enable,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: title,
        hintText: hintext, // Improved label text
        border: const OutlineInputBorder(),
        enabled: enable,
      ),
    );
  }
}
