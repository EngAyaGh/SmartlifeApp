import 'package:crm_smart/ui/screen/client/marketing/clientmarketing.dart';
import 'package:crm_smart/ui/screen/client/marketing/invoice_marketing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../widgethomeitem.dart';

class marketingpage extends StatelessWidget {
  const marketingpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'التسويق',
          style: TextStyle(color: kWhiteColor,
              fontFamily: kfontfamily2),
        ),
        centerTitle: true,
        backgroundColor: kMainColor,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 50),
        child:
        Column(children: [
          buildSelectCategory(
              colorbag: Colors.white,
              colortitle: Colors.black,
              colorarrow: Colors.black,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>
                        clientmarketing()));
          }, title: 'عملاء التسويق الإلكتروني'),
          buildSelectCategory(
              colorbag: Colors.white,
              colortitle: Colors.black,
              colorarrow: Colors.black,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>
                        invoice_marketing()));
              },
              title: 'فواتير عملاء التسويق الإلكتروني'),
          buildSelectCategory(
              colorbag: Colors.white,
              colortitle: Colors.black,
              colorarrow: Colors.black,
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(
                //     builder: (context)=>
                //         invoice_marketing()
                // ));
              },
              title: 'تقرير التسويق الإلكتروني'),

        ],),

      ),
    );
  }
}
