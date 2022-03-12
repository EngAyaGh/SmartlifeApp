import 'dart:convert';

import 'package:crm_smart/model/productmodel.dart';
import 'package:crm_smart/provider/selected_button_provider.dart';
import 'package:crm_smart/provider/switch_provider.dart';
import 'package:crm_smart/services/ProductService.dart';
import 'package:crm_smart/ui/widgets/custombutton.dart';
import 'package:crm_smart/ui/widgets/customformtext.dart';
import 'package:crm_smart/ui/widgets/group_button.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../labeltext.dart';

class addProduct extends StatelessWidget {
   addProduct({Key? key}) : super(key: key);
  bool valtaxrate=false;
  int valtype_product=0;
  String nameprod="";
  double price=0;
   ProductModel? pd;
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
               onChanged: (val){
                 nameprod=val;

               },
             ),
              SizedBox(height: 20,),
              CustomFormField(
              /*  vaild: (value) { if (value!.isEmpty) {
        return 'Please enter a  price ';
        }
            if (double.tryParse(value) == null) {
    return 'Please Enter a Valid Number';
    }
        if (double.parse(value) <= 0) {
    return 'Please Enter the number greather no than zero';
    }},*/
              inputType:TextInputType.number,
               label:  label_name_price,
               onChanged: (val){
                price=double.parse(val.toString());

                },


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
                      valtaxrate=value;

                     isSwitched.changeboolValue();
                      }),
                ],
              );
                },

              ),
            ),

              SizedBox(height: 20,),
              Consumer<selected_button_provider>(
                  builder: (context, selectedProvider, child) {
                    return Center(
                      child: ButtonGroup(
                          titles: [ "برامج","أجهزة"],//[0,1]
                          current: selectedProvider.isSelected,
                          onTab: (selected) {
                          valtype_product= selected;

                            selectedProvider.selectValue(selected);
                          }),
                    );
                  }
              ),

              SizedBox(height: 20,),
              CustomButton(text:label_button_addProduct,
              onTap: () async{
               var response = await Dio().post(
                  url+"products/addProduct.php",
                  data: {
                    'nameProduct': nameprod,
                    'priceProduct': price.toString(),
                    'type': valtype_product.toString(),
                    'fk_country': "1",
                    'fk_config':"",//valtaxrate?1:null
                  });
                // dynamic  body= {
                //   'nameProduct': nameprod,
                //   'priceProduct': price.toString(),
                //   'type': valtype_product.toString(),
                //   'fk_country': 1.toString(),
                // };
                // //'fk_config':valtaxrate?1:null;
                // if(valtaxrate)body.addAll({'fk_config': valtaxrate});
                //
                // await ProductService().addProduct(
                //        body
                //   );
              },)
            ],
          ),
        ),
      ),


    );
  }
}
