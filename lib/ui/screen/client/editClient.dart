import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/provider/loadingprovider.dart';
import 'package:crm_smart/ui/screen/client/transfer_client.dart';
import 'package:crm_smart/ui/widgets/container_boxShadows.dart';
import 'package:crm_smart/ui/widgets/custom_widget/customformtext.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:crm_smart/view_model/typeclient.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import '../../../labeltext.dart';
import 'dart:ui' as myui;
import 'package:intl/intl.dart';
class editclient extends StatefulWidget {
   editclient({required this.itemClient, required this.fkclient,required this.fkuser, Key? key}) : super(key: key);
   String fkclient,fkuser;
   ClientModel itemClient;
  @override
  _editclientState createState() => _editclientState();
}

class _editclientState extends State<editclient> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _globalKey = GlobalKey<FormState>();

  final TextEditingController nameclientController = TextEditingController();

  final TextEditingController nameEnterpriseController = TextEditingController();

  final TextEditingController mobileController = TextEditingController();
  final TextEditingController typejobController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController regoinController = TextEditingController();
  final TextEditingController offerpriceController = TextEditingController();
  final TextEditingController resaonController = TextEditingController();
  final TextEditingController valueBackController = TextEditingController();
  final TextEditingController descresaonController = TextEditingController();
  late typeclient typeclient_provider;
  late final UserModel currentUser;
  @override void dispose() {
    nameclientController.dispose();
    nameEnterpriseController.dispose();
    mobileController.dispose();
    typejobController.dispose();
    cityController.dispose();
    locationController.dispose();
    regoinController.dispose();
    offerpriceController.dispose();
    resaonController.dispose();
    valueBackController.dispose();
    descresaonController.dispose();
    super.dispose();
  }
  @override
  void initState()  {

    currentUser=Provider.of<user_vm_provider>(context,listen: false)
        .currentUser!;
    nameclientController.text=widget.itemClient.nameClient!.toString();
    nameEnterpriseController.text=widget.itemClient.nameEnterprise!.toString();
    mobileController.text=widget.itemClient.mobile!.toString();
    typejobController.text=widget.itemClient.typeJob!.toString();
    cityController.text=widget.itemClient.city!.toString();
    locationController.text=widget.itemClient.location!.toString();
    regoinController.text=widget.itemClient.name_regoin!.toString();
    //////////////////////////////////////////////////////////



    ////////////////////////////////////////
    //print( typeclient_provider.selectedValuemanag);
    offerpriceController.text=widget.itemClient.offer_price==null||widget.itemClient.offer_price==""
        ?"":widget.itemClient.offer_price!;
    print(offerpriceController.text);
    resaonController.text=widget.itemClient.reasonChange==null||widget.itemClient.reasonChange==""
        ? "":widget.itemClient.reasonChange!.toString();//

    valueBackController.text=widget.itemClient.value_back==null||widget.itemClient.value_back==""
        ?"":widget.itemClient.value_back!.toString();

    descresaonController.text=widget.itemClient.desc_reason==null||widget.itemClient.desc_reason==""
        ?"":widget.itemClient.desc_reason!.toString();

    WidgetsBinding.instance!.addPostFrameCallback((_){
      // Add Your Code here.
      typeclient_provider=Provider.of<typeclient>(context,listen: false);
      typeclient_provider.type_of_client
      =widget.itemClient.typeClient=="مشترك"?
      ['منسحب','مشترك']//'مستبعد'
          :widget.itemClient.typeClient=="منسحب"?
      ['مشترك','منسحب']
          :['تفاوض','عرض سعر','مستبعد','منسحب'];


      typeclient_provider.selectedValuemanag=widget.itemClient.typeClient.toString();
      typeclient_provider.getreasons('client');
      typeclient_provider.selectedValuemanag=widget.itemClient.typeClient.toString();
      typeclient_provider.selectedValueOut=typeclient_provider.selectedValuemanag=="منسحب"?
      resaonController.text:null;

      String val=typeclient_provider.selectedValuemanag=="منسحب"
          ?widget.itemClient.dateChangetype.toString()
          :formatter.format(DateTime.now());

      _currentDate=DateTime.parse(val);

    });

    super.initState();
  }
