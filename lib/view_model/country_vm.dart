


import 'package:flutter/cupertino.dart';

class country_vm extends ChangeNotifier{
  late int id_country=1,id_regoin;
  setIDCountry(val){
    this.id_country=val;
    notifyListeners();
  }
  setIDRegoin(val){
    this.id_regoin=val;
    notifyListeners();
  }
}