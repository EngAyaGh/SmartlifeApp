import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/deleteinvoicemodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/productmodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/ui/screen/invoice/addInvoice.dart';
import 'package:crm_smart/ui/screen/product/editproduct.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/product_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as rt;
import 'package:provider/provider.dart';

import '../../../constants.dart';

class CardInvoiceClient extends StatefulWidget {
  CardInvoiceClient(
      {required this.itemClient,
      required this.itemProd,
      //required this.indexinvoice,
      Key? key})
      : super(key: key);
  InvoiceModel itemProd;
  ClientModel itemClient;
  // int indexinvoice;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  _CardInvoiceClientState createState() => _CardInvoiceClientState();
}

class _CardInvoiceClientState extends State<CardInvoiceClient> {
  late UserModel _currentUser;

  @override void didChangeDependencies() {
    WidgetsBinding.instance!.addPostFrameCallback((_){

      _currentUser = Provider.of<user_vm_provider>(context, listen: false)
        .currentUser!;});
    super.didChangeDependencies();
  }
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: InkWell(
          //splashColor: Colors.blue.withAlpha(30),
          onTap: () {

            //Navigator.push(context, MaterialPageRoute(builder: (context)=>Detail_Client()));
          },
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 8.0,
                    color: Colors.black87.withOpacity(0.2),
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              //height:130,
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  //textDirection: TextDirection.rtl,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Flex(
                        direction: Axis.vertical,

                        // crossAxisAlignment: CrossAxisAlignment.start,

                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // alignment: Alignment.topRight,
                            children: [
                              Text(''),
                              Text(
                                widget.itemProd.dateCreate.toString(),
                                style: TextStyle(fontFamily: kfontfamily2,
                                    color: kMainColor),
                              ),
                          ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            widget.itemProd.name_enterprise.toString(),
                            style: TextStyle(fontFamily: kfontfamily2
                            ,fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                               // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'الإجمالي',
                                    style: TextStyle(fontFamily: kfontfamily2),
                                  ),
                                  Text(
                                    widget.itemProd.total.toString(),
                                    style: TextStyle(
                                         fontFamily: kfontfamily2,color: kMainColor),
                                  ),
                                  Text(_currentUser.currency.toString(),
                                    style: TextStyle(fontFamily: kfontfamily2,
                                        color: kMainColor),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Row(
                              //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'المتبقي',
                                    style: TextStyle(fontFamily: kfontfamily2
                                    ,color: kMainColor
                                    ),
                                  ),
                                  Text("" +
                                      (double.parse(widget.itemProd.total
                                                  .toString()) -
                                              double.parse(widget
                                                  .itemProd.amountPaid
                                                  .toString()))
                                          .toString(),style: TextStyle(
                                      fontFamily: kfontfamily2,color: kMainColor),)
                                 , Text(_currentUser.currency.toString(),
                                    style: TextStyle(fontFamily: kfontfamily2,
                                        color: kMainColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'التجديد السنوي',
                                    style: TextStyle(fontFamily: kfontfamily2),
                                  ),
                                  Text(
                                    widget.itemProd.renewYear.toString(),
                                    style: TextStyle(fontFamily: kfontfamily2),
                                  ),
                                  Text(_currentUser.currency.toString(),
                                    style: TextStyle(fontFamily: kfontfamily2,
                                        color: kMainColor),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'المتبقي',
                                    style: TextStyle(fontFamily: kfontfamily2,
                                    color: kMainColor),
                                  ),
                                  Text("" +
                                      (double.parse(widget.itemProd.total
                                          .toString()) -
                                          double.parse(widget
                                              .itemProd.amountPaid
                                              .toString()))
                                          .toString(),style: TextStyle(
                                      fontFamily: kfontfamily2,color: kMainColor),),
                                  Text(_currentUser.currency.toString(),
                                    style: TextStyle(fontFamily: kfontfamily2,
                                        color: kMainColor),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        new IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: kMainColor,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => addinvoice(
                                        //edit invoice
                                        itemClient: widget.itemClient,
                                        // iduser: widget.itemProd.fkIdUser,
                                        // idClient: widget.itemProd.fkIdClient,
                                        invoice: widget.itemProd,
                                        // indexinvoice: widget.indexinvoice)
                                )));
                          },
                          //onPressed: BOOKMARK,
                        ),
                        new IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () async {
                            bool result = await showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('التأكيد'),
                                  content: Text('هل تريد حذف الفاتورة'),
                                  actions: <Widget>[
                                    new FlatButton(
                                      onPressed: () {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop(
                                                false); // dismisses only the dialog and returns false
                                      },
                                      child: Text('لا'),
                                    ),
                                    FlatButton(
                                      onPressed: () async {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop(true);
                                        // dismisses only the dialog and returns true
                                        // if(itemProd.idInvoice!=null)
                                        DateTime _currentDate = DateTime.now();
                                        final rt.DateFormat formatter = rt.DateFormat('yyyy-MM-dd');

                                        Provider.of<invoice_vm>(context,
                                                listen: false)
                                            .addlistinvoicedeleted(
                                                DeletedinvoiceModel(

                                          fkClient: widget.itemProd.fkIdClient,
                                          fkUser: _currentUser.idUser, //cuerrent user
                                          dateDelete: formatter.format(_currentDate),
                                          //city:itemProd.
                                          nameClient:
                                              widget.itemProd.nameClient,
                                          nameEnterprise:
                                              widget.itemClient.nameEnterprise,
                                          mobileclient:
                                              widget.itemClient.mobile,
                                          //mobileuser:widget.itemClient. ,
                                          // nameUser: widget.itemProd
                                          //     .nameUser, //موظف المبيعات
                                                  nameUser:_currentUser.nameUser,//name user that doing delete
                                        ));
                                        Provider.of<invoice_vm>(context,
                                                listen: false)
                                            .delete_invoice(
                                            {
                                              "id_invoice":widget.itemProd.idInvoice.toString(),
                                              "fkUserdo": _currentUser.idUser.toString(),
                                              "name_enterprise": widget.itemClient.nameEnterprise.toString(),
                                              "nameUserdo":_currentUser.nameUser.toString(),
                                            },
                                                widget.itemProd.idInvoice);
                                      },
                                      child: Text('نعم'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          //onPressed: COPY,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        //  ),
      ),
    );
  }
}
