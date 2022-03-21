

import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/provider/loadingprovider.dart';
import 'package:crm_smart/provider/manage_provider.dart';
import 'package:crm_smart/services/UserService.dart';
import 'package:crm_smart/ui/widgets/levelcombox.dart';
import 'package:crm_smart/ui/widgets/manage_widget.dart';
import 'package:crm_smart/ui/widgets/regoincombox.dart';
import 'package:crm_smart/ui/widgets/row_edit.dart';
import 'package:crm_smart/ui/widgets/text_form.dart';
import 'package:crm_smart/view_model/all_user_vm.dart';
import 'package:crm_smart/view_model/country_vm.dart';
import 'package:crm_smart/view_model/level_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../labeltext.dart';
import 'package:get/get.dart';

class EditUser extends StatefulWidget {
  // UserModel userModel;
  final int index;
  EditUser({
    required this.index,
    //required this.userModel,
    Key? key}) : super(key: key);

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
  void initState()  {

    // Provider.of<level_vm>(context,listen: false).getlevel();
    //
    // Provider.of<level_vm>(context,listen: false).listoflevel;
    // WidgetsBinding.instance?.addPostFrameCallback((_) {
    //
    // });


    print("init");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //WidgetsBinding.instance?.addPostFrameCallback((_) {
      Provider.of<level_vm>(context,listen: false).listoflevel;
      namemanage=controllerUsers.usersList[widget.index].typeAdministration.toString();
      Provider.of<manage_provider>(context,listen: false).changevalue(namemanage!);

      emailController.text= controllerUsers.usersList[widget.index].email.toString();
      mobileController.text= controllerUsers.usersList[widget.index].mobile.toString();
      level=controllerUsers.usersList[widget.index].typeLevel.toString();
      regoin=controllerUsers.usersList[widget.index].fkRegoin.toString();

      print("level inside build main screen"+level!);
      print("regoin "+regoin!);

      Provider.of<level_vm>(context,listen: false).changeVal(level);
      if(regoin!="null")
        Provider.of<regoin_vm>(context,listen: false).changeVal(regoin);
      else
        Provider.of<regoin_vm>(context,listen: false).changeVal(null);

    //});
    // Provider.of<level_vm>(context,listen: false).getlevel();


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
      body: ModalProgressHUD(

        inAsyncCall: Provider.of<LoadProvider>(context).isLoadingUpdateUser,
        child: SingleChildScrollView(
          child: Padding(
            padding:EdgeInsets.only(top: 10,right: 20,left: 20), // EdgeInsets.symmetric(horizontal: 50, vertical: 50),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RowEdit(name:'Email', des: ''),
                EditTextFormField(
                  hintText: 'Email',
                  obscureText: false,
                  controller: emailController,

                ),
                SizedBox(height: 5,),
                RowEdit(name: label_manage, des: ''),

                Consumer<manage_provider>(
                  builder: (context,mangelist,child) {

                    return DropdownButton(
                      isExpanded: true,
                      hint: Text("حددالإدارة"),
                      items: mangelist.listtext.map(
                              (level_one)
                          {
                            return DropdownMenuItem(

                              child: Text(level_one), //label of item
                              value: level_one, //value of item
                            );
                          }).toList(),
                      value:mangelist.selectedValuemanag,
                      onChanged:(value){
                        namemanage=value.toString();
                        mangelist.changevalue(value.toString());

                      },
                    );
                  } ),
                SizedBox(height: 5,),
                RowEdit(name: label_level, des: 'Required'),
                //mangwidget(),

                levelCombox(),
                SizedBox(height: 5,),

                //admin
                RowEdit(name:label_regoin, des: 'Required'),
                RegoinCombox(),
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
                          regoin= Provider.of<regoin_vm>(context,listen: false).selectedValueLevel;
                          level= Provider.of<level_vm>(context,listen: false).selectedValueLevel;

                        //String id_country=Provider.of<country_vm>(context,listen: false).id_country;
                       print("level in update button"+level.toString());
                       print("regoin in update button"+regoin.toString());
                        if( level!=null) {
                          Provider.of<LoadProvider>(context, listen: false)
                              .changeboolUpdateUser(true);
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
                             body:  body, idUser:controllerUsers.usersList[widget.index].idUser
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
        ),
      ),
    );
  }

  clear(body) {
    //label_Edituser
    Provider.of<LoadProvider>(context, listen: false)
        .changeboolUpdateUser(false);
    final index=controllerUsers.usersList.indexWhere(
            (element) => element.idUser==controllerUsers.usersList[widget.index].idUser);
    body.addAll(
        {
          'nameUser': controllerUsers.usersList[index].nameUser,
          'id_user': controllerUsers.usersList[index].idUser.toString(),
          'code_verfiy': controllerUsers.usersList[index].codeVerfiy.toString(),
          'fk_country': controllerUsers.usersList[index].fkCountry.toString(),
          //'code_verfiy': controllerUsers.usersList[index].codeVerfiy.toString(),
          'nameCountry': controllerUsers.usersList[index].nameCountry.toString(),
          'name_regoin': controllerUsers.usersList[index].nameRegoin.toString(),
          'name_level': controllerUsers.usersList[index].name_level.toString(),

    });
     print(body);
     print('///////////');
    controllerUsers.usersList[index] = UserModel.fromJson( body);
    print(controllerUsers.usersList[index].toJson() );
    // descriptionController.text = "";
    // mobileController.text = "";
    // emailController.text = "";
    _scaffoldKey.currentState!.showSnackBar(
        SnackBar(content: Text(label_Edituser) )
    );
  }

  error() {
    Provider.of<LoadProvider>(context, listen: false)
        .changeboolUpdateUser(false);
    _scaffoldKey.currentState!.showSnackBar(
        SnackBar(content: Text(label_errorAddProd)));
  }
}