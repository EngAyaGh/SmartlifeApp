
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/ui/widgets/custom_widget/RowWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InvoiceView extends StatelessWidget {
   InvoiceView({required this.invoice, Key? key}) : super(key: key);
InvoiceModel invoice;

Widget _product(  List<ProductsInvoice>? products){

 return Expanded(
    child: ListView.builder(
      itemCount: products!.length,
      itemBuilder: (context, index) {
        return
          // Consumer<user_vm_provider>(
          //   builder: (context, cart, child) {
          //     return
                Padding(
                padding: const EdgeInsets.all(8.0),
                child: cardRow(
                  products[index].nameProduct.toString(),
                  products[index].price.toString()
                ),
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
            child:Column(
              children: [
                _product(invoice.products),
                cardRow('تاريخ عقد الإشتراك',invoice.dateCreate.toString()),
                cardRow('اسم المؤسسة',invoice.name_enterprise.toString()),
                cardRow(' المبلغ الإجمالي',invoice.total.toString()),
                cardRow('موظف المبيعات',invoice.nameUser.toString()),
                cardRow(' المبلغ المتبقي', (double.parse(invoice.total.toString())- double.parse(invoice.amountPaid.toString())).toString()),
                cardRow(' المنطقة',invoice.name_regoin.toString()),
                cardRow(' طريقة الدفع',invoice.typePay.toString()),
                cardRow(' طريقة التركيب',invoice.typeInstallation.toString()),
                cardRow(' التجديد السنوي',invoice.renewYear.toString()),
                //cardRow('  المنتجات',invoice.products.toString()),
                cardRow('آخر تعديل من قبل',invoice.lastuserupdateName.toString()),
              ],
            )
        ),
      ),
    );
  }
}

