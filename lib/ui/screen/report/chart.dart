
import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/chartmodel.dart';
import 'package:crm_smart/provider/selected_button_provider.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as myui;
import '../../../constants.dart';

class BarChartAPI extends StatefulWidget {
  const BarChartAPI({Key? key}) : super(key: key);

  @override
  State<BarChartAPI> createState() => _BarChartAPIState();
}

class _BarChartAPIState extends State<BarChartAPI> {
  static const secondaryMeasureAxisId = 'secondaryMeasureAxisId';

  List<BarModel> salesresult = [];
  List<BarModel> salestempdataclientresult = [];
  bool loading = true;
  String type = 'userSum';
  String typeproduct = 'الكل';
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    setState(() {
      loading=true;
    });
    String fkcountry = Provider.of<user_vm_provider>(context, listen: false)
        .currentUser
        .fkCountry
        .toString();
    var data;
    String params='';
    if(typeproduct=='أجهزة') params='&product=0';
    if(typeproduct=='برامج') params='&product=1';
    switch (type) {
      case "userSum":
        data = await Api().post(
            url: url + "reports/reportsales.php?fk_country=$fkcountry$params",
            body: {'type': type});
        break;
      case "dateyear":
        data = await Api().post(
            url: url +
                "reports/reportsales.php?fk_country=$fkcountry&year=${_selectedDate.year.toString()}$params",
            body: {'type': type});
        break;
      case "datemonth":
        data = await Api().post(
            url: url +
                "reports/reportsales.php?fk_country=$fkcountry&month=${_selectedDatemonth.month.toString()}$params",
            body: {'type': type});
        break;
        case "datedays":
        data = await Api().post(
            url: url +
                "reports/reportsales.php?fk_country=$fkcountry&from=${_selectedDatefrom.toString()}&to=${_selectedDateto.toString()}$params",
            body: {'type': type});
        break;
    }

    //userSum
    //List<BarModel> tempdata = genderModelFromJson(data);
    List<BarModel> tempdata = [];
    List<BarModel> tempdataclient = [];

