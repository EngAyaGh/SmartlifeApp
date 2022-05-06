
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/ui/widgets/custom_widget/RowWidget.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custombutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InvoiceView extends StatelessWidget {
   InvoiceView({ this.invoice, Key? key}) : super(key: key);
InvoiceModel? invoice;

Widget _product(  List<ProductsInvoice>? products){

 return Expanded(
   child: ListView.builder(
     itemCount: products!.length,
     itemBuilder: (context, index) {
       return
         // Consumer<user_vm_provider>(
         //   builder: (context, cart, child) {
         //     return
               cardRow(
                   title:   products[index].nameProduct.toString(),
               value:  products[index].price.toString()
               );
           //});
     },
     // separatorBuilder: (context, index) {
     //   return Padding(
     //     padding: EdgeInsets.only(right: 30, left: 20, bottom: 5),
     //     child: Divider(
     //       color: Colors.black12,
     //       thickness: 1,
     //     ),
     //   );
     // },
   ),
 );
}
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        child: Padding(
            padding: const EdgeInsets.only(
                left: 8,right: 8,
                top:2,bottom: 2),
            child:
            Column(
              children: [
                _product(invoice!.products),
                Column(
                  children: [
                    Container(
                        color: Colors.amberAccent,
                        child:
                        cardRow( title:' المبلغ الإجمالي',value:invoice!.total.toString(),

                        alignment: MainAxisAlignment.center,)),

                    cardRow( title: 'تاريخ عقد الإشتراك',value:invoice!.dateCreate.toString()),
                    cardRow( title:'اسم المؤسسة',value:invoice!.name_enterprise.toString()),
                    cardRow( title:'موظف المبيعات',value:invoice!.nameUser.toString()),
                    cardRow( title:' المبلغ المتبقي',value: (double.parse(invoice!.total.toString())- double.parse(invoice!.amountPaid.toString())).toString()),
                    cardRow( title:' المنطقة',value:invoice!.name_regoin.toString()),
                    cardRow( title:' طريقة الدفع',value:invoice!.typePay.toString()),
                    cardRow( title:' طريقة التركيب',value:invoice!.typeInstallation.toString()),
                    cardRow( title:' التجديد السنوي',value:invoice!.renewYear.toString()),
                    //cardRow('  المنتجات',invoice.products.toString()),
                    cardRow( title:'آخر تعديل من قبل',value:invoice!.lastuserupdateName.toString()),
                    cardRow( title:'تاريخ آخر تعديل',value:invoice!.date_lastuserupdate.toString()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    CustomButton(
       text: 'تعديل الفاتورة',
      onTap: () async {
          },
    ),
    CustomButton(
      //width: MediaQuery.of(context).size.width * 0.2,
      text: 'حذف الفاتورة',
      onTap: () async {
      },
    ),
  ],
),
                  ],
                )
              ],
            ),

        ),
      ),
    );
  }
}

