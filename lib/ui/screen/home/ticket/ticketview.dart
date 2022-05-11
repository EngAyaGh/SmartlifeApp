import 'package:crm_smart/model/ticketmodel.dart';
import 'package:crm_smart/ui/screen/client/transfer_client.dart';
import 'package:crm_smart/ui/screen/home/ticket/ticketadd.dart';
import 'package:crm_smart/ui/widgets/custom_widget/RowWidget.dart';
import 'package:crm_smart/view_model/ticket_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../constants.dart';

class TicketView extends StatefulWidget {
   TicketView({ required this.ticketModel, Key? key}) : super(key: key);

   TicketModel ticketModel;
  @override
  _TicketViewState createState() => _TicketViewState();
}

class _TicketViewState extends State<TicketView> {
  @override void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          cardRow(title: 'اسم المؤسسة',value:widget.ticketModel.nameEnterprise.toString()),
          cardRow(title: 'المدينة',value: widget.ticketModel.nameRegoin.toString()),
          cardRow(title: 'قام بفتح التذكرة ',value:  widget.ticketModel.nameuseropen.toString()),
          cardRow(title: 'تاريخ فتح التذكرة ',value:  widget.ticketModel.dateOpen.toString()),
          cardRow(title: 'حالة التذكرة',value: widget.ticketModel.typeTicket.toString()),
          cardRow(title: 'وصف المشكلة',value: widget.ticketModel.detailsProblem.toString()),
          cardRow(title: 'نوع المشكلة',value: widget.ticketModel.typeProblem.toString()),

          widget.ticketModel.dateRecive!=null?
          cardRow(title: 'قام باستلام التذكرة ',value:  widget.ticketModel.nameuserrecive.toString()):Container(),
          widget.ticketModel.dateRecive!=null?
          cardRow(title: 'تاريخ استلام التذكرة ',value:  widget.ticketModel.dateRecive.toString()):Container(),
          widget.ticketModel.dateClose!=null?
          cardRow(title: 'قام بإغلاق التذكرة ',value:  widget.ticketModel.nameuserclose.toString()):Container(),
          widget.ticketModel.dateClose!=null?
          cardRow(title: 'تاريخ إغلاق التذكرة ',value:  widget.ticketModel.dateClose.toString()):Container(),
          SizedBox(height: 15,),
    widget.ticketModel.dateRecive!=null &&  widget.ticketModel.dateClose==null?
    Padding(
    padding: const EdgeInsets.all(6.0),
    child: Center(
    child:   ElevatedButton(
    style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(
    kMainColor)),
    onPressed: () {

    Navigator.push(context,MaterialPageRoute(
    builder: (context)=>transferClient(
    name_enterprise:   widget.ticketModel.nameEnterprise.toString(),
    idclient:    widget.ticketModel.fkClient.toString(),
      idticket:widget.ticketModel.idTicket,
    type: "ticket",),fullscreenDialog: true

    ));
    },
    child: Text('تحويل العميل'),
    ))):Container(),
          widget.ticketModel.dateRecive==null?  ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      kMainColor)),
              onPressed: () async{
               Provider.of<ticket_vm>(context,listen: false)
                   .updateTicketvm({
                 'fk_user_recive':Provider.of<user_vm_provider>
                   (context,listen: false).currentUser!.idUser.toString(),
                     'date_recive':DateTime.now().toString(),
                    'type_ticket':'قيد التنفيذ'

               },  widget.ticketModel.idTicket);
              },
              child: Text('استلام التذكرة'))
             : ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      kMainColor)),
              onPressed: () async{
                Provider.of<ticket_vm>(context,listen: false)
                    .updateTicketvm({
                  'fk_user_close':Provider.of<user_vm_provider>
                    (context,listen: false).currentUser!.idUser.toString(),
                  'date_close':DateTime.now().toString(),
                  'type_ticket':'مغلقة '
                },  widget.ticketModel.idTicket);
              },
              child: Text('اغلاق التذكرة'))
        ],
      ),
    );
  }
}
