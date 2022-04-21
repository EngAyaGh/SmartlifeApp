import 'package:crm_smart/ui/widgets/customformtext.dart';
import 'package:flutter/material.dart';
import 'package:crm_smart/constants.dart';

void show(
    {required BuildContext context,
    required TextEditingController dateText,
    required TextEditingController timeText,
    required TextEditingController nameText,
    required TextEditingController noteText}) {
  showDialog(
      context: context,
      barrierDismissible: false,
      useSafeArea: false,
      builder: (BuildContext context) {
        var kMainColor;
        return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                height: 600,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        color: Colors.blue,
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'تعديل الموعد',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                              IconButton(
                                onPressed: () {
                                  CloseButton();
                                },
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        )),
                    Container(
                      height: 500,
                      padding: EdgeInsets.only(top: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 50),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 350,
                                  child: CustomFormField(
                                    radius: 15,
                                    maxline: 1,
                                    vaild: (value) {
                                      // if (value!.isEmpty) {
                                      //   return 'Please enter a  name of product ';
                                      // }
                                    },
                                    con: dateText,
                                    label: 'تاريخ الموعد',
                                    hintText: '15/10/2022',
                                    readOnly: false,
                                    onChanged: (val) {
                                      // nameprod = val;
                                    },
                                    iconSuffix: Icons.schedule,
                                    iconButton: IconButton(
                                      disabledColor: Colors.transparent,
                                      onPressed: () {},
                                      icon: Icon(Icons.schedule),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  width: 300,
                                  child: InkWell(
                                    onTap: () {},
                                    child: CustomFormField(
                                      radius: 15,
                                      maxline: 1,
                                      vaild: (value) {
                                        // if (value!.isEmpty) {
                                        //   return 'Please enter a  name of product ';
                                        // }
                                      },
                                      iconSuffix: Icons.time_to_leave,
                                      con: timeText,
                                      label: 'وقت الموعد',
                                      hintText: '20:00',
                                      readOnly: true,
                                      onChanged: (val) {
                                        // nameprod = val;
                                      },
                                      iconButton: IconButton(
                                        disabledColor: Colors.transparent,
                                        onPressed: () {},
                                        icon: Icon(Icons.time_to_leave),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  width: 300,
                                  child: CustomFormField(
                                    radius: 15,
                                    maxline: 1,
                                    vaild: (value) {
                                      // if (value!.isEmpty) {
                                      //   return 'Please enter a  name of product ';
                                      // }
                                    },
                                    con: nameText,
                                    label: 'العميل ',
                                    hintText: 'اسماء العملاء',
                                    readOnly: false,
                                    onChanged: (val) {
                                      // nameprod = val;
                                    },
                                    iconButton: IconButton(
                                      disabledColor: Colors.transparent,
                                      onPressed: () {},
                                      icon: Icon(Icons.time_to_leave),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  width: 300,
                                  child: CustomFormField(
                                    radius: 15,
                                    maxline: 4,
                                    vaild: (value) {
                                      // if (value!.isEmpty) {
                                      //   return 'Please enter a  name of product ';
                                      // }
                                    },
                                    con: noteText,
                                    label: 'ملاحظات ',
                                    hintText: ' ',
                                    readOnly: false,
                                    onChanged: (val) {
                                      // nameprod = val;
                                    },
                                  ),
                                ),
                                SizedBox(height: 30),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 50, right: 50, top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.blue)),
                                    onPressed: () {},
                                    child: Text('حفظ',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20))),
                                TextButton(
                                    onPressed: () {},
                                    child: Text('إلغاء',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20))),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
      });
}
