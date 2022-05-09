
import 'package:crm_smart/constants.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/ui/screen/support/support_view.dart';
import 'package:crm_smart/ui/widgets/container_boxShadows.dart';
import 'package:crm_smart/ui/widgets/custom_widget/RowWidget.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/ui/widgets/widgetcalendar/utils.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
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
  TextEditingController _textsupport=TextEditingController();
  late InvoiceModel _invoice;
  @override
  void initState()  {
    _invoice = Provider
        .of<invoice_vm>(context, listen: false)
        .listinvoices
        .firstWhere(
            (element) =>
        element.idInvoice == widget.idinvoice);


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
    print('builld');
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ContainerShadows(
                margin: EdgeInsets.all(12),
                child: Column(
                  children: [
                    RowEdit(name: 'موعد التركيب للعميل من ', des: ''),
                    SizedBox(height: 10,),
                    _invoice.dateinstall_done!=null?//تم التركيب
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
                        _invoice.dateinstall_task.toString(),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                      ),
                      readOnly: true,
                      onTap: (){
                      },
                    ):
                    Row(
                      children: [
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
                              _invoice.dateinstall_task==null || _currentDate!=DateTime(1,1,1)
                                ?_currentDate.toString()
                                :_invoice.dateinstall_task.toString(),
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
                        _invoice.dateinstall_task==null?
                        IconButton(onPressed: () {
                          Provider.of<invoice_vm>(context,listen: false)
                              .setdate_vm({
                            'dateinstall_task':_currentDate.toString(),//_invoice.dateinstall_task.toString()
                          }, _invoice.idInvoice);
                          _invoice.dateinstall_task=_currentDate.toString();
                        }, icon:Icon( Icons.check,color: kMainColor))
                        :Container(),
                        SizedBox(height: 6,),
                        _invoice.dateinstall_task!=null?
                        Row(
                          children: [
                            Text('إعادة الجدولة'),
                            IconButton(onPressed: (){
                              Provider.of<invoice_vm>(context,listen: false)
                                  .setdate_vm({
                                'dateinstall_task':_invoice.dateinstall_task.toString(),
                                'reason_date':_textsupport.text.toString()
                              }, _invoice.idInvoice);

                            },
                                icon:Icon( Icons.check,color: kMainColor)),

                          ],
                        ):Container(),
                      ],
                    ),
                    _invoice.dateinstall_task!=null?   EditTextFormField(
                      hintText: 'أسباب إعادة الجدولة',
                      obscureText: false,
                      controller: _textsupport,
                      vaild: (value) {
                        if (value!.isEmpty) {
                          return 'الحقل فارغ';
                        }
                      },
                    ):Container(),
                    SizedBox(height: 20,),

                    cardRow(title: 'اسم المؤسسة',value: _invoice.name_enterprise.toString()),
                    cardRow(title: 'معتمد الاشتراك ',value:_invoice.nameuserApprove==null?'':
                    _invoice.nameuserApprove.toString()),

                    _invoice.dateinstall_done==null? Container()
                    :cardRow(title: ' تم التركيب من قبل ',value: _invoice.nameuserinstall.toString()),
                    _invoice.dateinstall_done==null? Container():
                    cardRow(title: ' تاريخ التركيب ',value: _invoice.dateinstall_done.toString()),

                    cardRow(title: 'هل تم التركيب ',
                        value: _invoice.dateinstall_done==null? 'بالانتظار' : 'تم التركيب'),
                    cardRow(title: 'طريقة التركيب ',
                        value: _invoice.typeInstallation.toString()=='0'?'ميداني':'اونلاين'),
                    SizedBox(height: 16,),

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
                                    'userinstall':Provider.of<user_vm_provider>
                                      (context,listen: false).currentUser!.idUser.toString(),
                                    'isdoneinstall':'1',
                                    'nameuserinstall':Provider.of<user_vm_provider>
                                      (context,listen: false).currentUser!.nameUser.toString(),
                                     'name_enterprise':_invoice.name_enterprise
                                  }, _invoice.idInvoice);

                                },
                                child: Text('نعم'),
                              ),
                            ],
                          );
                        },
                      );
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=> second()));
                    },
                        child: Text('تم التركيب للعميل')),
                  ],
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



}
