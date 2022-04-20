import 'package:crm_smart/model/calendar/event.dart';
import 'package:flutter/cupertino.dart';

class EventProvider extends ChangeNotifier {
  final List<Event> _events = [];

  List<Event> get events => _events;
  DateTime _selectDate = DateTime.now();
  DateTime get selectDate => _selectDate;
  void setDate(DateTime date) => _selectDate = date;
//when click this date show events المرتبيط for this date just
  List<Event> get eventsOfSelectedDate => _events;

  void addEvents(Event event) {
    _events.add(event);
    notifyListeners();
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
