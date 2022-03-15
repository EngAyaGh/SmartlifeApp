


import 'package:flutter/cupertino.dart';

class LoadProvider with ChangeNotifier {

  bool isLoadingAddProd=false;
  void changeboolValueisLoading(bool val){
    isLoadingAddProd=val;
    notifyListeners();
  }
}