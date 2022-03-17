

import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/ui/widgets/row_edit.dart';
import 'package:crm_smart/ui/widgets/text_form.dart';
import 'package:flutter/material.dart';

class EditUser extends StatelessWidget {
  final UserModel userModel;
  EditUser({required this.userModel, Key? key}) : super(key: key);
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          ),
        ],
        title: const Text('Edit User'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RowEdit(name: 'Description', des: ''),
            EditTextFormField(
              hintText: 'Description',
              obscureText: false,
              controller: descriptionController,
            ),
            RowEdit(name: 'Level', des: 'Required'),
            //admin
            RowEdit(name: 'Region', des: 'Required'),
            //manage
            RowEdit(name: 'Mobile number', des: 'Required'),
            EditTextFormField(
              hintText: '+966000000000',
              obscureText: false,
              controller: mobileController,
            ),
            RowEdit(name: 'Image', des: ''),

            //show chose image

            TextButton(
                onPressed: () {},
                child: Text(
                  'Delete User',
                  style: TextStyle(color: Colors.amberAccent),
                ))
          ],
        ),
      ),
    );
  }
}