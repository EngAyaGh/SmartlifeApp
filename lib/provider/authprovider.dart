


import 'package:flutter/cupertino.dart';

class AuthProvider with ChangeNotifier {
  late String valuetextButton;
  late String valuetextHint;
  bool sendcode=true;

  void changeboolValue(){
    sendcode=!sendcode;
    notifyListeners();
  }

  void setvalueButton(value){
    valuetextButton=value;
    notifyListeners();
  }
  void setvalueHint(value){
    valuetextHint=value;
    notifyListeners();
  }


}