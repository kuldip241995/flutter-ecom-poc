import 'package:flutter/material.dart';
import 'package:flutter_poc/core/constants/constants.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final AutovalidateMode autovalidateMode;
  final bool obscureText;
  final TextInputType keyboardType; // Add keyboardType property
  final String? Function(String?) validator;
  final Function(String) onChanged;
  // final InputDecoration decoration;

  AppTextField({
    required this.controller,
    this.autovalidateMode = AutovalidateMode.always,
    this.obscureText = false,
    this.keyboardType = TextInputType.text, // Default to TextInputType.text
    required this.validator,
    required this.onChanged,
    // required this.decoration,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidateMode: autovalidateMode,
      obscureText: obscureText,
      keyboardType: keyboardType, // Set keyboardType
      validator: validator,
      onChanged: onChanged,
      decoration: kTextFieldDecoration,
    );
  }
}
