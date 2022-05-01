import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/configmodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:flutter/cupertino.dart';

import '../constants.dart';

class config_vm extends ChangeNotifier{

  late List<ConfigModel> listofconfig=[];

  UserModel? usercurrent;

  void setvalue(user){
    print('in set usercurrent in config vm');
    usercurrent=user;
    notifyListeners();
  }

  Future<void> getAllConfig()async {
    listofconfig=[];
    List<dynamic> data = await Api()
        .get(url:url+ 'config/getconfigbycountry.php?fk_country=${usercurrent!.fkCountry}');

    for (int i = 0; i < data.length; i++) {
      listofconfig.add(ConfigModel.fromJson(data[i]));
    }

    notifyListeners();

  }
  Future<bool> updateConfig_vm(Map<String, dynamic?> body,String fk_country) async {
    bool res = await Api().post(
        url:url+ 'config/getconfigbycountry.php?fk_country=$fk_country',
        body:  body);
    if (res) {
      getAllConfig();
      // final index=listofconfig.indexWhere((element) => element.==id_product);
      // listProduct[index]=ProductModel.fromJson(body);
      //listProduct.insert(0, ProductModel.fromJson(body));
      notifyListeners();
    }
    return res;
  }


}