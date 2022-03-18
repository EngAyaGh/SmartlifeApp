import 'package:crm_smart/constants.dart';
import 'package:crm_smart/provider/loadingprovider.dart';
import 'package:crm_smart/provider/switch_provider.dart';
import 'package:crm_smart/services/UserService.dart';
import 'package:crm_smart/ui/widgets/levelcombox.dart';
import 'package:crm_smart/ui/widgets/regoincombox.dart';
import 'package:crm_smart/ui/widgets/row_edit.dart';
import 'package:crm_smart/ui/widgets/text_form.dart';
import 'package:crm_smart/view_model/country_vm.dart';
import 'package:crm_smart/view_model/level_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../labeltext.dart';

class addUser extends StatefulWidget {
  const addUser({Key? key}) : super(key: key);

  @override
  _addUserState createState() => _addUserState();
}

class _addUserState extends State<addUser> {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Map<String,String> _maptext={
   '0': 'مشرف مبيعات',
    '1':'موظف مبيعات',
    '2':'إدارة عناية بالعملاء',
    '3':'موظف دعم',
  '4':  'مدير دعم',
   '5': 'إدارة عليا',
   '6': 'الإدارة المالية',
    '7' :'ادارة التحصيل',
   '8': 'إدارة العمليات'};
  List<String> _listtext=[
   'مشرف مبيعات',
 'موظف مبيعات',
 'إدارة عناية بالعملاء',
   'موظف دعم',
  'مدير دعم',
   'إدارة عليا',
  'الإدارة المالية',
 'ادارة التحصيل',
  'إدارة العمليات'];
  String namemanage='موظف مبيعات';
  //var _list=_maptext.to;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: kWhiteColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding:EdgeInsets.only(top: 50,right: 20,left: 20), // EdgeInsets.symmetric(horizontal: 50, vertical: 50),
        child: Column(
          textDirection: TextDirection.rtl,

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RowEdit(name:'Email', des: ''),
            EditTextFormField(
              hintText: 'Email',
              obscureText: false,
              controller: emailController,
            ),
            SizedBox(height: 5,),
            RowEdit(name: label_manage, des: ''),
            DropdownButton(
              isExpanded: true,
              hint: Text("حددالإدارة"),
              items: _listtext.map(
                      (level_one)
              {
                return DropdownMenuItem(

                  child: Text(level_one), //label of item
                  value: level_one, //value of item
                );
              }).toList(),
              value:namemanage,
              onChanged:(value){
              setState(() {
                namemanage=value.toString();
              });
              },
            ),
            // EditTextFormField(
            //   hintText: label_manage,
            //   obscureText: false,
            //   controller: descriptionController,
            // ),
            SizedBox(height: 5,),
            RowEdit(name: label_level, des: 'Required'),
            levelCombox(
            //   selected:  Provider.of<level_vm>(context,listen: false).selectedValueLevel,
            //   onChanged:  (value) {
            //     Provider.of<level_vm>(context,listen: false).changeVal(value.toString());
            //
            // },
            ),
            SizedBox(height: 5,),

            //admin
            RowEdit(name:label_regoin, des: 'Required'),
            RegoinCombox(
            //   selected: _selectedregoin,
            //   onChanged:
            //     (value) {
            //   _selectedregoin=value.toString();
            //
            // },
            ),
            //manage
            SizedBox(height: 5,),
            RowEdit(name: label_mobile, des: 'Required'),
            EditTextFormField(
              hintText: '+966000000000',
              obscureText: false,
              controller: mobileController,
            ),
            //RowEdit(name: 'Image', des: ''),

            //show chose image

            Center(
              child: TextButton(
                  onPressed: () {
                    String? regoin= Provider.of<regoin_vm>(context,listen: false).selectedValueLevel;
                    String? level= Provider.of<level_vm>(context,listen: false).selectedValueLevel;
                    String id_country=Provider.of<country_vm>(context,listen: false).id_country;
                if( level!=null) {
                  UserService().addUser({
                    'email': emailController.text != null
                        ? emailController.text
                        : "",
                    'mobile': mobileController.text != null ? mobileController
                        .text : "",
                    'fkCountry': id_country,
                    'typeAdministration': descriptionController.text != null
                        ? descriptionController.text
                        : "",
                    'typeLevel': level,
                    'fkRegoin': regoin != null ? regoin : "null",

                  }).then((value) =>
                  value != "error" &&value !="email is not exist" ? clear() :
                  _scaffoldKey.currentState!.showSnackBar(
                      SnackBar(content: Text(label_errorAddProd))
                  ));
                }else
                  {
                    _scaffoldKey.currentState!.showSnackBar(
                        SnackBar(content: Text('حدد مستوى للصلاحية من فضلك'))
                    );
                  }
                  },
                  child: Text(
                    'إضافة الموظف ',
                    style: TextStyle(color: kMainColor),
                  )),
            )
          ],
        ),
      ),
    );
  }

  void clear(){

    Provider.of<LoadProvider>(context, listen: false)
        .changeboolValueisLoading(false);

    descriptionController.text = "";
    mobileController.text = "";
    emailController.text = "";
    Provider.of<switch_provider>(context, listen: false).changeboolValue(false);
    _scaffoldKey.currentState!.showSnackBar(
        SnackBar(content: Text(label_doneAddProduct))
    );
  }
}
