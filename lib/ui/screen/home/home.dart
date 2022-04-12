import 'dart:js';

import 'package:crm_smart/constants.dart';
import 'package:crm_smart/ui/screen/home/build_card.dart';
import 'package:crm_smart/ui/widgets/custom_widget/appbar.dart';
import 'package:crm_smart/ui/widgets/custom_widget/customDrawer.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
   Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:

      CustomDrawer(),
      backgroundColor: Colors.grey[200],
      appBar:customAppbar(),
      // AppBar(
      //   title: Text('الرئيسية',style: TextStyle(color: kWhiteColor),),
      //   centerTitle: true,
      //   elevation: 0,
      //   backgroundColor: kMainColor,
      // ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: BuildCard(),
      ),
    );
  }
}
