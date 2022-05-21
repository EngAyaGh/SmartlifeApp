


import 'package:flutter/cupertino.dart';

class datetime_vm extends ChangeNotifier{

  late DateTime valuedateTime= DateTime(1, 1, 1);

  void setdatetimevalue(DateTime val){
    valuedateTime=val;
    notifyListeners();
  }

}