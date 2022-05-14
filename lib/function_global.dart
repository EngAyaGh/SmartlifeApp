

import 'package:crm_smart/ui/screen/client/clientView.dart';
import 'package:crm_smart/ui/screen/client/detail_client.dart';
import 'package:crm_smart/ui/screen/client/profileclient.dart';
import 'package:crm_smart/ui/screen/home/approvepage.dart';
import 'package:crm_smart/ui/screen/invoice/get_deleted_invoice.dart';
import 'package:crm_smart/ui/screen/support/support_add.dart';
import 'package:flutter/material.dart';

import 'model/clientmodel.dart';
import 'model/invoiceModel.dart';
import 'model/usermodel.dart';

String showtext(String typeNotify){

  switch (typeNotify){
    case "ApproveRequest":
      return "طلب موافقة";
    case "Transfer" :
      return "تحويل العميل";
    case "ApproveDone":
      return "قبول العميل";
    case "ApproveRefuse":
      return "رفض العميل";
    case "InvoiceDeleted":
      return "حذف فاتورة";
    case "Install":
      return "تم التركيب للعميل";

  }
  return "";
}

void route_notifyto(typeNotify,context,
    Map<String,dynamic>? data,String? datanotify
    ) {
  switch (typeNotify){
    case "ApproveRequest":
      Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => ApprovePage()));
      break;
    case "Transfer" :
      Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => ProfileClient(
                idclient:data==null?datanotify: data['idclient'],
              )
          ));
      break;
    case "ApproveDone":
      Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => ProfileClient(
                idclient: data==null?datanotify:data['idclient'],
              )
          ));
      break;
    case "ApproveRefuse":
      Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => ProfileClient(
                idclient: data==null?datanotify: data['idclient'],
              )
          ));
      break;
    case "InvoiceDeleted":
      Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => deletedinvoice(
              )
          ));
      break;
      case "Install":
      Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => support_add(

               idinvoice: data==null?datanotify:  data['id_invoice']
              )
          ));
      break;
  }

}