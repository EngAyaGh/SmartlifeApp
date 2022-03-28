import 'package:crm_smart/provider/loadingprovider.dart';
import 'package:crm_smart/ui/widgets/customformtext.dart';
import 'package:crm_smart/ui/widgets/row_edit.dart';
import 'package:crm_smart/ui/widgets/text_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../constants.dart';
import '../../../labeltext.dart';

class addClient extends StatelessWidget {
  addClient({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _globalKey = GlobalKey<FormState>();

  final TextEditingController nameclientController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController mobileController = TextEditingController();
  final TextEditingController typejobController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController regoinController = TextEditingController();

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
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<LoadProvider>(context).isLoadingAddclient,
        child: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
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

                      RowEdit(name: label_cliententerprise, des: 'مطلوب'),
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
                        controller: nameController, //اسم المؤسسة
                        //label: label_client,
                        onChanged: (val) {
                          // nameprod = val;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),

                      RowEdit(name: label_client_typejob, des: 'مطلوب'),
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
                      RowEdit(name: label_clientcity, des: 'مطلوب'),
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

                      RowEdit(name: label_clientmobile, des: 'مطلوب'),
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
                      SizedBox(
                        height: 5,
                      ),
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
                      SizedBox(
                        height: 5,
                      ),
                      EditTextFormField(
                        obscureText: false,
                        hintText: label_clientregoin,
                        label: label_clientregoin,
                        controller: regoinController,
                      ),
                      //show chose image
                      SizedBox(
                        height: 15,
                      ),
                      RowEdit(name: label_clientdate, des: ''),

                      SizedBox(
                        height: 15,
                      ),
                      RowEdit(name: label_clientnameuser, des: ''),
                      SizedBox(
                        height: 15,
                      ),
                      RowEdit(name: label_clienttype, des: ''),
                      SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: TextButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(kMainColor)),
                          child: Text(
                            label_clientadd,
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            if (_globalKey.currentState!.validate()) {
                              _globalKey.currentState!.save();
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
}
