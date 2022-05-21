import 'package:crm_smart/constants.dart';
import 'package:crm_smart/function_global.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/ticketmodel.dart';
import 'package:crm_smart/ui/screen/home/ticket/ticketadd.dart';
import 'package:crm_smart/ui/screen/home/ticket/ticketview.dart';
import 'package:crm_smart/ui/screen/product/productView.dart';
import 'package:crm_smart/ui/screen/support/support_view.dart';
import 'package:crm_smart/ui/widgets/container_boxShadows.dart';
import 'package:crm_smart/ui/widgets/custom_widget/RowWidget.dart';
import 'package:crm_smart/ui/widgets/custom_widget/card_expansion.dart';
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
  support_add({required this.idinvoice, Key? key}) : super(key: key);
  String? idinvoice;

  @override
  _support_addState createState() => _support_addState();
}

class _support_addState extends State<support_add> {
  TextEditingController _textsupport = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  late InvoiceModel? _invoice = null;
  String? fk_client;
  bool valueresoan = false;
  @override
  void dispose() {
    _textsupport.dispose();
    super.dispose();
  }

  @override
  void initState() {
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

  @override
  void didChangeDependencies() {
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
    _invoice = Provider.of<invoice_vm>(context, listen: true)
        .listinvoices
        .firstWhere((element) => element.idInvoice == widget.idinvoice);
    // int index=Provider.of<invoice_vm>(context,listen: true)
    //     .listinvoices.indexWhere((element) => element.idInvoice==widget.idinvoice);
    // if(index!=-1){ _invoice=Provider.of<invoice_vm>(context,listen: true)
    //     .listinvoices[index];
    //   fk_client= _invoice!.fkIdClient;}
    // // Provider.of<ticket_vm>(context, listen: true)
    // //     .getclient_ticket( fk_client.toString());
    // }
    final _globalKey = GlobalKey<FormState>();

    Widget dialog =
    SimpleDialog(
        titlePadding:const EdgeInsets.fromLTRB(24.0, 1.0, 24.0, 10.0) ,
        insetPadding:  EdgeInsets.only(left: 10,right: 10,bottom: 10),
        contentPadding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
        title: Center(child: Text('إعادة جدولة',style:TextStyle(fontFamily: kfontfamily2))),
        children:[
          Form(
            key: _globalKey,
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.date_range,
                      color: kMainColor,
                    ),
                    hintStyle:
                    const TextStyle(
                        color: Colors.black45,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                    hintText:
                    _invoice!.daterepaly == null
                        && _currentDate == DateTime(1, 1, 1)
                        ? 'تعيين الوقت والتاريخ' //_currentDate.toString()
                        : _currentDate.toString(),//_invoice!.daterepaly.toString(),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                  ),
                  readOnly:  true,
                  onTap: () {
                    _selectDate(context,
                        DateTime.now());
                    // final DateTime? pickedDate =
                    //     await showDatePicker(
                    //     context: context,
                    //     currentDate: _currentDate,
                    //     initialDate: _currentDate,
                    //     firstDate: DateTime(2015),
                    //     lastDate: DateTime(2090));
                    // if (pickedDate !=
                    //     null) //&& pickedDate != currentDate)
                    //   setState(() {
                    //     _currentDate = pickedDate;
                    //     final time = Duration(
                    //         hours: DateTime.now().hour, minutes: DateTime.now().minute);
                    //     _currentDate.add(time);
                    //     _invoice!.dateinstall_task = _currentDate.toString();
                    //   });
                  },
                ),
                SizedBox(height: 5,),
                EditTextFormField(
                  maxline: 4,
                  hintText:
                  'أسباب إعادة الجدولة',
                  obscureText: false,
                  controller: _textsupport,
                  vaild: (value) {
                    if (value!.isEmpty) {
                      return 'الحقل فارغ';
                    }
                  },
                ),
                TextButton(
                  child: Text("تثبيت"),
                  onPressed: () async {
                    if (_globalKey.currentState!
                        .validate()) {
                      _globalKey.currentState!.save();
                      Provider.of<invoice_vm>(context, listen: false)
                          .setdate_vm({
                        // 'fk_invoice':,
                        // 'fk_idClient':,
                        // 'fk_idUser':,
                        // 'type_date':,
                        // 'date_install':,
                        'daterepaly': _currentDate.toString(),
                        'fkuserdatareplay':Provider.of<user_vm_provider>(context,listen: false)
                            .currentUser!.idUser,
                        'reason_date': _textsupport.text.toString()
                      }, _invoice!.idInvoice).then((value) => clear());
                    }
                  },
                ),
              ],
            ),
          ),

        ]);
    print('builld');
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildcardExpansion('فاتورة  '+_invoice!.dateCreate.toString(),'',
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 5),
                  child: Column(
              children: [
                  _invoice!.dateinstall_done == null&&_invoice!.dateinstall_task==null
                ?RowEdit(name: 'تحديد موعد التركيب والتدريب ', des: ''):Container(),
                  SizedBox(
                    height: 10,
                  ),
                  _invoice!.dateinstall_done == null &&
                      _invoice!.dateinstall_task==null
                      ? //تم التركيب

                  //TextField(
                  //     decoration: InputDecoration(
                  //     prefixIcon: Icon(
                  //       Icons.date_range,
                  //       color: kMainColor,
                  //     ),
                  //     hintStyle: const TextStyle(
                  //         color: Colors.black45,
                  //         fontSize: 16,
                  //         fontWeight: FontWeight.w500),
                  //     hintText: _invoice!.dateinstall_done.toString(),
                  //     filled: true,
                  //     fillColor: Colors.grey.shade200,
                  //   ),
                  //   readOnly: true,
                  //   onTap: () {},
                  // )

                  Row(
                    children: [
                      //  SizedBox(width: 3,),
                      Flexible(
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.date_range,
                              color: kMainColor,
                            ),
                            hintStyle: const TextStyle(
                                color: Colors.black45,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                            hintText: _invoice!.dateinstall_task ==null
                                &&  _currentDate == DateTime(1, 1, 1)
                                ? 'تعيين الوقت والتاريخ' //_currentDate.toString()
                                : _invoice!.dateinstall_task.toString(),
                            filled: true,
                            fillColor: Colors.grey.shade200,
                          ),
                          readOnly: true,
                          onTap: () {
                            _selectDate(context, DateTime.now());
                          },
                        ),
                      ),

                      _invoice!.dateinstall_task == null//first time for set date for client
                          ? IconButton(
                          onPressed: () {
                            Provider.of<invoice_vm>(context,
                                listen: false)
                                .setdate_vm({
                              'dateinstall_task': _currentDate
                                  .toString(), //_invoice.dateinstall_task.toString()
                              'fkusertask':Provider.of<user_vm_provider>(context,listen: false)
                                  .currentUser!.idUser,
                              // 'nameusertask':Provider.of<user_vm_provider>(context,listen: false)
                              //     .currentUser!.nameUser,
                            }, _invoice!.idInvoice).then(
                                    (value) => clear());
                            // _invoice!.dateinstall_task =
                            //     _currentDate.toString();
                            _currentDate = DateTime(1, 1, 1);
                          },
                          icon: Icon(Icons.check,
                              size: 50, color: kMainColor))
                          : Container(),
                      SizedBox(
                        height: 6,
                      ),
                    ],
                  ) :  Container(),

                  _invoice!.dateinstall_task != null &&
                      _invoice!.dateinstall_done == null
                      ? ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(kMainColor)),
                    onPressed: () async {
                      await showDialog<void>(
                          context: context,
                          builder: (context) => dialog
                      );
                      // setState(() {
                      //   valueresoan=true;
                      //
                      // });
                    },
                    child: Text('إعادة تعيين تاريخ التركيب'),
                  )
                      : Container(),
                  //  valueresoan==true?   Padding(
                  //   padding: const EdgeInsets.only(top:8.0),
                  //   child:Form(
                  //     key:_globalKey ,
                  //     child: EditTextFormField(
                  //       maxline: 4,
                  //       hintText: 'أسباب إعادة الجدولة',
                  //       obscureText: false,
                  //       controller: _textsupport,
                  //       vaild: (value) {
                  //         if (value!.isEmpty) {
                  //           return 'الحقل فارغ';
                  //         }
                  //       },
                  //     ),
                  //   ),
                  // ):Container(),
                  SizedBox(
                    height: 20,
                  ),

                  // cardRow(title: 'اسم المؤسسة',value: _invoice!.name_enterprise.toString()),
                  // cardRow(title: 'معتمد الاشتراك ',value:_invoice!.nameuserApprove==null?'':
                  // _invoice!.nameuserApprove.toString()),
                  _invoice!.dateinstall_done == null
                      ? Container()
                      : cardRow(
                      title: ' تاريخ التركيب ',
                      value: _invoice!.dateinstall_done.toString()),

                  _invoice!.dateinstall_done == null
                      ? Container()
                      : cardRow(
                      title: ' تم التركيب من قبل ',
                      value: getnameshort(
                          _invoice!.nameuserinstall.toString())),
