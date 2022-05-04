import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum TypeNotify{
 ApproveRequest,Transfer,Late,ApproveDone,ApproveRefuse,InvoiceDeleted
}
const kMainColor = Colors.lightBlue;//Color(0xfff2c131);
const kWhiteColor = Colors.white;
const kLogo = 'assest/images/logo.png';
const kUnActiveColor=Colors.lightBlueAccent;//Color(0xdff4dc8c);
const kfontfamily='Pacifico';
const kfontfamily2='Cairo';
const kfontfamily3='Amiri';
const url='https://aya.epaysadaka.com/api/';
const urlimage='https://aya.epaysadaka.com/api/imagesApp/profile/';
const kKeepMeLoggedIn="loginstate";
const Ktoast=Color(0xfff2c131);
List<String> listtext=[
  'مشرف مبيعات',
  'موظف مبيعات',
  'إدارة عناية بالعملاء',
  'موظف دعم',
  'مدير دعم',
  'إدارة عليا',
  'الإدارة المالية',
  'ادارة التحصيل',
  'إدارة العمليات'];