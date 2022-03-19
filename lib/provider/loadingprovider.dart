


import 'package:flutter/cupertino.dart';

class LoadProvider with ChangeNotifier {

  bool isLoadingAddProd=false;
  void changeboolValueisLoading(bool val){
    isLoadingAddProd=val;
    notifyListeners();
  } bool isLoadingAddUser=false;
  void changeboolValueUser(bool val){
    isLoadingAddUser=val;
    notifyListeners();
  }

  bool isLoadinglevelcombox=false;
  void changeboolisLoadinglevel(bool val){
    isLoadinglevelcombox=val;
    notifyListeners();
  }
}