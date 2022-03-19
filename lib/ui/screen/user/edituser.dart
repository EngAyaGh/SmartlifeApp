

import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/provider/loadingprovider.dart';
import 'package:crm_smart/services/UserService.dart';
import 'package:crm_smart/ui/widgets/levelcombox.dart';
import 'package:crm_smart/ui/widgets/regoincombox.dart';
import 'package:crm_smart/ui/widgets/row_edit.dart';
import 'package:crm_smart/ui/widgets/text_form.dart';
import 'package:crm_smart/view_model/all_user_vm.dart';
import 'package:crm_smart/view_model/country_vm.dart';
import 'package:crm_smart/view_model/level_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../labeltext.dart';
import 'package:get/get.dart';

class EditUser extends StatefulWidget {
   UserModel userModel;
  EditUser({required this.userModel, Key? key}) : super(key: key);

  @override
  _EditUserState createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  final controllerUsers = Get.find<AllUserVMController>();

  final TextEditingController descriptionController = TextEditingController();

  final TextEditingController mobileController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String? namemanage,level,regoin="";

  @override
  Widget build(BuildContext context) {
    namemanage=widget.userModel.typeAdministration.toString();
    emailController.text=widget.userModel.email.toString();
    mobileController.text=widget.userModel.mobile.toString();
    level=widget.userModel.typeLevel.toString();
    regoin=widget.userModel.fkRegoin.toString();
    print(level);
    print(regoin);
    Provider.of<level_vm>(context,listen: false).changeVal(level.toString());
if(regoin!=null)
    Provider.of<regoin_vm>(context,listen: false).changeVal(regoin);
else
    Provider.of<regoin_vm>(context,listen: false).changeVal(null);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {

            },
            icon: const Icon(Icons.edit),
          ),
        ],
        title: const Text('Edit User'),
      ),
      body: Padding(
        padding:EdgeInsets.only(top: 10,right: 20,left: 20), // EdgeInsets.symmetric(horizontal: 50, vertical: 50),
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
              items: listtext.map(
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

            ),
            SizedBox(height: 5,),

            //admin
            RowEdit(name:label_regoin, des: 'Required'),
            RegoinCombox(

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
            SizedBox(height: 15,),

            //show chose image

            Center(
              child: TextButton(
                // style: ButtonStyle(backgroundColor:Color(Colors.lightBlue)),
                  onPressed: () {
                    String? regoin= Provider.of<regoin_vm>(context,listen: false).selectedValueLevel;
                    String? level= Provider.of<level_vm>(context,listen: false).selectedValueLevel;
                    //String id_country=Provider.of<country_vm>(context,listen: false).id_country;
                    if( level!=null) {
                      Provider.of<LoadProvider>(context, listen: false)
                          .changeboolValueUser(true);
                      dynamic body={
                        'email': emailController.text != null
                          ? emailController.text
                          : "",
                        'mobile': mobileController.text != null ? mobileController
                            .text : "",
                        //'fk_country': id_country,
                        'type_administration': namemanage != null
                            ? namemanage
                            : "",
                        'type_level': level,
                        'fk_regoin': regoin != null ? regoin : "null",
                      };
                      UserService().UpdateUser(
                         body:  body, idUser:widget.userModel.idUser
                      ).then((value) =>
                      value != "error" || value !="email is not exist"
                          ? clear(body)
                          :error()

                      );
                    }else
                    {


                      _scaffoldKey.currentState!.showSnackBar(
                          SnackBar(content: Text('حدد مستوى للصلاحية من فضلك'))
                      );
                    }
                  },
                  child: Text(
                    'تعديل ',
                    style: TextStyle(color: kMainColor),
                  )),
            )
          ],
        ),
      ),
    );
  }

  clear(body) {
    //label_Edituser
    Provider.of<LoadProvider>(context, listen: false)
        .changeboolValueUser(false);
    final index=controllerUsers.usersList.indexWhere((element) => element.idUser==widget.userModel.idUser);
    controllerUsers.usersList[index]
       = UserModel.fromJson( body);
    descriptionController.text = "";
    mobileController.text = "";
    emailController.text = "";
    _scaffoldKey.currentState!.showSnackBar(
        SnackBar(content: Text(label_Edituser))
    );
  }

  error() {
    Provider.of<LoadProvider>(context, listen: false)
        .changeboolValueUser(false);
    _scaffoldKey.currentState!.showSnackBar(
        SnackBar(content: Text(label_errorAddProd)));
  }
}