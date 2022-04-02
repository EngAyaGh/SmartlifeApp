import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class CustomButton extends StatelessWidget {
  CustomButton({this.onTap, required this.text, this.width});
  VoidCallback? onTap;
  double? width;
  String? text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: kMainColor,
          borderRadius: BorderRadius.circular(8),
        ),
        width: width,
        height: 45,
        child: Center(
            child: Text(
          text!,
          style: TextStyle(color: kWhiteColor),
        )),
      ),
    );
  }
}
