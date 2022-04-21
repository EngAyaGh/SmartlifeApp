import 'package:crm_smart/constants.dart';
import 'package:crm_smart/ui/widgets/row_widget.dart';
import 'package:flutter/material.dart';

class ShowAppointment extends StatelessWidget {
  final int index;
  final String title;
  final List list;
  const ShowAppointment(
      {required this.index, required this.list, required this.title, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: double.infinity,
                height: 150,
                color: kMainColor,
                child: Padding(
                    padding: const EdgeInsets.only(right: 50, top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ))),
            SizedBox(
              height: 50,
            ),
            Container(
              padding: EdgeInsets.only(right: 50),
              child: Column(
                children: [
                  row(name: 'العميل :', desc: list[1], date: ''),
                  SizedBox(height: 10),
                  row(name: 'تاريخ الموعد :', desc: list[0], date: '15/1/2022'),
                  SizedBox(height: 10),
                  row(name: 'اسم الموظف :', desc: list[2], date: ''),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget row({required String name, required String desc, String? date}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          desc,
          style: TextStyle(
            color: kMainColor,
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          date!,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
