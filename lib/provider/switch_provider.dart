

import 'package:flutter/cupertino.dart';

class switch_provider extends ChangeNotifier{

  bool isSwitched = false;

  void changeboolValue(val){
    isSwitched=val;
    notifyListeners();
  }

}