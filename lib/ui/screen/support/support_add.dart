
import 'package:crm_smart/constants.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/ticketmodel.dart';
import 'package:crm_smart/ui/screen/home/ticket/ticketadd.dart';
import 'package:crm_smart/ui/screen/home/ticket/ticketview.dart';
import 'package:crm_smart/ui/screen/support/support_view.dart';
import 'package:crm_smart/ui/widgets/container_boxShadows.dart';
import 'package:crm_smart/ui/widgets/custom_widget/RowWidget.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/ui/widgets/widgetcalendar/utils.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/ticket_vm.dart';
import 'package:crm_smart/view_model/typeclient.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class support_add extends StatefulWidget {
   support_add({ required this.idinvoice, Key? key}) : super(key: key);
   String? idinvoice;

  @override
  _support_addState createState() => _support_addState();
}

class _support_addState extends State<support_add> {
  TextEditingController _textsupport=TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _globalKey=GlobalKey<FormState>();
   late InvoiceModel? _invoice=null;
  String? fk_client;
  bool valueresoan=false;
  @override void dispose() {
    _textsupport.dispose();
    super.dispose();
  }
  @override
  void initState()  {
      // if (widget.idinvoice != '') {
      //   // _invoice = Provider
      //   //     .of<invoice_vm>(context, listen: false)
      //   //     .listinvoices
      //   //     .firstWhere(
      //   //         (element) =>
      //   //     element.idInvoice == widget.idinvoice);
      //   // _textsupport.text = _invoice!.reason_date.toString();
      //   WidgetsBinding.instance!.addPostFrameCallback((_)async {
      //
      //   //_ticketModel=_list.firstWhere((element) => element.fkClient)
      //
      //     Provider.of<typeclient>(context,listen: false).getreasons('ticket');
      //   });
      //
      // }
    print('init support');
    super.initState();
  }
@override void didChangeDependencies() {

  // Future.delayed(Duration(milliseconds: 30)).then((_) async {
  //   _invoice = Provider
  //       .of<invoice_vm>(context, listen: false)
  //       .listinvoices
  //       .firstWhere(
  //           (element) =>
  //       element.idInvoice == widget.idinvoice);
  // });

  super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {

    // if (widget.idinvoice != '') {
    //
    _invoice = Provider
        .of<invoice_vm>(context, listen: true)
        .listinvoices
        .firstWhere(
            (element) =>
        element.idInvoice == widget.idinvoice);
    // int index=Provider.of<invoice_vm>(context,listen: true)
    //     .listinvoices.indexWhere((element) => element.idInvoice==widget.idinvoice);
    // if(index!=-1){ _invoice=Provider.of<invoice_vm>(context,listen: true)
    //     .listinvoices[index];
    //   fk_client= _invoice!.fkIdClient;}
    // // Provider.of<ticket_vm>(context, listen: true)
    // //     .getclient_ticket( fk_client.toString());
    // }
    print('builld');
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ContainerShadows(
                margin: EdgeInsets.all(12),
                child:
                _invoice!=null?
                Column(
                  children: [
                    _invoice!.dateinstall_done!=null?
                    RowEdit(name: 'تم التركيب ', des: '')
                    :RowEdit(name: 'موعد التركيب للعميل من ', des: ''),
                    SizedBox(height: 10,),
                    _invoice!.dateinstall_done!=null?//تم التركيب
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.date_range,
                          color: kMainColor,
                        ),
                        hintStyle: const TextStyle(
                            color: Colors.black45,
                            fontSize: 16, fontWeight: FontWeight.w500),
                        hintText:
                        _invoice!.dateinstall_done.toString(),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                      ),
                      readOnly: true,
                      onTap: (){},
                    ):
                    Row(
                      children: [
                      //  SizedBox(width: 3,),
                        Flexible(
                          child:
                          TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.date_range,
                                color: kMainColor,
                              ),
                              hintStyle: const TextStyle(
                                  color: Colors.black45,
                                  fontSize: 16, fontWeight: FontWeight.w500),
                              hintText:
                              _invoice!.dateinstall_task==null || _currentDate!=DateTime(1,1,1)
                                ?_currentDate.toString()
                                :_invoice!.dateinstall_task.toString(),
                              filled: true,
                              fillColor: Colors.grey.shade200,
                            ),
                            readOnly: true,
                            onTap: (){
                              _selectDate(context,DateTime.now());
                            },
                          ),
                        ),
                        // IconButton(onPressed: (){
                        //   //_selectDate(context,_currentDate);
                        // }, icon: Icon(Icons.edit,color: kMainColor,)),
                        _invoice!.dateinstall_task==null?
                        IconButton(onPressed: () {
                          Provider.of<invoice_vm>(context,listen: false)
                              .setdate_vm({
                            'dateinstall_task':_currentDate.toString(),//_invoice.dateinstall_task.toString()
                          }, _invoice!.idInvoice).then((value) => clear());
                          _invoice!.dateinstall_task=_currentDate.toString();
                        }, icon:Icon( Icons.check,color: kMainColor))
                        :Container(),
                        SizedBox(height: 6,),
                        _invoice!.dateinstall_task!=null?
                        IconButton(onPressed: (){
                          if(_globalKey.currentState!.validate()) {
                            _globalKey.currentState!.save();
                            Provider.of<invoice_vm>(context, listen: false)
                                .setdate_vm({
                              'dateinstall_task': _currentDate.toString(),
                              'reason_date': _textsupport.text.toString()
                            }, _invoice!.idInvoice).then((value) =>
                                clear());
                          }},
                            icon:Icon( Icons.check,color: kMainColor))
                        // Row(
                        //   children: [
                        //     SizedBox(width: 6,),
                        //     Text('إعادة الجدولة'),
                        //     IconButton(onPressed: (){
                        //       if(_globalKey.currentState!.validate()) {
                        //         _globalKey.currentState!.save();
                        //         Provider.of<invoice_vm>(context, listen: false)
                        //             .setdate_vm({
                        //           'dateinstall_task': _currentDate.toString(),
                        //           'reason_date': _textsupport.text.toString()
                        //         }, _invoice!.idInvoice).then((value) =>
                        //             clear());
                        //       }},
                        //         icon:Icon( Icons.check,color: kMainColor)),
                        //
                        //   ],
                        // )
                        :Container(),
                      ],
                    ),
                    _invoice!.dateinstall_task!=null&&_invoice!.dateinstall_done==null ?
                    ElevatedButton(
    style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(
    kMainColor)),
    onPressed: () async{
      setState(() {
        valueresoan=true;
      });

    }, child:  Text('إعادة الجدولة'),):Container(),
                     valueresoan==true?   Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child:Form(
                        key:_globalKey ,
                        child: EditTextFormField(
                          maxline: 4,
                          hintText: 'أسباب إعادة الجدولة',
                          obscureText: false,
                          controller: _textsupport,
                          vaild: (value) {
                            if (value!.isEmpty) {
                              return 'الحقل فارغ';
                            }
                          },
                        ),
                      ),
                    ):Container(),
                    SizedBox(height: 20,),

                    // cardRow(title: 'اسم المؤسسة',value: _invoice!.name_enterprise.toString()),
                    // cardRow(title: 'معتمد الاشتراك ',value:_invoice!.nameuserApprove==null?'':
                    // _invoice!.nameuserApprove.toString()),
                    _invoice!.dateinstall_done==null?
                    _invoice!.dateinstall_task==null?Container():
                    cardRow(title: ' تاريخ جدولة التركيب ',value: _invoice!.dateinstall_done.toString())
                    :Container(),
                    cardRow(title: 'طريقة التركيب ',
                        value: _invoice!.typeInstallation.toString()=='0'?'ميداني':'اونلاين'),
                    cardRow(title: 'هل تم التركيب للعميل ',
                        value: _invoice!.dateinstall_done==null? 'بالانتظار' : 'تم التركيب'),
                    _invoice!.dateinstall_done==null? Container():
                    cardRow(title: ' تاريخ التركيب ',value: _invoice!.dateinstall_done.toString()),

                    _invoice!.dateinstall_done==null? Container()
                    :cardRow(title: ' تم التركيب من قبل ',value: _invoice!.nameuserinstall.toString()),
                    _invoice!.dateinstall_done==null? Container():


                    SizedBox(height: 15,),
                    _invoice!.dateinstall_done==null?
                    ElevatedButton(
                     style: ButtonStyle(
                     backgroundColor: MaterialStateProperty.all(
                         kMainColor)),
                     onPressed: () async{
                      bool result = await showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('التأكيد'),
                            content: Text('هل تريد تأكيد عملية التركيب'),
                            actions: <Widget>[
                              new ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        kMainColor)),
                                onPressed: () {
                                  Navigator.of(context,
                                      rootNavigator: true)
                                      .pop(
                                      false); // dismisses only the dialog and returns false
                                },
                                child: Text('لا'),
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        kMainColor)),
                                onPressed: () async {
                                  Navigator.of(context,
                                      rootNavigator: true)
                                      .pop(true);
                                  Provider.of<invoice_vm>(context,listen: false)
                                      .setdatedone_vm({
                                    'dateinstall_done':DateTime.now().toString(),
                                    'userinstall': Provider.of<user_vm_provider>
                                      (context,listen: false).currentUser!.idUser.toString(),
                                    'isdoneinstall':'1',
                                    'fkIdClient':_invoice!.fkIdClient,
                                    'nameuserinstall':Provider.of<user_vm_provider>
                                      (context,listen: false).currentUser!.nameUser.toString(),
                                     'name_enterprise':_invoice!.name_enterprise,
                                    'fkcountry':_invoice!.fk_country,
                                    'fk_regoin':_invoice!.fk_regoin
                                  }, _invoice!.idInvoice).then((value) => clear());

                                },
                                child: Text('نعم'),
                              ),
                            ],
                          );
                        },
                      );
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=> second()));
                    },
                        child: Text('تم التركيب للعميل')):Container(),
                  ],
                )
                :Center(
                  child: Container(
                    child: Text('العميل غير مشترك'),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),

    );
  }
   late DateTime _currentDate = DateTime(1,1,1);
  // final DateFormat formatter = DateFormat('yyyy-MM-dd');

  Future<void> _selectDate(BuildContext context, DateTime currentDate) async {
    //String output = formatter.format(currentDate);
    // DateFormat('yyyy-MM-dd – kk:mm').format(now);
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        currentDate: currentDate,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2080));
    if (pickedDate != null )//&& pickedDate != currentDate)
      setState(() {
        // _invoice.dateinstall_task=pickedDate.toString() ;
        _currentDate = pickedDate;
        final time = Duration(hours: DateTime.now().hour, minutes: DateTime.now().minute);
        _currentDate.add(time);
        //_invoice.dateinstall_task=_currentDate.toString();
        //_currentDate.hour=DateTime.now().hour;
      });
  }

clear(){

  _scaffoldKey.currentState!.showSnackBar(
      SnackBar(content: Text('تم التثبيت بنجاح')));
}
error(){
  _scaffoldKey.currentState!.showSnackBar(
      SnackBar(content: Text('يوجد مشكلة ما  ')));
}
}
