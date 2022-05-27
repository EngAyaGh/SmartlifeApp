import 'package:crm_smart/ui/screen/home/ticket/ticket_all.dart';
import 'package:crm_smart/ui/screen/home/ticket/ticketadd.dart';
import 'package:crm_smart/ui/screen/home/ticket/ticketview.dart';
import 'package:crm_smart/ui/screen/search/search_container.dart';
import 'package:crm_smart/ui/widgets/custom_widget/card_expansion.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/ticket_vm.dart';
import 'package:crm_smart/view_model/typeclient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:provider/provider.dart';
import '../../../../constants.dart';

class ticketclientview extends StatefulWidget {
  const ticketclientview({Key? key}) : super(key: key);

  @override
  _ticketclientviewState createState() => _ticketclientviewState();
}

class _ticketclientviewState extends State<ticketclientview> {

  late String typepayController;

  @override void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_){
      Provider.of<ticket_vm>(context, listen: false)
        .getticket();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('تذاكر العميل'),
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.all(2),
            child: ListView(
              children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            kMainColor)),
                    onPressed: () async{
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>
                              ticketAdd(
                                fk_client: null,
                              )));
                    },
                    child: Text(' فتح تذكرة دعم ')),
              ) ,

                SizedBox(height: 2,),
                search_widget(
                  'ticket',
                  "المؤسسة ,العميل , رقم الهاتف....",),
                Consumer<ticket_vm>(
                    builder: (context, selectedProvider, child){
                      return  GroupButton(
                          controller: GroupButtonController(
                            selectedIndex:selectedProvider.selectedtypeticket,
                          ),
                          options: GroupButtonOptions(
                            selectedColor: kMainColor,
                              buttonWidth: 110,
                              borderRadius: BorderRadius.circular(10)),
                          buttons: ['مغلقة','مستلمة','جديدة'],
                          onSelected: (index,isselected){
                            print(index);
                            //setState(() {
                            typepayController=index.toString();
                            selectedProvider.changeticket(index);
                            getfilter();
                            //});
                          }
                      );
                    }
                ),
                SizedBox(height: 2,),
                Container(
                  height: MediaQuery.of(context).size.height*0.75,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8,right: 8,
                        top:8.0,bottom: 20),
                    child:
                    Consumer<ticket_vm>(builder: (context, value, child) {
                      return value.tickesearchlist.length==0?
                      Text(''):Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: value.tickesearchlist.length,
                                itemBuilder: (context, index) {

                                  return SingleChildScrollView(
                                      child: Padding(
                                        padding: const EdgeInsets.all(2),
                                        child:
                                        buildcardExpansion(
                                            'تاريخ فتح التذكرة  '+
                                                value.tickesearchlist[index].dateOpen,
                                            value.tickesearchlist[index].nameEnterprise ,
                                            TicketView(
                                              ticketModel: value.tickesearchlist[index],
                                              //idinvoice: listinvoice[index].idInvoice,

                                            ))
                                      ));
                                }),
                          ),
                        ],
                      );
                    }) ,
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  void getfilter() {
    Provider.of<ticket_vm>(context,listen: false).
    gettypeticket_filter(typepayController);

  }
}
