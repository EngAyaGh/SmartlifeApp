import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants.dart';

class CustomFormField extends StatelessWidget {
   CustomFormField(
      {this.onChanged,this.hintText,this.icon,this.con,this.vaild,this.label,this.inputType});
  String? hintText;
 Function(String)? onChanged;
String? Function(String?)? vaild;
    IconData? icon;
    TextEditingController? con;
    String? label;

    TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //textDirection: TextDirection.rtl,
      validator: vaild,
      onChanged: onChanged,
      controller: con,
      keyboardType:  inputType,
      /*inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],*/
      decoration: InputDecoration(

        labelText: label,
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
