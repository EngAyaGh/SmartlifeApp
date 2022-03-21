

import 'package:crm_smart/model/levelmodel.dart';
import 'package:crm_smart/provider/loadingprovider.dart';
import 'package:crm_smart/view_model/level_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class levelCombox extends StatefulWidget {
   levelCombox({Key? key,this.onChanged,this.selected}) : super(key: key);
   String? selected=null;
   Function(String?)? onChanged;

  @override
  _levelComboxState createState() => _levelComboxState();
}


class _levelComboxState extends State<levelCombox> {
  @override
void initState()  {

    // Provider.of<level_vm>(context,listen: false).listoflevel;

    WidgetsBinding.instance?.addPostFrameCallback((_) {

      Provider.of<level_vm>(context,listen: false).getlevel();
    });
  super.initState();

}
  @override
  void didChangeDependencies() {
    //Provider.of<RegistrationHelper>(context, listen: false).getAccountId();'
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {

      print("init level combox");
      print( Provider.of<level_vm>(context,listen: false).selectedValueLevel);

  return
      Padding(
          padding: const EdgeInsets.all(10),
          child: _levelcombo(context)
          // (data !=null)?
          // ( (data as  List<LevelModel>).isEmpty ? Text("لا يوجد بيانات")
          //     :  _levelcombo(context))
          //
          //     :Text("error")

      );
  }

  Widget _levelcombo(context) {

    //List<LevelModel> _list=Provider.of<level_vm>(context,listen: true).listoflevel;
    print("build combox level");

    return  Consumer<level_vm>(
        builder: (context,levellist,child){
      if(levellist.listoflevel.isEmpty)
        return  Text("لا يوجد بيانات");
      else{
        print("inside else");
        print( Provider.of<level_vm>(context,listen: false).selectedValueLevel);

        return Container(
        child:DropdownButton(
          isExpanded: true,
          hint: Text("حدد الصلاحية"),
          items: levellist.listoflevel.map((level_one) {
            return DropdownMenuItem(
              child: Text(level_one.nameLevel), //label of item
              value: level_one.idLevel.toString(), //value of item
            );
          }).toList(),
          value:  Provider.of<level_vm>(context,listen: false).selectedValueLevel, //select_dataItem!.idCountry ,
          onChanged:(value){

            Provider.of<level_vm>(context,listen: false).changeVal(value.toString());
            print(Provider.of<level_vm>(context,listen: false).selectedValueLevel);
          },
        ),


      );

      }
    });
     //return Text("error");
  }
}
