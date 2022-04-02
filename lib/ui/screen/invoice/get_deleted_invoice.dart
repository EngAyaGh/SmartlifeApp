

//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class deletedinvoice extends StatefulWidget {
  const deletedinvoice({Key? key}) : super(key: key);

  @override
  _deletedinvoiceState createState() => _deletedinvoiceState();
}

class _deletedinvoiceState extends State<deletedinvoice> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      body:Padding(
        padding: const EdgeInsets.only(left:20,right: 20,top: 10,bottom: 10),
        child: Container(
          height: MediaQuery
              .of(context)
              .size
              .height *0.95,
          child: ListView.separated(
            itemCount: listinvoice.length,
            separatorBuilder: (BuildContext context, int index) => const Divider(),
            itemBuilder: (BuildContext context, int index)=>
                Builder(builder:
                    (context)=>
                    CardInvoiceClient(
                      itemProd: listinvoice[index],
                      itemClient :  widget.itemClient,
                      //scaffoldKey: _scaffoldKey,
                      indexinvoice: index,)) ,
            //     _listProd.map(
            //         (item) => Builder(builder: (context)=>CardProduct( itemProd: item,)) ,
            // ).toList(),
          ),
        ),
      ) ,

    );
  }
}
