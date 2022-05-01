


import 'package:crm_smart/ui/widgets/container_boxShadows.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class privilge_page extends StatefulWidget {
   privilge_page({required this.fk_level,Key? key}) : super(key: key);
String fk_level;
  @override
  _privilge_pageState createState() => _privilge_pageState();
}

class _privilge_pageState extends State<privilge_page> {
  @override void initState() {
    super.initState();
  }
  @override void didChangeDependencies() {
    Provider.of<privilge_vm>(context,listen: false)
        .getPrivilge(widget.fk_level);

    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [

          IconButton(
              onPressed: (){
                for(int i=0;i< Provider.of<privilge_vm>(context,listen: false)
                .privilgelist.length;i++){
                  Provider.of<privilge_vm>(context,listen: false)
                      .updatepriv_vm(
                      Provider.of<privilge_vm>(context,listen: false)
                      .privilgelist[i].fkPrivileg,
                      Provider.of<privilge_vm>(context,listen: false)
                          .privilgelist[i].isCheck);
                }

                Navigator.pop(context);

              }, icon:Icon( Icons.check_rounded,color: kWhiteColor,)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ContainerShadows(
          margin: EdgeInsets.only(),
          child: Column(
            children: [
              Consumer<privilge_vm>(
                  builder: (context, cart, child){
                   return Expanded(
                     child: ListView(
                        children: cart.privilgelist.map(( key) {
                          return new CheckboxListTile(
                            title: new Text(key.name_privilege),
                            value:   key.isCheck=='1'?true:false,// as bool,
                            onChanged: (bool? value) {
                              setState(() {
                                print(value);
                                value ==true? key.isCheck="1": key.isCheck="0";
                                //values[key] = value;
                              });
                             },
                          );
                        }).toList(),
                      ),
                   );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
