import 'package:crm_smart/model/calendar/event_data_source.dart';
import 'package:crm_smart/ui/widgets/widget%20calendar/task_widget.dart';
import 'package:crm_smart/view_model/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final events = Provider.of<EventProvider>(context).events;
    return SfCalendar(
      view: CalendarView.month,
      dataSource: EventDataSource(events),
      initialSelectedDate: DateTime.now(),
      cellBorderColor: Colors.transparent,
      onTap: (details) {
        final provider = Provider.of<EventProvider>(context, listen: false);
        provider.setDate(details.date!);
        showModalBottomSheet(
            context: context, builder: (context) => TaskWidget());
      },
      // onLongPress: (details) {
      //   final provider = Provider.of<EventProvider>(context, listen: false);
      //   provider.setDate(details.date!);
      //   showModalBottomSheet(
      //       context: context, builder: (context) => TaskWidget());
      // },
    );
  }
}