
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/ui/widgets/custom_widget/RowWidget.dart';
import 'package:flutter/cupertino.dart';

class InvoiceView extends StatelessWidget {
   InvoiceView({required this.invoice, Key? key}) : super(key: key);
InvoiceModel invoice;
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
                cardRow('تاريخ عقد الإشتراك',invoice.dateCreate.toString()),
                cardRow('اسم المؤسسة',invoice.name_enterprise.toString()),
                cardRow(' المبلغ الإجمالي',invoice.total.toString()),
                cardRow('موظف المبيعات',invoice.nameUser.toString()),
                cardRow(' المبلغ المتبقي', (double.parse(invoice.total.toString())- double.parse(invoice.amountPaid.toString())).toString()),
                cardRow(' المنطقة',invoice.name_regoin.toString()),
                cardRow(' طريقة الدفع',invoice.typePay.toString()),
                cardRow(' طريقة التركيب',invoice.typeInstallation.toString()),
                cardRow(' التجديد السنوي',invoice.renewYear.toString()),
              ],
            )
        ),
      ),
    );
  }
}
