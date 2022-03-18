



import 'package:crm_smart/model/regoin_model.dart';
import 'package:crm_smart/ui/widgets/levelcombox.dart';
import 'package:crm_smart/view_model/country_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegoinCombox extends StatefulWidget {
  RegoinCombox({Key? key,this.onChanged,this.selected}) : super(key: key);
  String? selected=null;
  Function(String?)? onChanged;

  @override
  _RegoinComboxState createState() => _RegoinComboxState();
}

class _RegoinComboxState extends State<RegoinCombox> {

  List<RegoinModel> _list=[];
  @override
  void initState()  {
    String id_country=Provider.of<country_vm>(context,listen: false).id_country;

   Provider.of<regoin_vm>(context,listen: false).getregoin(id_country);

    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    return
        Padding(
          padding: const EdgeInsets.all(10),
          child:citycombo(context)
            //   (data !=null)?
            //   ( (data as  List<RegoinModel>).isEmpty ? Text("لا يوجد مناطق")
            //       :  citycombo(context))
            //
            // :Text("error")


    );
  }

 Widget  citycombo(context){
   _list= Provider.of<regoin_vm>(context,listen: true).listregoin;
   if(_list.isEmpty)
     return  Text("لا يوجد بيانات");
   else{
   return Container(
     child:DropdownButton(
       isExpanded: true,
       hint: Text("حددالمنطقة"),
       items: _list.map((level_one){
         return DropdownMenuItem(

           child: Text(level_one.name_regoin), //label of item
           value: level_one.id.toString(), //value of item
         );
       }).toList(),
       value:Provider.of<regoin_vm>(context,listen: false).selectedValueLevel,//select_dataItem!.idCountry ,
       onChanged:(value){
         Provider.of<regoin_vm>(context,listen: false).changeVal(value.toString());
       },
     ),


   );}
 }
}