

import 'package:crm_smart/ui/widgets/container_boxShadows.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custombutton.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/view_model/ticket_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
class ticketAdd extends StatefulWidget {
  ticketAdd({ required this.fk_client, Key? key}) : super(key: key);
  String fk_client;
  @override
  _ticketAddState createState() => _ticketAddState();
}

class _ticketAddState extends State<ticketAdd> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final TextEditingController problem_desc = TextEditingController();
  final TextEditingController notes = TextEditingController();
  @override void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key:_scaffoldKey,
        body:ModalProgressHUD(
          inAsyncCall: Provider.of<LoadProvider>(context).isLoadingAddclient,
          child : Form(
            //key: _globalKey,
            child: Padding(
              padding: EdgeInsets.only(
                  top: 150,
                  right: 20,
                  left: 20,bottom: 150),
              child: ContainerShadows(
                width: double.infinity,
                //height: 400,
                margin: EdgeInsets.only(),
                padding:EdgeInsets.only(top: 50,left: 20,right: 20) ,
                child: Column(
                  children: [
                    RowEdit(name: 'نوع المشكلة', des: 'REQUIRED'),

                    SizedBox(height: 15,),
                    RowEdit(name: 'وصف المشكلة', des: ''),
                    SizedBox(height: 15,),

                    EditTextFormField(
                      vaild: (value) {
                        if (value!.isEmpty) {
                          return 'الحقل فارغ';
                        }
                      },
                      hintText: '',
                      controller: notes,
                    ),
                    SizedBox(height: 15,),
                    RowEdit(name: 'ملاحظات ', des: ''),


                    EditTextFormField(
                      vaild: (value) {
                        if (value!.isEmpty) {
                          return 'الحقل فارغ';
                        }
                      },
                      hintText: '',
                      controller: problem_desc,
                    ),
                    SizedBox(height: 15,),
                    CustomButton(
                      width:double.infinity,
                      //MediaQuery.of(context).size.width * 0.2,
                      text: 'حفظ',
                      onTap: () async {
                        // if (_globalKey.currentState!.validate()) {
                        //   _globalKey.currentState!.save();
                          Provider.of<LoadProvider>(context, listen: false)
                              .changebooladdclient(true);
                          Provider.of<ticket_vm>(context,listen: false).addticket({
                            'fk_client':widget.fk_client,
                            'type_problem':,
                            'details_problem':problem_desc.text,
                            'notes_ticket':notes.text,
                            'type_ticket':'جديدة',
                            'fk_user_open':Provider.of<user_vm_provider>(context,listen: false)
                            .currentUser!.idUser.toString(),
                            'date_open':DateTime.now().toString(),
                            'client_type':'0'
                          }).then(
                                  (value) =>  value!="error"
                                  ? clear(context)
                                  : error(context)
                          );
                        // }else {
                        //   _scaffoldKey.currentState!.showSnackBar(
                        //       SnackBar(content: Text('الحقل فارغ  '))
                        //   );
                        // }
                      },
                      //child: Text(" حفظ"),
                    ),
                  ],
                ),
              ),

            ),
          ),
        ));
  }
  clear(BuildContext context) {

    Provider.of<LoadProvider>(context, listen: false)
        .changebooladdclient(false);
    namelevel.text="";
    _scaffoldKey.currentState!.showSnackBar(
        SnackBar(content: Text('تم إنشاء مستوى جديد'))
    );
    // print("succ");
  }

  error(context) {
    Provider.of<LoadProvider>(context, listen: false)
        .changebooladdclient(false);
    _scaffoldKey.currentState!.showSnackBar(
        SnackBar(content: Text('هناك خطأ ما'))
    );
    print("error");
  }
}
