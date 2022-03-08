import 'package:crm_smart/provider/switch_provider.dart';
import 'package:crm_smart/ui/widgets/customformtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../labeltext.dart';

class addProduct extends StatelessWidget {
  const addProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(45),
          child: Column(
            children: [
             CustomFormField(
               label: label_name_product,

             ),
              SizedBox(height: 20,),
              CustomFormField(
                label: label_name_price,
              ),
              SizedBox(height: 20,),
              CustomFormField(
                label: label_name_package,
              ),
              SizedBox(height: 20,),
          Center(
            child: Consumer<switch_provider>(
              builder: (context, isSwitched, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(label_turnVat),
                  Switch(
                      activeTrackColor: Colors.lightBlueAccent.withAlpha(90),
                      activeColor: Colors.lightBlue,
                    value: isSwitched.isSwitched,
                    onChanged: (value) {
                     isSwitched.changeboolValue();
                      }),

                ],

              );
                },

              ),
            ),
            ],
          ),
        ),
      ),


    );
  }
}
