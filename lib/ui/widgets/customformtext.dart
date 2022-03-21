import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants.dart';

class CustomFormField extends StatelessWidget {
  CustomFormField({

        this.onChanged,
      this.hintText,
      this.icon,
      this.con,
      this.vaild,
      this.label,
      this.inputType,
      this.maxline,
      required this.radius,});

  String? hintText;
  Function(String)? onChanged;
  String? Function(String?)? vaild;
  IconData? icon;
  TextEditingController? con;
  String? label;
  int? maxline;
  TextInputType? inputType;
double radius;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxline,

      textDirection: TextDirection.rtl,
      validator: vaild,
      onChanged: onChanged,
      controller: con,
      keyboardType: inputType,

      /*inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],*/

      decoration: InputDecoration(
        hintTextDirection: TextDirection.rtl,
        alignLabelWithHint: true,

        labelText: label,
        labelStyle: TextStyle(color: kMainColor,),
        hintText: hintText,

        prefixIcon: Icon(
          icon,
          color: kMainColor,
        ),
        filled: true,
        fillColor: Colors.grey.shade200,
        // hintStyle: const TextStyle(
        //     color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w500),
        //filled: false,
        //fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(color: Colors.black)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(color: Colors.black)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(color: Colors.black)),
      ),
    );
  }
}
