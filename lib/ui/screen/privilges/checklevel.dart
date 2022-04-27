

import 'package:crm_smart/model/levelmodel.dart';
import 'package:crm_smart/model/privilgemodel.dart';
import 'package:crm_smart/ui/screen/privilges/privilge.dart';
import 'package:crm_smart/view_model/level_vm.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class check_level extends StatefulWidget {
  const check_level({Key? key}) : super(key: key);

  @override
  _check_levelState createState() => _check_levelState();
}

class _check_levelState extends State<check_level> {
  @override void initState() {
    Provider.of<level_vm>
      (context,listen: false).getlevel();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   List<LevelModel> _listlevel= Provider.of<level_vm>
     (context,listen: true).listoflevel;
    return Scaffold(
      body: SingleChildScrollView(

        child:Padding(
          padding: EdgeInsets.all(15),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: _listlevel.length,
            itemBuilder: (BuildContext context, int index) =>
                Builder(
                    builder: (context) =>

                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                               decoration: BoxDecoration(
                                 color: Colors.white,
                                 boxShadow: <BoxShadow>[
                                   BoxShadow(
                                     offset: Offset(1.0, 1.0),
                                     blurRadius: 8.0,
                                     color: Colors.black87.withOpacity(0.2),
                                   ),
                                 ],
                                 borderRadius: BorderRadius.all(Radius.circular(10)),
                               ),
                               child:
                               Center(
                                 child: InkWell(
                                   onTap: (){
                                     Navigator.push(context,
                                         MaterialPageRoute(
                                             builder: (context)=>privilge_page(

                                               fk_level: _listlevel[index].idLevel,
                                             )));
                                   },
                            child:  Container(
                              child: Padding(
                                   padding: EdgeInsets.all(15),
                                   child: Text(_listlevel[index].nameLevel),
                                 ),
                            ),
                             ),
                         ),
                       ),
                          )
                ),
            //     _listProd.map(
            //         (item) => Builder(builder: (context)=>CardProduct( itemProd: item,)) ,
            // ).toList(),
          ),
        )
      ),
    );
  }
}
