import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Function(String) onChanged;
  final bool obscureText;
  final Color focusedBorderColor;

  const CustomTextField(
      {Key? key,
      required this.hintText,
      required this.controller,
      this.keyboardType = TextInputType.text,
      this.textInputAction = TextInputAction.done,
      required this.onChanged,
      required this.obscureText,
      this.focusedBorderColor = Colors.grey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onChanged: onChanged,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: focusedBorderColor),
        ),
      ),
    );
  }
}
