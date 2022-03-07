import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
   CustomFormField(
      {this.onChanged,this.hintText});
  String? hintText;
 Function(String)? onChanged;
  String? validateEmail(String email){
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(email))
      return 'Please make sure your email address is valid';

  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(

      validator: (data){
        if(data!.isEmpty){
          return 'الحقل فارغ';

        }
        validateEmail(data);

      },
      onChanged: onChanged,
    );
  }
}