    for (int i = 0; i < data.length; i++) {
      tempdata.add(BarModel.fromJson(data[i]));
      print(tempdata[i].y);
      tempdataclient.add(BarModel.fromJson(data[i]));
    }
    setState(() {
      salesresult = tempdata;
      salestempdataclientresult = tempdataclient;
      loading = false;
    });
  }

  List<charts.Series<BarModel, String>> _createSampleData() {
    return [
      charts.Series<BarModel, String>(
        data: salesresult,
        id: 'المبيعات',
        // colorFn: (_, __) =>
        //
        //     // charts.ColorUtil.fromDartColor(
        //     // //    Colors.primaries[Random().nextInt(Colors.primaries.length)]
        //     //     Colors.primaries[Random().nextInt(Colors.primaries.length)]
        //     // ),
        //     charts.MaterialPalette.teal.shadeDefault,
          colorFn: (BarModel bar,_) =>charts.ColorUtil.fromDartColor(bar.colorval),
        // charts.MaterialPalette.indigo.shadeDefault,
        domainFn: (BarModel genderModel, _) => genderModel.x,
        measureFn: (BarModel genderModel, _) => double.parse(genderModel.y.toString()),
        labelAccessorFn:  (BarModel row, _) => '${row.y}',
      ),
      //   charts.Series<BarModel, String>(
      //     data: salesresult,
      //     id: 'العملاء',
      //     colorFn:   (_, __) =>
      //         // charts.ColorUtil.fromDartColor(
      //         //     Colors.primaries[Random().nextInt(Colors.primaries.length)]),
      //     //Colors.primaries[Random().nextInt(Colors.primaries.length)],//
      //      charts.MaterialPalette.blue.shadeDefault,//charts.MaterialPalette.indigo.shadeDefault,
      //     domainFn:  (BarModel genderModel, _) => genderModel.x,
      //     measureFn: (BarModel genderModel, _) => genderModel.y,
      //     displayName: "Income",
      // )..setAttribute(charts.measureAxisIdKey, secondaryMeasureAxisId),
    ];
  }

  DateTime _selectedDate = DateTime(1, 1, 1);
  DateTime _selectedDatemonth = DateTime(1, 1, 1);
  DateTime _selectedDatefrom = DateTime(1, 1, 1);
  DateTime _selectedDateto = DateTime(1, 1, 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("تقارير المبيعات"),
      ),
      body: Directionality(
        textDirection: myui.TextDirection.rtl,
        child: Column(children: [
          Expanded(
            child: Consumer<selected_button_provider>(
                builder: (context, selectedProvider, child) {
              return GroupButton(
                  controller: GroupButtonController(
                    selectedIndex: selectedProvider.isbarsales,
                  ),
                  options: GroupButtonOptions(
                      buttonWidth: 75, borderRadius: BorderRadius.circular(10)),
                  buttons: ['سنوي', 'ربعي', 'شهري', 'يومي'],
                  onSelected: (index, isselected) {
                    print(index);
                    switch(index){
                      case 0:
                        type='dateyear';
                        if(_selectedDate != DateTime(1, 1, 1) )
                          getData();
                        break;
                        case 2:
                        type='datemonth';
                        if(_selectedDatemonth != DateTime(1, 1, 1) )
                          getData();
                        break;
                        case 3:
                        type='datedays';
                        if(_selectedDatefrom != DateTime(1, 1, 1)&& _selectedDateto != DateTime(1, 1, 1))
                          getData();
                        break;

                    }


                    // datedays
                    //setState(() {
                    //typeinstallController=index.toString();
                    selectedProvider.selectValuebarsales(index);
                    //  });
                  });
            }),
          ),
          Expanded(
            child: Consumer<selected_button_provider>(
                builder: (context, selectedProvider, child) {
              return GroupButton(
                  controller: GroupButtonController(
                    selectedIndex: selectedProvider.isbarsalestype,
                  ),
                  options: GroupButtonOptions(
                      buttonWidth: 110,
                      borderRadius: BorderRadius.circular(10)),
                  buttons: ['الكل', 'أجهزة', 'برامج'],
                  onSelected: (index, isselected) {

                    print(index);
                    switch(index){
                      case 0:
                        typeproduct = 'الكل';
                        break;
                      case 1:
                        typeproduct = 'أجهزة';
                        break;
                      case 2:
                        typeproduct = 'برامج';
                        break;

                    }
                     getData();
                    //setState(() {
                    //typeinstallController=index.toString();
                    selectedProvider.selectValuebarsalestype(index);
                    //  });
                  });
            }),
          ),
          Provider.of<selected_button_provider>(context, listen: true)
                      .isbarsales == 0
              ? Flexible(
                  child: TextFormField(
                    validator: (value) {
                      if (_selectedDate == DateTime(1, 1, 1)) {
                        return 'يرجى تعيين التاريخ ';
                      }
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.date_range,
                        color: kMainColor,
                      ),
                      hintStyle: const TextStyle(
                          color: Colors.black45,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                      hintText: _selectedDate == DateTime(1, 1, 1)
                          ? 'السنة' //_currentDate.toString()
                          : DateFormat('yyyy').format(_selectedDate),
                      //_invoice!.dateinstall_task.toString(),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                    ),
                    readOnly: true,
                    onTap: () {

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Select Year"),
                            content: Container(
                              // Need to use container to add size constraint.
                              width: 300,
                              height: 300,
                              child: YearPicker(
                                firstDate: DateTime(DateTime.now().year - 3, 1),
                                lastDate:
                                    DateTime(DateTime.now().year + 100, 1),
                                initialDate: DateTime.now(),
                                // save the selected date to _selectedDate DateTime variable.
                                // It's used to set the previous selected date when
                                // re-showing the dialog.
                                selectedDate: _selectedDate,
                                onChanged: (DateTime dateTime) {
                                  setState(() {
                                    _selectedDate = dateTime;
                                  });

                                  // close the dialog when year is selected.
                                  Navigator.pop(context);
                                  getData();

                                  // Do something with the dateTime selected.
                                  // Remember that you need to use dateTime.year to get the year
                                },
                              ),
                            ),
                          );
                        },
                      );

                      // _selectDate(context, DateTime.now());
                    },
                  ),
                )
              : Provider.of<selected_button_provider>(context, listen: true)
              .isbarsales == 2
              ? Flexible(
            child: TextFormField(
              validator: (value) {
                if (_selectedDatemonth == DateTime(1, 1, 1)) {
                  return 'يرجى تعيين التاريخ ';
                }
              },
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.date_range,
                  color: kMainColor,
                ),
                hintStyle: const TextStyle(
                    color: Colors.black45,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
                hintText: _selectedDatemonth == DateTime(1, 1, 1)
                    ? 'الشهر' //_currentDate.toString()
                    : DateFormat('mm').format(_selectedDatemonth),
                //_invoice!.dateinstall_task.toString(),
                filled: true,
                fillColor: Colors.grey.shade200,
              ),
              readOnly: true,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Select month"),
                      content: Container(
                        // Need to use container to add size constraint.
                        width: 300,
                        height: 300,
                        child: MonthPicker(
                          firstDate: DateTime(DateTime.now().year-100, DateTime.now().month-1 ),
                          lastDate:
                          DateTime(DateTime.now().year+100, DateTime.now().month+1),
                          // : DateTime.now(),
                          // save the selected date to _selectedDate DateTime variable.
                          // It's used to set the previous selected date when
                          // re-showing the dialog.
                          selectedDate: _selectedDatemonth,
                          onChanged: (DateTime dateTime) {
                            setState(() {
                              _selectedDatemonth = dateTime;
                            });

                            // close the dialog when year is selected.
                            Navigator.pop(context);
                            getData();

                            // Do something with the dateTime selected.
                            // Remember that you need to use dateTime.year to get the year
                          },
                        ),
                      ),
                    );
                  },
                );

                // _selectDate(context, DateTime.now());
              },
            ),
          ): Provider.of<selected_button_provider>(context, listen: true)
              .isbarsales == 3
              ? Flexible(
                child: Row(
                   children: [
                    Flexible(
                      child: TextFormField(
                        validator: (value) {
                          if (_selectedDatefrom == DateTime(1, 1, 1)) {
                            return 'يرجى تعيين التاريخ ';
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.date_range,
                            color: kMainColor,
                          ),
                          hintStyle: const TextStyle(
                              color: Colors.black45,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          hintText: _selectedDatefrom == DateTime(1, 1, 1)
                              ? 'from' //_currentDate.toString()
                              : DateFormat('yyyy-MM-dd').format(_selectedDatefrom),
                          //_invoice!.dateinstall_task.toString(),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                        ),
                        readOnly: true,
                        onTap: () {
                          _selectDatefrom(context, DateTime.now());
                          if(_selectedDateto!=DateTime(1, 1, 1)&&_selectedDatefrom!=DateTime(1, 1, 1))
                            getData();

                          // _selectDate(context, DateTime.now());
                        },
                      ),
                    ),
                    Flexible(
                      child: TextFormField(
                        validator: (value) {
                          if (_selectedDateto == DateTime(1, 1, 1)) {
                            return 'يرجى تعيين التاريخ ';
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.date_range,
                            color: kMainColor,
                          ),
                          hintStyle: const TextStyle(
                              color: Colors.black45,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          hintText: _selectedDateto == DateTime(1, 1, 1)
                              ? 'to' //_currentDate.toString()
                              : DateFormat('yyyy-MM-dd').format(_selectedDateto),
                          //_invoice!.dateinstall_task.toString(),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                        ),
                        readOnly: true,
                        onTap: () {
                          _selectDateto(context, DateTime.now());
                          if(_selectedDateto!=DateTime(1, 1, 1)&&_selectedDatefrom!=DateTime(1, 1, 1))
                            getData();
                          // _selectDate(context, DateTime.now());
                        },
                      ),
                    ),
                ],),
              ): Container(),
          // Expanded(
          //   child: Padding(
          //     padding: const EdgeInsets.only(left: 8.0, right: 8),
          //     child: Consumer<maincity_vm>(
          //       builder: (context, cart, child) {
          //         return
          //           DropdownButton(
          //             isExpanded: true,
          //             hint: Text("المناطق"),
          //             items: cart.listmaincity.map((level_one) {
          //               return DropdownMenuItem(
          //                 child: Text(level_one.namemaincity),
          //                 //label of item
          //                 value: level_one
          //                     .id_maincity, //value of item
          //               );
          //             }).toList(),
          //             value: cart.selectedValuemanag,
          //             onChanged: (value) {
          //               //  setState(() {
          //               cart.changevalue(value.toString());
          //             },
          //           );
          //         //);
          //       },
          //     ),
          //   ),

          Center(
            child: loading
                ? CircularProgressIndicator()
                : Container(
                    height: 300, //BarChart
                    child: charts.BarChart(
                      _createSampleData(),
                      // barGroupingType: charts.BarGroupingType.grouped,
                      animate: true,
                      behaviors: [
                        // new charts.SeriesLegend()
                        new charts.DatumLegend(

                          outsideJustification:
                              charts.OutsideJustification.endDrawArea,
                          horizontalFirst: false,
                          desiredMaxRows: 2,
                          cellPadding: new EdgeInsets.only(
                              right: 4.0, bottom: 4.0, top: 4.0,left: 10),
                          entryTextStyle: charts.TextStyleSpec(
                              color: charts.MaterialPalette.purple.shadeDefault,
                              fontFamily: 'Georgia',
                              fontSize: 18),
                        )
                      ],
                      // defaultRenderer: new charts.ArcRendererConfig(
                      //     arcWidth: 100,
                      //     arcRendererDecorators: [
                      //       new charts.ArcLabelDecorator(
                      //           labelPosition: charts.ArcLabelPosition.inside)
                      //     ]),
                    ),
                  ),
          ),
        ]),
      ),
    );
  }

  Future<void> _selectDatefrom(BuildContext context, DateTime currentDate) async {
    DateTime? pickedDate = await showDatePicker(

        context: context,
        currentDate: currentDate,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(3010));
    if (pickedDate != null)
      setState(() {
        // Navigator.pop(context);
        _selectedDatefrom = pickedDate;
        print(_selectedDatefrom.toString());
      });
  }
  Future<void> _selectDateto(BuildContext context, DateTime currentDate) async {
    DateTime? pickedDate = await showDatePicker(
        // initialEntryMode: DatePickerEntryMode.calendarOnly,
        // initialDatePickerMode: DatePickerMode.,
        context: context,
        currentDate: currentDate,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(3010));
    if (pickedDate != null)
      setState(() {
        // Navigator.pop(context);
        _selectedDateto = pickedDate;
        print(_selectedDateto.toString());
      });
  }
}
