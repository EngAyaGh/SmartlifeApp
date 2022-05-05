import 'package:crm_smart/model/calendar/event.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:flutter/cupertino.dart';

class EventProvider extends ChangeNotifier {
  final List<Event> _events = [];

  List<Event> get events => _events;
  DateTime _selectDate = DateTime.now();
  DateTime get selectDate => _selectDate;
  void setDate(DateTime date) => _selectDate = date;
//when click this date show events المرتبيط for this date just
  List<Event> get eventsOfSelectedDate => _events;
  List<InvoiceModel> listinvoices=[];

  void setvalue(List<InvoiceModel> list){
    listinvoices=list;
    notifyListeners();
  }

  void addEvents(Event event) {
    _events.add(event);
    notifyListeners();
  }

  Future<void> getevents()async{
     late Event event;//
     _events.clear();
     // =Event(fkIdClient: fkIdClient, title: title, description: description, from: from, to: to);
     listinvoices.forEach((element) {
        if(element.dateinstall_task!=null &&
            (
            element.isdoneinstall!=null ||
            element.isdoneinstall!='0')){
           print(element.dateinstall_task);
            event=Event(
              fkIdClient: element.fkIdClient,
              title: element.name_enterprise.toString(),
              description: 'description',
              from:   DateTime.parse(element.dateinstall_task.toString()),
              to:  DateTime.parse(element.dateinstall_task.toString()),
              idinvoice: element.idInvoice);
              addEvents(event);
        }
     });


  }
  void deleteEvent(Event event) {
    _events.remove(event);
    notifyListeners();
  }

  void editEvent(Event newEvent, Event oldEvent) {
    final index = _events.indexOf(oldEvent);
    _events[index] = newEvent;
    notifyListeners();
  }
}
