import 'package:crm_smart/provider/loadingprovider.dart';
import 'package:crm_smart/ui/widgets/customformtext.dart';
import 'package:crm_smart/ui/widgets/row_edit.dart';
import 'package:crm_smart/ui/widgets/text_form.dart';
import 'package:crm_smart/view_model/all_user_vm.dart';
import 'package:crm_smart/view_model/client_vm.dart';
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
  final controllerUsers = Get.find<AllUserVMController>();

  @override
  Widget build(BuildContext context) {
    // final controllerUsers = Get.find<AllUserVMController>();

     //controllerUsers.getcurrentUser();

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
            child: Padding(
              padding: EdgeInsets.only(
                  top: 10,
                  right: 20,
                  left:
                      20), // EdgeInsets.symmetric(horizontal: 50, vertical: 50),
              child: Column(
                //textDirection: TextDirection.rtl,

                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RowEdit(name: label_clientname, des: 'required'),
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
                    height: 5,
                  ),
                  RowEdit(name: label_cliententerprise, des: 'required'),
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
                    height: 5,
                  ),
                  RowEdit(name: label_client_typejob, des: 'Required'),
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
                    height: 5,
                  ),

                  //admin
                  RowEdit(name: label_clientcity, des: 'Required'),
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
                    height: 5,
                  ),
                  RowEdit(name: label_clientmobile, des: 'Required'),
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
                  RowEdit(name: label_clientregoin, des: ''),
                  //show chose image
                  SizedBox(
                    height: 15,
                  ),
                  RowEdit(name: label_clientdate, des: ''),

                  SizedBox(
                    height: 15,
                  ),
                  RowEdit(name: label_clientnameuser, des: controllerUsers.currentUser.value.nameUser.toString()),
                  SizedBox(
                    height: 15,
                  ),
                  RowEdit(name: label_clienttype, des: "تفاوض"),

                  Center(
                    child: TextButton(
                      child: Text(label_clientadd),
                      onPressed: () async {

                        if (_globalKey.currentState!.validate()) {
                          _globalKey.currentState!.save();

                          Provider.of<client_vm>(context,listen: false)
                              .addclient_vm( {
                              'name_client': nameclientController.text,
                              'name_enterprise': nameEnterpriseController.text,
                              'type_job':typejobController.text,
                              'city': cityController.text,
                              'location':locationController.text==null?"null":locationController.text,
                              "fk_regoin":controllerUsers.currentUser.value.fkRegoin==null?"null":controllerUsers.currentUser.value.fkRegoin,
                              //"date_create": ,
                              "type_client":"تفاوض",
                              "fk_user":controllerUsers.currentUser.value.idUser,
                              // "date_transfer":,
                              "mobile":mobileController.text,
                              //"date_changetype":,
                            },controllerUsers.currentUser.value.nameUser.toString(),
                              controllerUsers.currentUser.value.nameRegoin.toString()
                          ).then((value) => value!="false"
                              ? clear(context)
                              : error()
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
    );
  }

  clear(BuildContext context) {

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

  error() {
    _scaffoldKey.currentState!.showSnackBar(
        SnackBar(content: Text(label_errorAddProd))
    );
    print("error");
  }
}
