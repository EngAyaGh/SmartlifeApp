

import 'package:flutter/cupertino.dart';

class manage_provider extends ChangeNotifier{
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

   late String? selectedValuemanag=null;

   void changevalue(String s){
     selectedValuemanag=s;
     notifyListeners();
   }





}