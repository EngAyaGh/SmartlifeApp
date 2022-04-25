import 'package:crm_smart/model/usermodel.dart';
import 'package:flutter/material.dart';

class TargetPage extends StatelessWidget {
  UserModel userModel;
  TargetPage({required this.userModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Target'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
          child: Text(
        'Target',
        style: TextStyle(color: Colors.black),
      )),
    );
  }
}
