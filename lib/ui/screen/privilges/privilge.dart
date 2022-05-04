


import 'package:crm_smart/ui/widgets/container_boxShadows.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:grouped_list/grouped_list.dart';
import '../../../constants.dart';

class privilge_page extends StatefulWidget {
   privilge_page({required this.fk_level,Key? key}) : super(key: key);
String fk_level;
  @override
  _privilge_pageState createState() => _privilge_pageState();
}

class _privilge_pageState extends State<privilge_page> {
  List _elements = [
    {'name': 'John', 'group': 'Team A'},
    {'name': 'Will', 'group': 'Team B'},
    {'name': 'Beth', 'group': 'Team A'},
    {'name': 'Miranda', 'group': 'Team B'},
    {'name': 'Mike', 'group': 'Team C'},
    {'name': 'Danny', 'group': 'Team C'},
  ];
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
        // StickyGroupedListView<CustomObject, DateTime>(
        //   elements: pedidos,
        //   order: StickyGroupedListOrder.ASC,
        //   groupBy: (CustomObject element) => DateTime(
        //       element.dateGroup.year,
        //       element.dateGroup.month,
        //       element.dateGroup.day),
        //   groupSeparatorBuilder: (CustomObject element) =>
        //       renderDataCabecalho(element),
        //   itemBuilder: (context, element) {
        //     return _buildPedidoItemView(element, context);
        //   },
        // ),
        padding: const EdgeInsets.all(16.0),
        child:GroupedListView<dynamic, String>(
          elements: _elements,
          groupBy: (element) => element['group'],
          groupComparator: (value1, value2) => value2.compareTo(value1),
          itemComparator: (item1, item2) =>
              item1['name'].compareTo(item2['name']),
          order: GroupedListOrder.DESC,
          useStickyGroupSeparators: true,
          groupSeparatorBuilder: (String value) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          itemBuilder: (c, element) {
            return Card(
              elevation: 8.0,
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: Container(
                child: ListTile(
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  leading: Icon(Icons.account_circle),
                  title: Text(element['name']),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
            );
          },
        ),
      // ),
        // ContainerShadows(
        //   margin: EdgeInsets.only(),
        //   child: Column(
        //     children: [
        //       RowEdit(name: 'المبيعات', des: ''),
        //       Consumer<privilge_vm>(
        //           builder: (context, cart, child){
        //            return Expanded(
        //              child: ListView(
        //                 children: cart.privilgelist.map(( key) {
        //
        //                   return new CheckboxListTile(
        //                     title: new Text(key.name_privilege),
        //                     value:   key.isCheck=='1'?true:false,// as bool,
        //                     onChanged: (bool? value) {
        //                       setState(() {
        //                         print(value);
        //                         value ==true? key.isCheck="1": key.isCheck="0";
        //                         //values[key] = value;
        //                       });
        //                      },
        //                   );
        //                 }).toList(),
        //               ),
        //            );
        //           }),
        //       RowEdit(name: 'الدعم الفني', des: ''),
        //       Consumer<privilge_vm>(
        //           builder: (context, cart, child){
        //             return Expanded(
        //               child: ListView(
        //                 children: cart.privilgelist.map(( key) {
        //                   return new CheckboxListTile(
        //                     title: new Text(key.name_privilege),
        //                     value:   key.isCheck=='1'?true:false,// as bool,
        //                     onChanged: (bool? value) {
        //                       setState(() {
        //                         print(value);
        //                         value ==true? key.isCheck="1": key.isCheck="0";
        //                         //values[key] = value;
        //                       });
        //                     },
        //                   );
        //                 }).toList(),
        //               ),
        //             );
        //           }),
        //       RowEdit(name: 'العناية بالعملاء', des: ''),
        //       Consumer<privilge_vm>(
        //           builder: (context, cart, child){
        //             return Expanded(
        //               child: ListView(
        //                 children: cart.privilgelist.map(( key) {
        //                   return new CheckboxListTile(
        //                     title: new Text(key.name_privilege),
        //                     value:   key.isCheck=='1'?true:false,// as bool,
        //                     onChanged: (bool? value) {
        //                       setState(() {
        //                         print(value);
        //                         value ==true? key.isCheck="1": key.isCheck="0";
        //                         //values[key] = value;
        //                       });
        //                     },
        //                   );
        //                 }).toList(),
        //               ),
        //             );
        //           }),
        //       RowEdit(name: 'الإدارة', des: ''),
        //
        //       RowEdit(name: 'التحصيل', des: ''),
        //
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
