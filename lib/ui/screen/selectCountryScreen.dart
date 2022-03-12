import 'dart:convert';

import 'package:crm_smart/model/Error_model.dart';
import 'package:crm_smart/model/countrymodel.dart';
import 'package:crm_smart/model/regoin_model.dart';
import 'package:crm_smart/services/RegoinServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
//import http package manually

class select_country extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyDropDown();
  }
}

class _MyDropDown extends State<select_country>{


  late List<CountryModel> Countrylist=[];
 late CountryModel? select_dataItem=null;
 String _selected="1";
  var data;
  List<String> _states = ["Choose a state"];
  List<String> _lgas = ["Choose .."];
  String _selectedState = "Choose a state";
 late String? _selectedLGA = null;
  bool _isLoading = false;

  //we make list of strings with the name of countries

  // do not use http://localhost/ for your local machine, Android emulation do not recognize localhost
  // insted use your local ip address or your live URL,
  // hit "ipconfig" on Windows or "ip a" on Linux to get IP Address


  @override
  void initState()  {
    Countrylist=[];
    print("jghkjlkjlkjljl");
   // getCountryAll();

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
           title:Text(""),
          backgroundColor: Colors.lightBlue,),

        body:Container(
          padding:EdgeInsets.all(30),
          child: Column(
              children:<Widget>[

    FutureBuilder<List<CountryModel>>(
        initialData: Countrylist,
    future:getCountryAll(),
    builder: (BuildContext, Countrylist){
    if (Countrylist.data != null) {
      print("bb Countrylist.data is "+select_dataItem!.nameCountry);
      return Container( //wrapper for Country list
                    child:DropdownButton(
                      isExpanded: true,
                      //value:"",//Countrylist[0].nameCountry,
                      hint: Text("Select Country"),
                      items: Countrylist.data!.map((countryone){
                        return DropdownMenuItem(
                          child: Text(countryone.nameCountry), //label of item
                          value: countryone.idCountry.toString(), //value of item
                        );
                      }).toList(),
                      value:_selected, //select_dataItem!.idCountry ,

                      onChanged: (value) {
                        _onSelectedState(value.toString());
                       // FocusScope.of(context).requestFocus(new FocusNode());

                        // setState(() {
                        //   _selected=value.toString();
                        //  // select_dataItem = value as CountryModel;
                        //
                        // });
                        // if( value!=null||value.toString().isNotEmpty) {
                        //   print(value);
                        //   print("hhhh" + value.toString());
                        //
                        //   data = await RegoinService()
                        //       .getRegoinByCountry(
                        //       int.parse(value.toString()));
                        // }

                      },
                    ),

                  );}
                   if(Countrylist.data == null){
               return Text("No Data");
        }
            return CircularProgressIndicator();
        }
                ),
                _isLoading
                    ? CircularProgressIndicator()
                    :
                Container( //wrapper for City list
                  margin: EdgeInsets.only(top:30),
                  child:buildCity(),

                  //if there is error then show error message,
                  //else check if data is null,
                  //if not then show city list,

                )
              ]
          ),
        )
    );
  }
  void _onSelectedState(String value) async {
    setState(() {
      _selectedLGA = null;
      _selected = value;
      _lgas = ["Choose .."];
      _isLoading = true;
    });

    if( value!=null&&value.toString().isNotEmpty) {
        print(value);
        print("hhhh" + value.toString());

        data = await RegoinService()
            .getRegoinByCountry(
            int.parse(value.toString()));
      }
    setState(() {
      _isLoading = false;
    });
  }

  void _onSelectedLGA(String value) {
    setState(() => _selectedLGA = value);
  }

Widget buildCity(){
  if(data !=null){
    // return (data is ErrorModel ) != null?
    // Text((data as ErrorModel).message.toString())
    //     :
    return     (data as  List<RegoinModel>).isEmpty ?
    Text("لا يوجد مناطق"):
    cityList();
  }else {
    return Text("Choose Country please");
  }
}
  Widget cityList(){ //widget function for city list
    List<RegoinModel> citylist =[];
    if(data != null)
   {
     citylist=data as List<RegoinModel>;
      return DropdownButton(
          hint: Text("Select City"),
          isExpanded: true,
          items: citylist.map((cityOne){
            return DropdownMenuItem(
              child: Text(""+cityOne.name_regoin),
              value: cityOne.id.toString(),
            );
          }).toList(),
          value: _selectedLGA,
          onChanged: (value){
            _onSelectedLGA(value.toString());
          }
      );
    }else{
      return Text("data");

    }
    // List<RegoinModel>.from(
    //     data["data"].map((i)
    //     {
    //       return RegoinModel.fromJSON(i);
    //     })
    // ); //searilize citylist json data to object model.


  }

 Future < List<CountryModel>> getCountryAll()async {

    Countrylist=(await RegoinService().getAllCountry())!;
    select_dataItem=Countrylist[0];
    print(Countrylist.length);//default country
    return Countrylist;
  }
}