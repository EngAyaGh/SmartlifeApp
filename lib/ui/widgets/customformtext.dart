import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants.dart';

class CustomFormField extends StatelessWidget {
  CustomFormField(
      {this.onChanged,
      this.hintText,
      this.icon,
      this.con,
      this.vaild,
      this.label,
      this.inputType,
      this.maxline});
  String? hintText;
  Function(String)? onChanged;
  String? Function(String?)? vaild;
  IconData? icon;
  TextEditingController? con;
  String? label;
  int? maxline;
  TextInputType? inputType;

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
        //filled: false,
        //fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.black)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.black)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.black)),
      ),
    );
  }
}
