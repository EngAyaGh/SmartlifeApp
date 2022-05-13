import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/ui/screen/invoice/addInvoice.dart';
import 'package:crm_smart/ui/widgets/custom_widget/RowWidget.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custombutton.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'invoces.dart';
class InvoiceView extends StatelessWidget {
  InvoiceView({required this.idinvoice, required this.clientmodel, Key? key})
      : super(key: key);
  String idinvoice;
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
    if(invoice!=null||idinvoice!='')
    invoice=Provider.of<invoice_vm>(context,listen: true).listinvoices
        .firstWhere((element) => element.idInvoice==idinvoice);
    return SingleChildScrollView(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child:
        invoice!=null?
        Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.1,
                child: _product(invoice!.products)),
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(color: Colors.amber),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('المبلغ الإجمالي '),
                      Text(invoice!.total.toString()),
                    ],
                  ),
                  //  cardRow(
                  //   title: ' المبلغ الإجمالي',
                  //   value: invoice!.total.toString(),
                  //   alignment: MainAxisAlignment.center,
                  // ),
                ),
                SizedBox(
                  height: 10,
                ),

                cardRow(
                    title: 'تاريخ عقد الإشتراك',
                    value: invoice!.dateCreate.toString()),
                cardRow(
                    title: 'اسم المؤسسة',
                    value: invoice!.name_enterprise.toString()),
                cardRow(
                    title: 'موظف المبيعات',
                    value: invoice!.nameUser.toString()),
                cardRow(
                    title: ' المبلغ المتبقي',
                    value: (double.parse(invoice!.total.toString()) -
                        double.parse(invoice!.amountPaid.toString()))
                        .toString()),
                cardRow(
                    title: ' المنطقة', value: invoice!.name_regoin.toString()),
                cardRow(
                    title: ' طريقة الدفع', value: invoice!.typePay.toString()),
                cardRow(
                    title: ' طريقة التركيب',
                    value: invoice!.typeInstallation.toString()),
                cardRow(
                    title: ' التجديد السنوي',
                    value: invoice!.renewYear.toString()),
                //cardRow('  المنتجات',invoice.products.toString()),
                cardRow(
                    title: 'آخر تعديل من قبل',
                    value: invoice!.date_lastuserupdate != null?
                    invoice!.lastuserupdateName.toString():''),
                cardRow(
                    title: 'تاريخ آخر تعديل',
                    value: invoice!.date_lastuserupdate != null
                        ? invoice!.date_lastuserupdate.toString()
                        : ''),
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
                      CustomButton(
                        //width: MediaQuery.of(context).size.width * 0.2,
                        text: 'فواتير العميل ',
                        onTap: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                              invoices(
                             itemClient: clientmodel,
                             fkclient: clientmodel.idClients.toString(),
                             fkuser: '',)));

                          // invoices(
                          //   itemClient: _clientModel,
                          //   fkclient: _clientModel.idClients.toString(),
                          //   fkuser: '',),
                        },
                      ),
                      // CustomButton(
                      //   //width: MediaQuery.of(context).size.width * 0.2,
                      //   text: 'حذف الفاتورة',
                      //   onTap: () async {},
                      // ),
                    ],
                  ),
                ),
              ],
            )
          ],
        )
            :    CustomButton(
          text: ' إنشاء فاتورة جديدة',
          onTap: () async {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => addinvoice(
                       // invoice: invoice,
                        itemClient: clientmodel)));
          },
        ),
      ),
    );
  }
}