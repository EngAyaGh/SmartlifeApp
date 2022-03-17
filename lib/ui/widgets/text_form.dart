

import 'package:flutter/material.dart';

class EditTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;

  final String hintText;

  const EditTextFormField(
      {required this.hintText,
        required this.obscureText,
        required this.controller,
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintStyle: const TextStyle(
            color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w500),
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey.shade200,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white)),
      ),
    );
  }
}