


import 'package:crm_smart/model/levelmodel.dart';
import 'package:crm_smart/provider/loadingprovider.dart';
import 'package:crm_smart/view_model/level_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class levelCombox extends StatelessWidget {
   levelCombox({Key? key}) : super(key: key);
  String? _selected=null;

  @override
  Widget build(BuildContext context) {
  Provider.of<level_vm>(context,listen: false).getlevel();
  List<LevelModel> _list=Provider.of<level_vm>(context,listen: false).listoflevel;

    return   Scaffold(
    body:

  Padding(
    padding: const EdgeInsets.all(32),
    child: Container(
        child:DropdownButton(
          isExpanded: true,
          hint: Text("حدد الصلاحية"),
          items: _list.map((level_one){
            return DropdownMenuItem(

              child: Text(level_one.nameLevel), //label of item
              value: level_one.idLevel.toString(), //value of item
            );
          }).toList(),
          value:_selected, //select_dataItem!.idCountry ,
          onChanged: (value) {
            _selected=value.toString();

          },
        ),


      ),
  ));
  }
}
