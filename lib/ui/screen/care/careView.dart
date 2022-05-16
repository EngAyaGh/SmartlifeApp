

import 'package:crm_smart/model/communication_modle.dart';
import 'package:crm_smart/model/ticketmodel.dart';
import 'package:crm_smart/ui/screen/home/ticket/ticketadd.dart';
import 'package:crm_smart/ui/screen/home/ticket/ticketview.dart';
import 'package:crm_smart/ui/widgets/custom_widget/RowWidget.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_widget.dart';
import 'package:crm_smart/view_model/communication_vm.dart';
import 'package:crm_smart/view_model/ticket_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
class careView extends StatefulWidget {
   careView({required this.fk_client,Key? key}) : super(key: key);
  String fk_client;

  @override
  _careViewState createState() => _careViewState();
}
class _careViewState extends State<careView> {
  List<CommunicationModel> listCommunication=[];
  List<TicketModel> listticket_client=[];

  @override void initState() {
    // Provider.of<communication_vm>(context, listen: false)
    //     .getCommunication(widget.fk_client);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    listCommunication=Provider.of<communication_vm>(context, listen: true)
        .listCommunication;

    listticket_client= Provider.of<ticket_vm>(context, listen: true)
        .listticket_client;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.6,
              child: GroupedListView<CommunicationModel, String>(
                elements:  listCommunication,
                groupBy: (element) {
                  switch(element.typeCommuncation)
                  {
                    case 'ترحيب':
                      return 'ترحيب';

                    case 'تركيب':
                      return 'تركيب';

                    case 'دوري':
                      return 'الربع الأول';

                    // case 'support':
                    //   return 'الدعم الفني';
                  }
                  return '';
                },
                groupComparator: (value1, value2) => value2.compareTo(value1),
                itemComparator: (item1, item2) => item1.typeCommuncation!.
                compareTo(item2.typeCommuncation.toString()),
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
                  return Container(

                    //children: _privilgelist.map(( key) {
                      child:
                          Column(
                            children: [
                              element.typeCommuncation=='ترحيب'?
                              cardRow(title:'تم الترحيب من قبل' ,value:element.nameUser ,):Container(),
                              element.typeCommuncation=='ترحيب'?
                              cardRow(title:'تاريخ الترحيب بالعميل' ,value: element.dateCommunication.toString(),):Container(),


                              element.typeCommuncation=='تركيب'?
                              cardRow(title:'تم التأكد من جودة التركيب من قبل' ,value:element.nameUser ,):Container(),
                              element.typeCommuncation=='تركيب'?
                              cardRow(title:'تاريخ التأكد من التركيب للعميل' ,value: element.dateCommunication.toString(),):Container(),
                              element.typeCommuncation=='تركيب'?
                              cardRow(title:' نتيجة التواصل' ,value: element.result.toString(),):Container(),


                              element.typeCommuncation=='دوري'?
                              cardRow(title:'موظف التقييم' ,value:element.nameUser ,):Container(),
                              element.typeCommuncation=='دوري'?
                              cardRow(title:'تاريخ التقييم' ,value: element.dateCommunication.toString(),):Container(),
                              element.typeCommuncation=='دوري'?
                              cardRow(title:'مستوى التقييم' ,value: element.rate.toString(),):Container(),


                            ],
                          )

                  );

                },
              ),
            ),

            Container(
                height: MediaQuery.of(context).size.height*0.4,
                child:
                Column(
                  children: [
                    SizedBox(height: 16,) ,
                    Provider.of<ticket_vm>(context,listen: true)
                        .listticket_client.isEmpty?
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                kMainColor)),
                        onPressed: () async{
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=>
                                  ticketAdd(fk_client: widget.fk_client.toString(),)));
                        },
                        child: Text(' فتح تذكرة دعم '))
                        : ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                kMainColor)),
                        onPressed: () async{
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=>
                                  TicketView(
                                      ticketModel:
                                      Provider.of<ticket_vm>(context,listen: true)
                                          .listticket_client[0]
                                  )));
                        },
                        child: Text('تذاكر العميل')) ,
                  ],
                )
              ),
            // Provider.of<ticket_vm>(context,listen: true)
            //     .listticket_client.isEmpty?
            // ElevatedButton(
            //     style: ButtonStyle(
            //         backgroundColor: MaterialStateProperty.all(
            //             kMainColor)),
            //     onPressed: () async{
            //       Navigator.push(context,
            //           MaterialPageRoute(builder: (context)=>
            //               ticketAdd(fk_client: widget.fk_client.toString(),)));
            //     },
            //     child: Text(' فتح تذكرة دعم '))
            //     : ElevatedButton(
            //     style: ButtonStyle(
            //         backgroundColor: MaterialStateProperty.all(
            //             kMainColor)),
            //     onPressed: () async{
            //       Navigator.push(context,
            //           MaterialPageRoute(builder: (context)=>
            //               TicketView(
            //                   ticketModel:
            //                   Provider.of<ticket_vm>(context,listen: true)
            //                       .listticket_client[0]
            //               )));
            //     },
            //     child: Text('تذاكر العميل')) ,
          ],
        ),

      ),
    );
  }
}
