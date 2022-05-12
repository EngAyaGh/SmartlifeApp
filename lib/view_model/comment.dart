


import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/commentmodel.dart';
import 'package:flutter/cupertino.dart';

import '../constants.dart';

class comment_vm extends ChangeNotifier{
List<CommentModel> listComments=[];
bool isloadadd=false;
  Future<void> getComment(String fk_client)async {
    listComments=[];
    isloadadd=true;
    notifyListeners();
   // if(listComments.isEmpty){
      List<dynamic> data=[];
      data= await Api()
          .get(url:url+ 'care/viewcomment.php?fk_client=$fk_client');
      print(data);
      if(data !=null) {
        for (int i = 0; i < data.length; i++) {
          listComments.add(CommentModel.fromJson(data[i]));
        }
      //}

      //return data;
    }
    isloadadd=false;
    notifyListeners();
  }
  Future<String> addComment_vm(Map<String, dynamic?> body,String? imageurl) async {
    isloadadd=true;
    notifyListeners();
    String res = await Api().post(
        url: url+'care/addcomment.php',
        body: body);
    if (res!="error") {
      body.addAll({
        'id_comment':res,
      });
      //listComments=[];
      listComments.add(CommentModel.fromJson(body));
      final index=listComments.indexWhere((element) => element.idComment==res);
      listComments[index].imgImage=imageurl.toString();
      isloadadd=false;
      notifyListeners();
    }
    return res;
  }
}