@override
void didChangeDependencies() {
  // Future.delayed(Duration(milliseconds: 30)).then((_) async {
  //
  // });

    super.didChangeDependencies();
  }
    @override
  Widget build(BuildContext context) {
      typeclient_provider=Provider.of<typeclient>(context,listen: true);

      Widget dialog =
      SimpleDialog(
        elevation: 5,
        //backgroundColor: Colors.yellowAccent,
        // shape: StadiumBorder(
        //    side: BorderSide.none
        // ),
        contentPadding: EdgeInsets.all(10),
        title: Text(''),
        children: [
          RowEdit(name: "اسباب الإنسحاب", des: 'required'),
          Consumer<typeclient>(
          builder: (context, cart, child){
            return DropdownButton(
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
            );},
          ),
          SizedBox(height: 3,),
          EditTextFormField(
            vaild: (value) {
              if (value!.isEmpty) {
                return label_empty;
              }
            },
            hintText: "وصف سبب الإنسحاب",
            //obscureText: false,
          //  con: descresaonController, read: false,
            //radius: 5,
            maxline: 5,
            controller: descresaonController,
          ),
          SizedBox(height: 3,),
          EditTextFormField(
            //read: false,
            hintText: 'المبلغ المسترجع',
            //obscureText: false,
            controller: valueBackController,
            //radius: 5,
          ),
          SizedBox(height: 3,),
          RowEdit(name: "تاريخ الإنسحاب", des: 'required'),
          RaisedButton(
            onPressed: () => _selectDate(context,_currentDate),
            child: Text('Select date'),
          ),
          SizedBox(height: 6,),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ElevatedButton(
                //   style: ButtonStyle(
                //       backgroundColor: MaterialStateProperty.all(
                //           kMainColor)),
                //   onPressed: () {
                //
                //     Navigator.of(context, rootNavigator: true)
                //         .pop(false); // dismisses only the dialog and returns false
                //   },
                //   child: Text('تم'),
                // ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          kMainColor)),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true)
                        .pop(false); // dismisses only the dialog and returns false
                  },
                  child: Text('تم'),
                ),
              ],
            ),
          ),
        ],
      );

      return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: kWhiteColor),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            IconButton(

            onPressed: (){
      if (_globalKey.currentState!.validate()) {
        _globalKey.currentState!.save();
        Provider.of<LoadProvider>(context, listen: false)
            .changebooladdclient(true);
        Map<String,dynamic> body={};
        if(typeclient_provider.selectedValuemanag == "عرض سعر")
      body={
          "date_price":
          formatter.format(DateTime.now()) ,
        };
        body.addAll({
          'name_client': nameclientController.text,
          'name_enterprise': nameEnterpriseController.text,
          'type_job': typejobController.text,
          'city': cityController.text,
          'location': locationController.text == null
              ? "null"
              : locationController.text,
          //"fk_regoin":currentUser.fkRegoin==null?"null" :currentUser.fkRegoin,
          //"date_create": ,
          "type_client": typeclient_provider.selectedValuemanag,
          //"fk_user":widget.fkuser,
          // "date_transfer":,
          "mobile": mobileController.text,
          "date_changetype": //typeclient_provider.selectedValuemanag == "منسحب"?
          formatter.format(_currentDate),//:"null",

          "offer_price": offerpriceController.text,
          "reason_change":
          typeclient_provider.selectedValuemanag == "منسحب"
              ? typeclient_provider.selectedValueOut
              : resaonController.text,

          "user_do": Provider
              .of<user_vm_provider>(context, listen: false)
              .currentUser!
              .idUser
              .toString(),
          "desc_reason":  typeclient_provider.selectedValuemanag == "منسحب"
              ?descresaonController.text:"",

          "value_back": typeclient_provider.selectedValuemanag == "منسحب"
              ?valueBackController.text:"",
        });

        Provider.of<client_vm>(context, listen: false)
            .updateclient_vm(body, widget.itemClient.idClients)
            .then((value) =>
            value != "false"
            ? clear(context)
            : error(context)
        );
      }
      }, icon: Icon(Icons.check,color: kWhiteColor)),
          ],
        ),
        body: ModalProgressHUD(
          inAsyncCall: Provider.of<LoadProvider>(context).isLoadingAddclient,
          child: SingleChildScrollView(
            child: Form(
              key: _globalKey,
              child:  Padding(
                padding: EdgeInsets.only(
                    top: 10,
                    right: 20,
                    left: 20,
                    bottom: 10), // EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                child: Directionality(//container shadow
                  textDirection:myui.TextDirection.rtl ,
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
                      Provider.of<privilge_vm>(context,listen: true)
                          .checkprivlge('27')==true||  Provider.of<privilge_vm>(context,listen: true)
                          .checkprivlge('28')==true ?
                      RowEdit(name: label_client_typejob, des: 'Required'):Container(),
                      Provider.of<privilge_vm>(context,listen: true)
                          .checkprivlge('27')==true||  Provider.of<privilge_vm>(context,listen: true)
                          .checkprivlge('28')==true ?
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
                      ):Container(),
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

                      SizedBox(
                        height: 15,
                      ),
                      RowEdit(name: label_clienttype, des: ""),

                      Provider.of<privilge_vm>(context,listen: true)
                          .checkprivlge('27')==true||  Provider.of<privilge_vm>(context,listen: true)
                          .checkprivlge('28')==true ?
                      DropdownButton(
                      isExpanded: true,
                      //hint: Text("حدد حالة العميل"),
                      items: typeclient_provider.type_of_client.map((level_one) {
                            return DropdownMenuItem(

                              child: Text(level_one), //label of item
                              value: level_one, //value of item
                            );
                          }).toList(),
                      value:typeclient_provider.selectedValuemanag,
                      onChanged:(value) {
                        //namemanage=value.toString();
                        typeclient_provider.changevalue(value.toString());
                        if(value=="منسحب") {
                          showDialog<void>(
                              context: context,
                              builder: (context) => dialog);
                        }
                      },
                    ):Container(),
                      SizedBox(height: 2,),
                      Provider.of<privilge_vm>(context,listen: true)
                          .checkprivlge('27')==true||  Provider.of<privilge_vm>(context,listen: true)
                          .checkprivlge('28')==true ?
                      typeclient_provider.selectedValuemanag=="منسحب"?
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                kMainColor)),
                        onPressed: () {

                          showDialog<void>(
                              context: context,
                              builder: (context) => dialog);
                        },
                        child: Text('خيارات الإنسحاب'),
                      ):
                      typeclient_provider.selectedValuemanag=="عرض سعر"?
                      EditTextFormField(
                        hintText: 'عرض سعر',
                        obscureText: false,
                        controller: offerpriceController,
                      ):
                      typeclient_provider.selectedValuemanag=="مستبعد"?
                      EditTextFormField(
                        hintText: 'سبب الاستبعاد',
                        obscureText: false,
                        controller: resaonController,
                      ):Text(''):Container(),
                      Provider.of<privilge_vm>(context,listen: true)
                          .checkprivlge('27')==true||  Provider.of<privilge_vm>(context,listen: true)
                          .checkprivlge('28')==true ?
                      typeclient_provider.selectedValuemanag=="عرض سعر"
                          || typeclient_provider.selectedValuemanag=="تفاوض"?
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Center(
                          child:   ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    kMainColor)),
                            onPressed: () {

                              Navigator.push(context,MaterialPageRoute(
                                  builder: (context)=>transferClient(
                                 name_enterprise:  widget.itemClient.nameEnterprise.toString(),
                                   idclient:   widget.itemClient.idClients.toString(),
                                  type: "client",),fullscreenDialog: true

                              ));
                            },
                            child: Text('تحويل العميل'),
                          ),
                        ),
                      ):Text(""):Container(),
                    ],
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
    _scaffoldKey.currentState!.showSnackBar(
        SnackBar(content: Text("تم الحفظ"))
    );
  }

  error(BuildContext context) {
    Provider.of<LoadProvider>(context, listen: false)
        .changebooladdclient(false);
    _scaffoldKey.currentState!.showSnackBar(
        SnackBar(content: Text("حدث خطأ ما"))
    );

  }
  DateTime _currentDate = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  Future<void> _selectDate(BuildContext context, DateTime currentDate) async {
    String output = formatter.format(currentDate);

    final DateTime? pickedDate = await showDatePicker(
        context: context,
        currentDate: currentDate,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2080));
    if (pickedDate != null )//&& pickedDate != currentDate)
      setState(() {
        _currentDate = pickedDate;

      });
  }


}
