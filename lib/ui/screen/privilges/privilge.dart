


import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
        child: Consumer<privilge_vm>(
            builder: (context, cart, child){
             return ListView(
                children: cart.privilgelist.map(( key) {
                  return new CheckboxListTile(
                    title: new Text(key.name_privilege),
                    value:   key.isCheck as bool,
                    onChanged: (bool? value) {
                      key.isCheck=value as String;
                    //   setState(() {
                    //    print('');
                    //     //values[key] = value;
                    //   });
                     },
                  );
                }).toList(),
              );
            }),
          ),
        ],
      ),
    );
  }
}
