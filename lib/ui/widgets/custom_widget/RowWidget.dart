


import 'package:crm_smart/constants.dart';
import 'package:crm_smart/ui/widgets/custom_widget/separatorLine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget cardRow(String title,String value){
  return Column(

    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: TextStyle(fontFamily: kfontfamily3),),
          Spacer(),
          Text(value,style: TextStyle(fontFamily: kfontfamily2),),
        ],
      ),
      //Spacer(),
      Divider(thickness: 2,),
      //const MySeparator(color: Colors.grey),
      SizedBox(height: 20,),

    ],
  );

}