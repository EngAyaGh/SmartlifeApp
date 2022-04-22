

import 'package:crm_smart/ui/screen/client/detail_client.dart';
import 'package:crm_smart/ui/screen/home/approvepage.dart';
import 'package:crm_smart/ui/screen/invoice/get_deleted_invoice.dart';
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

  }
  return "";
}

void route_notifyto(typeNotify,context){
  switch (typeNotify){
    case "ApproveRequest":
      Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => ApprovePage()));
      break;
    case "Transfer" :
      Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => Detail_Client(

              )
          ));
      break;
    case "ApproveDone":
      Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => Detail_Client(
              )
          ));
      break;
    case "ApproveRefuse":
      Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => Detail_Client(
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
  }

}