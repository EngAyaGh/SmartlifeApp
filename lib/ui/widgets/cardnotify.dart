

import 'package:crm_smart/constants.dart';
import 'package:crm_smart/model/notificationModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class cardnotify extends StatelessWidget {
   cardnotify({Key? key, required this.itemNotify}) : super(key: key);
late NotificationModel itemNotify;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
            //borderRadius: BorderRadius.only(bottomRight: Radius.circular(0)),
            // boxShadow: <BoxShadow>[
            //   BoxShadow(
            //     offset: Offset(1.0, 1.0),
            //     blurRadius: 8.0,
            //     color: Colors.black87.withOpacity(0.2),
            //   ),
            // ],
            color: Colors.white30,
          ),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                       // borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            offset: Offset(1.0, 1.0),
                            blurRadius: 8.0,
                            color: Colors.black87.withOpacity(0.2),
                          ),
                        ],
                        color: kMainColor,
                      ),
                      child: Text(itemNotify.typeNotify==TypeNotify.Approve?"طلب موافقة"
                      :itemNotify.typeNotify==TypeNotify.Transfer?"تحويل العميل"
                          :"تأخير",style:
                      TextStyle(
                        color: kWhiteColor,
                          //fontWeight: FontWeight.bold,
                          //fontFamily: kfontfamily2),
                      ),
                    ),
                    ),
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(itemNotify.message,),//style: TextStyle(fontFamily: kfontfamily2),),
                      Text(itemNotify.fromNameuser),//,style: TextStyle(fontFamily: kfontfamily2),),
                    ]),
                //Row(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
