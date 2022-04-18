

import 'package:crm_smart/constants.dart';
import 'package:crm_smart/model/notificationModel.dart';
import 'package:crm_smart/ui/screen/client/detail_client.dart';
import 'package:crm_smart/ui/screen/client/editClient.dart';
import 'package:crm_smart/ui/screen/home/approvepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class cardnotify extends StatelessWidget {
   cardnotify({Key? key, required this.itemNotify}) : super(key: key);
late NotificationModel itemNotify;
  @override
  Widget build(BuildContext context) {

    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(0)
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: Offset(1.0, 1.0),
              blurRadius: 8.0,
              color: Colors.black87.withOpacity(0.2),
            ),
          ],
          color: Colors.white30,
        ),
      child: Center(
        child: InkWell(
          onTap: () {
            //Late,ApproveDone,ApproveRefuse
            itemNotify.typeNotify=="Approve"?
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ApprovePage()))
            :  itemNotify.typeNotify=="Transfer"?
            Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) => Detail_Client(
                 // itemClient: null, fkclient: '', fkuser: '',
                    )
                ))
            :
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Detail_Client()));

          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              //borderRadius: BorderRadius.all( Radius.circular(5)),
    ),

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              offset: Offset(1.0, 1.0),
                              blurRadius: 8.0,
                              color: Colors.black87.withOpacity(0.2),
                            ),
                          ],
                          color: kMainColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 3,bottom: 3, left:6,right: 6),
                          child: Text(itemNotify.typeNotify=="Approve".toString()?"طلب موافقة"
                          :itemNotify.typeNotify=="Transfer".toString()?"تحويل العميل"
                              :" تأخر موعد",style:
                          TextStyle(
                            color: kWhiteColor,
                              //fontWeight: FontWeight.bold,
                              fontFamily: kfontfamily3),

                      ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(itemNotify.message,
                          style: TextStyle(fontFamily: kfontfamily3),),
                        Text(itemNotify.fromNameuser!,
                          style: TextStyle(fontFamily: kfontfamily3),),
                      ]),
                  //Row(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}