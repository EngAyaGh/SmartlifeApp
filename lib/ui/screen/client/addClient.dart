

import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/provider/loadingprovider.dart';
import 'package:crm_smart/ui/widgets/container_boxShadows.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custom_button_new.dart';
import 'package:crm_smart/ui/widgets/custom_widget/customformtext.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/view_model/all_user_vm.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../labeltext.dart';

class addClient extends StatelessWidget {
  addClient({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _globalKey = GlobalKey<FormState>();

  final TextEditingController nameclientController = TextEditingController();

  final TextEditingController nameEnterpriseController = TextEditingController();

  final TextEditingController mobileController = TextEditingController();
  final TextEditingController typejobController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController regoinController = TextEditingController();
  //final controllerUsers = Get.find<AllUserVMController>();
late final UserModel _user;
  @override
  Widget build(BuildContext context) {
     //final controllerUsers = Get.find<AllUserVMController>();
    _user=Provider.of<user_vm_provider>(context,listen: true).currentUser!;
    // controllerUsers.getcurrentUser();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: kWhiteColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<LoadProvider>(context).isLoadingAddclient,
        child: SingleChildScrollView(
          child: Form(
            key: _globalKey,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: EdgeInsets.only(
                    top: 10,
                    right: 20,
                    left: 20,bottom: 10), // EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                child: ContainerShadows(
                  width: double.infinity,
                  //height: 400,
                  margin: EdgeInsets.only(),
                  child: Column(
                    //textDirection: TextDirection.rtl,

                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RowEdit(name: label_clientname, des: 'required'),
                      SizedBox(
                        height: 5,
                      ),
                      EditTextFormField(
                        vaild: (value) {
                          if (value!.isEmpty) {
                            return label_empty;
                          }
                        },
                        hintText: label_clientname,
                        obscureText: false,
                        controller: nameclientController,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      RowEdit(name: label_cliententerprise, des: 'required'),
                      SizedBox(
                        height: 5,
                      ),
                      EditTextFormField(
                        obscureText: false,
                        hintText: label_cliententerprise,
                        vaild: (value) {
                          if (value!.isEmpty) {
                            return label_empty;
                          }
                        },
                        controller: nameEnterpriseController, //اسم المؤسسة
                        //label: label_client,
                        onChanged: (val) {
                          // nameprod = val;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      RowEdit(name: label_client_typejob, des: 'Required'),
                      SizedBox(
                        height: 5,
                      ),
                      EditTextFormField(
                        hintText: label_client_typejob,
                        obscureText: false,
                        vaild: (value) {
                          if (value!.isEmpty) {
                            return label_empty;
                          }
                        },
                        controller: typejobController, //اسم المؤسسة
                        label: label_client_typejob,
                        onChanged: (val) {
                          // nameprod = val;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),

                      //admin
                      RowEdit(name: label_clientcity, des: 'Required'),
                      SizedBox(
                        height: 5,
                      ),
                      EditTextFormField(
                        vaild: (value) {
                          if (value!.isEmpty) {
                            return label_empty;
                          }
                        },
                        hintText: label_clientcity,
                        obscureText: false,
                        controller: cityController,
                      ),
                      //manage
                      SizedBox(
                        height: 15,
                      ),
                      RowEdit(name: label_clientmobile, des: 'Required'),
                      SizedBox(
                        height: 5,
                      ),
                      EditTextFormField(
                        vaild: (value) {
                          if (value!.isEmpty) {
                            return label_empty;
                          }
                        },
                        hintText: '+966000000000',
                        obscureText: false,
                        controller: mobileController,
                      ),
                      //RowEdit(name: 'Image', des: ''),
                      SizedBox(
                        height: 15,
                      ),
                      RowEdit(name: label_clientlocation, des: ''),
                      EditTextFormField(
                        hintText: 'location',
                        obscureText: false,
                        controller: locationController,
                      ),
                      ////////////////////////////////////////////////
                      SizedBox(
                        height: 15,
                      ),
                      // RowEdit(name: label_clientregoin, des: ''),
                      // //show chose image
                      // SizedBox(
                      //   height: 15,
                      // ),
                      // RowEdit(name: label_clientdate, des: ''),
                      //
                      // SizedBox(
                      //   height: 15,
                      // ),
                      // RowEdit(name: label_clientnameuser, des: controllerUsers.currentUser.value.nameUser.toString()),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      // RowEdit(name: label_clienttype, des: "تفاوض"),

                      Center(
                        child: custom_button_new(
                          text: label_clientadd,
                          onpress: () async {

                            if (_globalKey.currentState!.validate()) {
                              _globalKey.currentState!.save();
                              Provider.of<LoadProvider>(context, listen: false)
                                  .changebooladdclient(true);
                              Provider.of<client_vm>(context,listen: false)
                                  .addclient_vm( {
                                  'name_client': nameclientController.text,
                                  'name_enterprise': nameEnterpriseController.text,
                                  'type_job':typejobController.text,
                                  'city': cityController.text,
                                  'location':locationController.text==null?"null":locationController.text,
                                  "fk_regoin":_user.fkRegoin==null?"null":_user.fkRegoin,
                                  //"date_create": ,
                                  "type_client":"تفاوض",
                                  "fk_user":_user.idUser,
                                  // "date_transfer":,
                                  "mobile":mobileController.text,
                                  //"date_changetype":,
                                },_user.nameUser.toString(),
                                  _user.nameRegoin.toString()
                              ).then((value) => value!="false"
                                  ? clear(context)
                                  : error(context)
                                // Fluttertoast.showToast(
                                //  backgroundColor:
                                //      Colors.lightBlueAccent,
                                //  msg: label_errorAddProd, // message
                                //  toastLength:
                                //      Toast.LENGTH_SHORT, // length
                                //  gravity: ToastGravity.CENTER, //
                              );

                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  clear(BuildContext context) {

    Provider.of<LoadProvider>(context, listen: false)
        .changebooladdclient(false);
    nameEnterpriseController.text="";
    nameclientController.text="";
    locationController.text="";
    mobileController.text="";
    cityController.text="";
    typejobController.text="";
    _scaffoldKey.currentState!.showSnackBar(
        SnackBar(content: Text(label_Addeduser))
    );
    print("succ");
  }

  error(context) {
    Provider.of<LoadProvider>(context, listen: false)
        .changebooladdclient(false);
    _scaffoldKey.currentState!.showSnackBar(
        SnackBar(content: Text(label_errorAddProd))
    );
    print("error");
  }
}
