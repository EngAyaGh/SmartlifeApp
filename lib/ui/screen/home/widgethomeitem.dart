import 'package:crm_smart/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildSelectCategory({
  required String title,
  required Function() onTap,
}) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 30,
      right: 30,
      bottom: 20,
    ),
    child: Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: InkWell(
        onTap: onTap,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Text(title),
                ),
                Icon(
                  Icons.arrow_back_ios_new,
                  color: kMainColor,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}