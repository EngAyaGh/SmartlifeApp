import 'dart:js';

import 'package:crm_smart/constants.dart';
import 'package:crm_smart/constantsList.dart';
import 'package:crm_smart/model/schedule/menue_item.dart';
import 'package:crm_smart/ui/screen/schedulingClient/edit_appointment.dart';
import 'package:crm_smart/ui/screen/schedulingClient/show_appointment.dart';
import 'package:crm_smart/ui/screen/schedulingClient/show_dialoge.dart';
import 'package:crm_smart/ui/widgets/customformtext.dart';
import 'package:crm_smart/ui/widgets/text_form.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:get/get.dart';

class SchedulingClient extends StatelessWidget {
  SchedulingClient({Key? key}) : super(key: key);
  TextEditingController dateText = TextEditingController();
  TextEditingController timeText = TextEditingController();
  TextEditingController nameText = TextEditingController();
  TextEditingController noteText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Schedule 15/10/2022'),
        centerTitle: true,
        backgroundColor: kMainColor,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 40),
        child: ListView.builder(
            itemCount: listSchedule.length,
            itemBuilder: (context, index) {
              return buildSchedule(
                list: listSchedule[index],
                // time: time[index],
                index: index,
              );
            }),
      ),
    ));
  }

  Widget buildSchedule(
      {required List list,
      //required String time,
      required int index}) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
        bottom: 30,
      ),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: InkWell(
          onTap: () {},
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        list[0],
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Text(
                        list[1],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  PopupMenuButton<MenueItem>(
                    icon: Icon(
                      Icons.more_vert,
                      color: Colors.black54,
                    ),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: InkWell(
                          onTap: () {
                            Get.off(ShowAppointment(
                              index: index,
                              title: ' $indexعرض موعد',
                              list: list,
                            ));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.schedule),
                              Text(
                                'عرض الموعد',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      PopupMenuItem(
                          child: InkWell(
                        onTap: () {
                          show(
                              context: context,
                              dateText: dateText,
                              timeText: timeText,
                              noteText: noteText,
                              nameText: nameText);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.edit),
                            Text(
                              'تعديل الموعد',
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                        ),
                      )),
                    ],
                  ),
                  // IconButton(
                  //   onPressed: () {

                  //   },
                  //   // focusColor: kMainColor.withOpacity(0.2),
                  //   // color: kMainColor.withOpacity(0.2),
                  //   // highlightColor: Colors.transparent,
                  //   // disabledColor: Colors.transparent,
                  //   hoverColor: Colors.transparent,
                  //   splashColor: kMainColor.withOpacity(0.4),
                  //   icon: Icon(
                  //     Icons.more_vert,
                  //     color: Colors.black38,
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // void openDialoge() {
  //   FocusedMenuHolder(
  //       child: Container(
  //         decoration: BoxDecoration(
  //             border: Border.all(
  //               color: kMainColor,
  //             ),
  //             borderRadius: BorderRadius.circular(20)),
  //       ),
  //       onPressed: () {},
  //       openWithTap: true,
  //       duration: Duration(seconds: 0),
  //       animateMenuItems: false,
  //       menuItems: [
  //         FocusedMenuItem(
  //           title: Text('title'),
  //           onPressed: () {},
  //         ),
  //         FocusedMenuItem(
  //           title: Text('name'),
  //           onPressed: () {},
  //         )
  //       ]);
  // }
}
