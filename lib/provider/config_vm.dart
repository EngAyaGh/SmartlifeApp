import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/configmodel.dart';
import 'package:flutter/cupertino.dart';

import '../constants.dart';

class config_vm extends ChangeNotifier{

  late List<ConfigModel> listofconfig=[];

  Future<void> getAllConfig(int fk_country)async {

    List<dynamic> data = await Api()
        .get(url:url+ 'config/getconfigbycountry.php?fk_country=1');

    for (int i = 0; i < data.length; i++) {
      listofconfig.add(ConfigModel.fromJson(data[i]));
    }

    notifyListeners();

  }


}