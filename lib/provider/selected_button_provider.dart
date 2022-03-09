



import 'package:flutter/cupertino.dart';

class selected_button_provider extends ChangeNotifier{

  int isSelected= 0;
  void selectValue(val){
    isSelected=val;
    notifyListeners();
  }

}