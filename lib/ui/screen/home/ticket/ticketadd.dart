

import 'package:crm_smart/ui/widgets/container_boxShadows.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custombutton.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/view_model/ticket_vm.dart';
import 'package:crm_smart/view_model/typeclient.dart';
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
  //final TextEditingController notes = TextEditingController();
  final _globalKey=GlobalKey<FormState>();
@override void dispose() {
    problem_desc.dispose();
    super.dispose();
  }
  @override void initState() {
    super.initState();
  }
  @override void didChangeDependencies() {
    // Future.delayed(Duration(milliseconds: 30)).then((_) async {
    //   Provider.of<typeclient>(context,listen: false).getreasons('ticket');
    //});
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key:_scaffoldKey,
        body:ModalProgressHUD(
          inAsyncCall:  Provider.of<ticket_vm>(context,listen: true).addvalue,
          child : SingleChildScrollView(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Form(
                key: _globalKey,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 150,
                      right: 20,
                      left: 20,bottom: 150),
                  child: ContainerShadows(
                    width: double.infinity,
                    //height: 400,
                    margin: EdgeInsets.only(),
                    padding:EdgeInsets.only(top: 50,left: 20,right: 20,bottom: 20) ,
                    child: Column(
                      children: [
                        SizedBox(height: 15,),
                        RowEdit(name: 'نوع المشكلة', des: 'REQUIRED'),

                        Consumer<typeclient>(
                          builder: (context, cart, child){
                            return SizedBox(
                              //width: 240,
                              child: DropdownButtonFormField(
                                decoration:InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: Colors.grey)
                                  )
                                ) ,

                                isExpanded: true,
                                //hint: Text("حدد حالة العميل"),
                                items: cart.type_of_out.map((level_one) {
                                  return DropdownMenuItem(
                                    child: Text(level_one.nameReason), //label of item
                                    value: level_one.nameReason, //value of item
                                  );
                                }).toList(),
                                value:cart.selectedValueOut,
                                onChanged:(value) {
                                  //  setState(() {
                                  cart.changevalueOut(value.toString());
                                  // });
                                },
                              ),
                            );},
                        ),
                        SizedBox(height: 15,),
                        // RowEdit(name: 'ملاحظات ', des: ''),
                        //
                        // EditTextFormField(
                        //   vaild: (value) {
                        //     if (value!.isEmpty) {
                        //       return 'الحقل فارغ';
                        //     }
                        //   },
                        //   hintText: '',
                        //   controller: notes,
                        //   maxline: 3,
                        // ),
                        //SizedBox(height: 15,),
                        RowEdit(name: 'وصف المشكلة', des: ''),
                        EditTextFormField(
                          vaild: (value) {
                            if (value!.isEmpty) {
                              return 'الحقل فارغ';
                            }
                          },
                          hintText: '',
                          controller: problem_desc,
                          maxline: 4,
                        ),
                        SizedBox(height: 15,),
                        CustomButton(
                          width:double.infinity,
                          //MediaQuery.of(context).size.width * 0.2,
                          text: 'حفظ',
                          onTap: () async {
                            if (_globalKey.currentState!.validate()) {
                              _globalKey.currentState!.save();

                              Provider.of<ticket_vm>(context, listen: false)
                                  .addticket({
                                'fk_client': widget.fk_client.toString(),
                                'type_problem': Provider
                                    .of<typeclient>(context, listen: false)
                                    .selectedValueOut.toString(),
                                'details_problem': problem_desc.text,
                                //'notes_ticket': notes.text,
                                'type_ticket': 'جديدة',
                                'fk_user_open': Provider
                                    .of<user_vm_provider>(
                                    context, listen: false)
                                    .currentUser!
                                    .idUser
                                    .toString(),
                                'date_open': DateTime.now().toString(),
                                'client_type': '0'
                              })
                                  .then(
                                      (value) =>
                                  //value!="error"
                                  clear(context)
                                // : error(context)
                              );
                              // }else {
                              //   _scaffoldKey.currentState!.showSnackBar(
                              //       SnackBar(content: Text('الحقل فارغ  '))
                              //   );
                              // }
                            } },
                          //child: Text(" حفظ"),
                        ),
                      ],
                    ),
                  ),

                ),
              ),
            ),
          ),
        ));
  }
  clear(BuildContext context) {

    _scaffoldKey.currentState!.showSnackBar(
        SnackBar(content: Text('تم إنشاء تذكرة جديد'))
    );
    // print("succ");
  }

  error(context) {

    _scaffoldKey.currentState!.showSnackBar(
        SnackBar(content: Text('هناك خطأ ما'))
    );
    print("error");
  }
}
