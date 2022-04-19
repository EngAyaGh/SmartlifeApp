import 'package:crm_smart/constants.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/provider/loadingprovider.dart';
import 'package:crm_smart/provider/manage_provider.dart';
import 'package:crm_smart/provider/switch_provider.dart';
import 'package:crm_smart/services/UserService.dart';
import 'package:crm_smart/ui/widgets/combox_widget/levelcombox.dart';
import 'package:crm_smart/ui/widgets/combox_widget/regoincombox.dart';
import 'package:crm_smart/ui/widgets/container_boxShadows.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custom_button_new.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/view_model/all_user_vm.dart';
import 'package:crm_smart/view_model/country_vm.dart';
import 'package:crm_smart/view_model/level_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import '../../../labeltext.dart';

class addUser extends StatefulWidget {
  const addUser({Key? key}) : super(key: key);

  @override
  _addUserState createState() => _addUserState();
}

class _addUserState extends State<addUser> {
  //final controllerUsers = Get.find<AllUserVMController>();

  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  late final  controllerUsers;

  String? namemanage='موظف مبيعات';
  //var _list=_maptext.to;
  @override void didChangeDependencies() {
    // Future.delayed(Duration(milliseconds: 30)).then((_) async {
    //   Provider.of<regoin_vm>(context,listen: false).getregoin();
    // }
    // );

    super.didChangeDependencies();
  }
  @override void initState() {

    Provider.of<regoin_vm>(context,listen: false).getregoin();
    Provider.of<level_vm>(context,listen: false).getlevel();


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   // Provider.of<regoin_vm>(context,listen: true).getregoin();

   // controllerUsers=Provider.of<user_vm_provider>(context,listen: true).userall;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: kWhiteColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body:ModalProgressHUD(
        inAsyncCall: Provider.of<LoadProvider>(context).isLoadingAddUser,
        child: Padding(
          padding:EdgeInsets.only(top: 15,right: 20,left: 20,bottom: 15), // EdgeInsets.symmetric(horizontal: 50, vertical: 50),
          child: ContainerShadows(
            width: double.infinity,
            padding:
            EdgeInsets.only(
                top: 35,right: 10,left: 10), // EdgeInsets.symmetric(horizontal: 50, vertical: 50),

          margin: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 30,bottom: 10
            ),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                //textDirection: TextDirection.rtl,

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RowEdit(name:'Email', des: ''),
                  EditTextFormField(
                    hintText: 'Email',
                    obscureText: false,
                    controller: emailController,
                  ),
                  SizedBox(height: 15,),
                  RowEdit(name: label_manage, des: ''),
                  Consumer<manage_provider>(builder: (context, mangelist, child) {
                    return DropdownButton(
                      isExpanded: true,
                      hint: Text("حددالإدارة"),
                      items: mangelist.listtext.map((level_one) {
                        return DropdownMenuItem(
                          child: Text(level_one), //label of item
                          value: level_one, //value of item
                        );
                      }).toList(),
                      value: mangelist.selectedValuemanag,
                      onChanged: (value) {
                        namemanage = value.toString();
                        mangelist.changevalue(value.toString());
                      },
                    );
                  }),
                  // DropdownButton(
                  //   isExpanded: true,
                  //   hint: Text("حددالإدارة"),
                  //   items: listtext.map(
                  //           (level_one) {
                  //     return DropdownMenuItem(
                  //
                  //       child: Text(level_one), //label of item
                  //       value: level_one, //value of item
                  //     );
                  //   }).toList(),
                  //   value:namemanage,
                  //   onChanged:(value){
                  //   setState(() {
                  //     namemanage=value.toString();
                  //   });
                  //   },
                  // ),
                  // EditTextFormField(
                  //   hintText: label_manage,
                  //   obscureText: false,
                  //   controller: descriptionController,
                  // ),
                  SizedBox(height: 15,),
                  RowEdit(name: label_level, des: 'Required'),
                  //levelCombox(
                  //   selected:  Provider.of<level_vm>(context,listen: false).selectedValueLevel,
                  //   onChanged:  (value) {
                  //     Provider.of<level_vm>(context,listen: false).changeVal(value.toString());
                  //
                  // },
                  //),
                  Consumer<level_vm>(
                    builder: (context, cart, child){
                      return DropdownButton(
                        isExpanded: true,
                        //hint: Text("حدد حالة العميل"),
                        items: cart.listoflevel.map((level_one) {
                          return DropdownMenuItem(
                            child: Text(level_one.nameLevel), //label of item
                            value: level_one.idLevel, //value of item
                          );
                        }).toList(),
                        value:cart.selectedValueLevel,
                        onChanged:(value) {
                          //  setState(() {
                          cart.changeVal(value.toString());
                          // });
                        },
                      );},
                  ),
                  SizedBox(height: 15,),

                  //admin
                  RowEdit(name:label_regoin, des: 'Required'),
                  //RegoinCombox(
                  //   selected: _selectedregoin,
                  //   onChanged:
                  //     (value) {
                  //   _selectedregoin=value.toString();
                  //
                  // },
                  //),
                  Consumer<regoin_vm>(
                    builder: (context, cart, child){
                      return DropdownButton(
                        isExpanded: true,
                        //hint: Text("حدد حالة العميل"),
                        items: cart.listregoin.map((level_one) {
                          return DropdownMenuItem(
                            child: Text(level_one.name_regoin), //label of item
                            value: level_one.id_regoin, //value of item
                          );
                        }).toList(),
                        value:cart.selectedValueLevel,
                        onChanged:(value) {
                          //  setState(() {
                          cart.changeVal(value.toString());
                          // });
                        },
                      );},
                  ),
                  //manage
                  SizedBox(height: 15,),
                  RowEdit(name: label_mobile, des: 'Required'),
                  EditTextFormField(
                    hintText: '+966000000000',
                    obscureText: false,
                    controller: mobileController,
                  ),
                  //RowEdit(name: 'Image', des: ''),
                  SizedBox(height: 35,),

                  //show chose image

                  Center(
                    child: custom_button_new(
                     // style: ButtonStyle(backgroundColor:Color(Colors.lightBlue)),
                        onpress: () {
                          String? regoin= Provider.of<regoin_vm>(context,listen: false)
                              .selectedValueLevel;
                          String? level= Provider.of<level_vm>(context,listen: false)
                              .selectedValueLevel;
                          String? id_country=
                              Provider.of<user_vm_provider>(context,listen: false)
                                  .currentUser!.fkCountry;
                      if( level!=null && emailController.text.isNotEmpty) {
                        Provider.of<LoadProvider>(context, listen: false)
                            .changeboolValueUser(true);
                        dynamic body={  'email': emailController.text != null
                            ? emailController.text
                            : "",
                          'mobile': mobileController.text != null ? mobileController
                              .text : "",
                          'fk_country': id_country,
                          'type_administration': namemanage != null
                              ? namemanage
                              : "",
                          'type_level': level,
                          'fk_regoin': regoin != null ? regoin : "null",
                        };
                       Provider.of<user_vm_provider>(context,listen: false)
                        .adduser_vm(body)
                           .then((value) =>
                        value != "error"
                            ? clear(body)
                            :error()
                        );
                      }else
                        {
                          _scaffoldKey.currentState!.showSnackBar(
                              SnackBar(content: Text('حدد كافة الخيارات من فضلك'))
                          );
                        }
                        },
                        text:
                        //Text(
                          'إضافة الموظف ',
                         // style: TextStyle(color: kMainColor),
                        //)
                      ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
void error(){
  Provider.of<LoadProvider>(context, listen: false)
      .changeboolValueUser(false);
  _scaffoldKey.currentState!.showSnackBar(
      SnackBar(content: Text(label_errorAddProd)));
}
  void clear(body){

    Provider.of<LoadProvider>(context, listen: false)
        .changeboolValueUser(false);
    // controllerUsers.add(
    //     UserModel.fromJson( body)
    // );
    descriptionController.text = "";
    mobileController.text = "";
    emailController.text = "";
    _scaffoldKey.currentState!.showSnackBar(
        SnackBar(content: Text(label_Addeduser))
    );
  }
}
