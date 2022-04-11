import 'dart:js';

import 'package:crm_smart/constants.dart';
import 'package:crm_smart/ui/screen/home/build_card.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('الرئيسية'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: kMainColor,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: BuildCard(),
      ),
    );
  }
}
