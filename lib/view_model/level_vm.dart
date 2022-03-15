import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/configmodel.dart';
import 'package:crm_smart/model/levelmodel.dart';
import 'package:flutter/cupertino.dart';

import '../constants.dart';

class level_vm extends ChangeNotifier{

  late List<LevelModel> listoflevel=[];

  Future<void> getlevel()async {

    List<dynamic> data = await Api()
        .get(url:url+ 'config/getLevel.php');

    for (int i = 0; i < data.length; i++) {
      listoflevel.add(LevelModel.fromJson(data[i]));
    }

    notifyListeners();

  }


}