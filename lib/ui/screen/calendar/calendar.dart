import 'package:crm_smart/constants.dart';
import 'package:crm_smart/ui/screen/calendar/Event_editing_page.dart';
import 'package:crm_smart/ui/widgets/widget%20calendar/calendar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
        centerTitle: true,
        backgroundColor: kMainColor,
      ),
      body: CalendarWidget(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kMainColor,
        onPressed: () {
          Get.to(EventEditingPage());
        },
        tooltip: 'إضافة تقويم',
        child: Icon(Icons.add),
      ),
    );
  }
}
