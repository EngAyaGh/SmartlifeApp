import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/deleteinvoicemodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/ui/screen/invoice/addInvoice.dart';
import 'package:crm_smart/ui/widgets/custom_widget/RowWidget.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custombutton.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart' as rt;

class InvoiceView extends StatelessWidget {
  InvoiceView({required this.invoice, required this.clientmodel, Key? key})
      : super(key: key);
  //String idinvoice;
  ClientModel clientmodel;
  InvoiceModel? invoice;

  Widget _product(List<ProductsInvoice>? products) {
    return ListView.builder(
      itemCount: products!.length,
      itemBuilder: (context, index) {
        return
          // Consumer<user_vm_provider>(
          //   builder: (context, cart, child) {
          //     return
          cardRow(
              title: products[index].nameProduct.toString(),
              value: products[index].price.toString());
        //});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // if(invoice!=null||idinvoice!=''){
    //   int index=Provider.of<invoice_vm>(context,listen: true)
    //       .listinvoices.indexWhere((element) => element.idInvoice==idinvoice);
    // if(index!=-1) invoice=Provider.of<invoice_vm>(context,listen: true)
    //     .listinvoices[index];
    // }
    // invoice=Provider.of<invoice_vm>(context,listen: true).listinvoices
    //     .firstWhere((element) => element.idInvoice==idinvoice,orElse: ()=>null);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child:
          //invoice!=null?
          ListView(
            children: [
              // Container(
              //  // height: MediaQuery.of(context).size.width * 0.85,
              //   //width: MediaQuery.of(context).size.width * 0.85,
              //   decoration: BoxDecoration(
              //     shape: BoxShape.rectangle,
              //     border: Border.all(color: Colors.amber),
              //   ),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Text('المبلغ الإجمالي '),
              //       Text(invoice!.total.toString()),
              //     ],
              //   ),
              //   //  cardRow(
              //   //   title: ' المبلغ الإجمالي',
              //   //   value: invoice!.total.toString(),
              //   //   alignment: MainAxisAlignment.center,
              //   // ),
              // ),
              Container(
                // height: MediaQuery.of(context).size.height * 0.9,
                child: Column(
                  children: [
                    _product(invoice!.products),
                    SizedBox(
                      height: 10,
                    ),

                    cardRow(
                        title: 'تاريخ عقد الإشتراك',
                        value: invoice!.dateCreate.toString()),
                    cardRow(
                        title: 'المبلغ المدفوع',
                        value: invoice!.amountPaid.toString()),
                    cardRow(
                        title: ' المبلغ المتبقي',
                        value: (double.parse(invoice!.total.toString()) -
                            double.parse(invoice!.amountPaid.toString()))
                            .toString()),
                    cardRow(
                        title: ' التجديد السنوي',
                        value: invoice!.renewYear.toString()),
                    cardRow(
                        title: ' طريقة الدفع', value: invoice!.typePay.toString()),
                    //nameuserApprove
                    cardRow(
                        title: 'معتمد الاشتراك',
                        value: invoice!.nameuserApprove.toString()),
                    cardRow(
                        title: 'تاريخ اعتماد الاشتراك',
                        value: invoice!.date_approve.toString()),
                    //date_approve
                    //   cardRow(
                    //       title: 'اسم المؤسسة',
                    //       value: invoice!.name_enterprise.toString()),
                    //   cardRow(
                    //       title: 'موظف المبيعات',
                    //       value: invoice!.nameUser.toString()),
                    //
                    //   cardRow(
                    //       title: ' المنطقة', value: invoice!.name_regoin.toString()),

                    cardRow(
                        title: ' طريقة الدفع',
                        value: invoice!.typePay.toString()),

                    //cardRow('  المنتجات',invoice.products.toString()),
                    cardRow(
                        title: 'تاريخ آخر تعديل',
                        value: invoice!.date_lastuserupdate != null
                            ? invoice!.date_lastuserupdate.toString()
                            : ''),
                    cardRow(
                        title: 'آخر تعديل من قبل',
                        value: invoice!.date_lastuserupdate != null?
                        invoice!.lastuserupdateName.toString():''),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomButton(
                            text: 'تعديل الفاتورة',
                            onTap: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => addinvoice(
                                          invoice: invoice,
                                          itemClient: clientmodel)));
                            },
                          ),

                          // CustomButton(
                          //   //width: MediaQuery.of(context).size.width * 0.2,
                          //   text: 'فواتير العميل ',
                          //   onTap: () async {
                          //     Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (context) =>
                          //         invoices(
                          //        itemClient: clientmodel,
                          //        fkclient: clientmodel.idClients.toString(),
                          //        fkuser: '',)));
                          //
                          //     // invoices(
                          //     //   itemClient: _clientModel,
                          //     //   fkclient: _clientModel.idClients.toString(),
                          //     //   fkuser: '',),
                          //   },
                          // ),
                          CustomButton(
                            //width: MediaQuery.of(context).size.width * 0.2,
                              text: 'حذف الفاتورة',
                              onTap: () async {

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
                                            final rt.DateFormat formatter =
                                            rt.DateFormat('yyyy-MM-dd');
                                            Provider.of<invoice_vm>(context,
                                                listen: false)
                                                .addlistinvoicedeleted(
                                                DeletedinvoiceModel(
                                                  fkClient: invoice!.fkIdClient.toString(),
                                                  fkUser: Provider.of<user_vm_provider>(context, listen: false).currentUser!
                                                      .idUser, //cuerrent user
                                                  dateDelete:
                                                  formatter.format(_currentDate),
                                                  //city:itemProd.
                                                  nameClient:
                                                  invoice!.nameClient.toString(),
                                                  nameEnterprise:
                                                  clientmodel.nameEnterprise,
                                                  mobileclient:
                                                  clientmodel.mobile,
                                                  //mobileuser:widget.itemClient. ,
                                                  // nameUser: widget.itemProd
                                                  //     .nameUser, //موظف المبيعات
                                                  nameUser: Provider.of<user_vm_provider>(context, listen: false).currentUser!
                                                      .nameUser, //name user that doing delete
                                                ));
                                            Provider.of<invoice_vm>(context,
                                                listen: false)
                                                .delete_invoice({
                                              "id_invoice":
                                              invoice!.idInvoice
                                                  .toString(),
                                              "fkUserdo":
                                              Provider.of<user_vm_provider>(context, listen: false).currentUser!
                                                  .idUser.toString(),
                                              "name_enterprise": clientmodel.nameEnterprise
                                                  .toString(),
                                              "nameUserdo":
                                              Provider.of<user_vm_provider>(context, listen: false).currentUser!
                                                  .nameUser.toString(),
                                            }, invoice!.idInvoice);
                                            Navigator.pop(context);


                                          },
                                          child: Text('نعم'),
                                        ),
                                      ],
                                    );
                                  },
                                );

                              }),
                        ],
                      ),),
                  ],
                ),
              ),
            ],
          ),
      ),),
    );
  }
}