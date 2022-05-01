


import 'package:crm_smart/constants.dart';
import 'package:crm_smart/ui/widgets/custom_widget/separatorLine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class cardRow extends StatelessWidget {
  cardRow({this.alignment,required this.value,required this.title,Key? key})
      : super(key: key);
  var alignment;
  String title;
  String value;
  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Row(
          mainAxisAlignment: alignment==null? MainAxisAlignment.end:alignment,
          children: [
            Text(title,style: TextStyle(fontFamily: kfontfamily3),),
            Spacer(),
            Text(value,style: TextStyle(fontFamily: kfontfamily2),),
          ],
        ),
        //Spacer(),
        Divider(thickness: 2,color: Colors.amberAccent,),
        //const MySeparator(color: Colors.grey),
        SizedBox(height: 10,),

      ],
    );
  }
}

// Widget cardRow(String title,String value){
//   return Column(
//
//     children: [
//       Row(
//         mainAxisAlignment: alignment==null? MainAxisAlignment.spaceBetween:alignment,
//         children: [
//           Text(title,style: TextStyle(fontFamily: kfontfamily3),),
//           Spacer(),
//           Text(value,style: TextStyle(fontFamily: kfontfamily2),),
//         ],
//       ),
//       //Spacer(),
//       Divider(thickness: 2,color: Colors.amberAccent,),
//       //const MySeparator(color: Colors.grey),
//       SizedBox(height: 10,),
//
//     ],
//   );
//
// }