//////////////////////////////////////////////////////////////////////////////////////////
                  _invoice!.daterepaly != null
                      ? cardRow(
                      title: ' تاريخ إعادة الجدولة',
                      value: _invoice!.daterepaly.toString())
                      : Container(),
                  _invoice!.daterepaly != null
                      ? cardRow(
                      title: ' قام بإعادة الجدولة',
                      value: _invoice!.nameuserreplay.toString())
                      : Container(),
                  _invoice!.daterepaly != null
                      ? cardRow(
                      title: ' سبب إعادة الجدولة',
                      value: _invoice!.reason_date.toString(),isExpanded: true,)
                      : Container(),
                  ///////////////////////////////////////////////
                  _invoice!.dateinstall_task != null
                      ? cardRow(
                      title: ' تاريخ جدولة التركيب ',
                      value: _invoice!.dateinstall_task.toString())
                      : Container(),
                  _invoice!.dateinstall_task != null
                      ? cardRow(
                      title: ' قام بجدولة التركيب ',
                      value: _invoice!.nameusertask.toString())
                      : Container(),
                  cardRow(
                      title: 'طريقة التركيب ',
                      value: _invoice!.typeInstallation.toString() == '0'
                          ? 'ميداني'
                          : 'اونلاين'),
                  cardRow(
                      title: 'هل تم التركيب للعميل ',
                      value: _invoice!.dateinstall_done == null
                          ? 'بالانتظار'
                          : 'تم التركيب'),

                  _invoice!.dateinstall_done == null
                      ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(kMainColor)),
                      onPressed: () async {
                        await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('التأكيد'),
                              content: Text('هل تريد تأكيد عملية التركيب'),
                              actions: <Widget>[
                                new ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.all(
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
                                      backgroundColor:
                                      MaterialStateProperty.all(
                                          kMainColor)),
                                  onPressed: () async {
                                    Navigator.of(context,
                                        rootNavigator: true)
                                        .pop(true);
                                    Provider.of<invoice_vm>(context,
                                        listen: false)
                                        .setdatedone_vm({
                                      'dateinstall_done':
                                      DateTime.now().toString(),
                                      'userinstall':
                                      Provider.of<user_vm_provider>(
                                          context,
                                          listen: false).currentUser!.idUser.toString(),
                                      'isdoneinstall': '1',
                                      'fkIdClient': _invoice!.fkIdClient,
                                      'nameuserinstall':
                                      Provider.of<user_vm_provider>(
                                          context,
                                          listen: false).currentUser!.nameUser.toString(),
                                      'name_enterprise':
                                      _invoice!.name_enterprise,
                                      'fkcountry': _invoice!.fk_country,
                                      'fk_regoin': _invoice!.fk_regoin
                                    }, _invoice!.idInvoice).then(
                                            (value) => clear());
                                  },
                                  child: Text('نعم'),
                                ),
                              ],
                            );
                          },
                        );
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=> second()));
                      },
                      child: Text('تم التركيب للعميل'))
                      : Container(),
              ],
            ),
                )),
          ),
        ),
      ),
    );
  }

  late DateTime _currentDate = DateTime(1, 1, 1);
  // final DateFormat formatter = DateFormat('yyyy-MM-dd');

  Future<void> _selectDate(BuildContext context, DateTime currentDate) async {
    //String output = formatter.format(currentDate);
    // DateFormat('yyyy-MM-dd – kk:mm').format(now);
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        currentDate: currentDate,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(3010));
    if (pickedDate != null) //&& pickedDate != currentDate)
      setState(() {
        // _invoice.dateinstall_task=pickedDate.toString() ;
        _currentDate = pickedDate;
        final time = Duration(
            hours: DateTime.now().hour, minutes: DateTime.now().minute);
        _currentDate.add(time);
        // _invoice!.dateinstall_task = _currentDate.toString();
        //_invoice!.daterepaly = _currentDate.toString();
        //_currentDate.hour=DateTime.now().hour;
      });
  }

  clear() {
    _scaffoldKey.currentState!
        .showSnackBar(SnackBar(content: Text('تم التثبيت بنجاح')));
  }

  error() {
    _scaffoldKey.currentState!
        .showSnackBar(SnackBar(content: Text('يوجد مشكلة ما  ')));
  }
}
