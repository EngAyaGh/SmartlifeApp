
import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/ui/screen/user/userview.dart';
import 'package:crm_smart/ui/widgets/client_widget/cardClient.dart';
import 'package:crm_smart/ui/widgets/client_widget/cardclientAccept.dart';
import 'package:crm_smart/ui/widgets/user_widget/carduserbuild.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class productSearchView extends StatelessWidget {

  String pattern;
  List<dynamic> list;
  productSearchView(this.pattern,this.list, {Key? key}) : super(key: key);

  //String get pattern => null;
 Widget _widgetCard(dynamic val){
   //ClientModel
   //UserModel
   //InvoiceModel
   //ProductsInvoice
   if(val is ClientModel )
  return cardClient(
     itemClient:
     val,//_listProductFilter.data![index],
    iduser: '',
  );
 if(val is UserModel)
   return buildCardUsers(
   usermodell: val,
   );
 if(val is InvoiceModel)
   return cardClientAccept(
     iteminvoice: val,
   );
return Text('');

 }
  @override
  Widget build(BuildContext context) {
    //List<productModel> _listProductFilter= Provider.of<ProductProvider>(context).products;
    return Scaffold(

        appBar: AppBar(
          /*actions:<Widget> [
          IconButton(
              onPressed:()=> Navigator.of(context).pop(),
              icon: Icon(Icons.arrow_back))
        ],*/
        ),
        body:
        FutureBuilder(
          //initialData: Provider.of<ProductProvider>(context).products,
          future: Provider.of<client_vm>(context)
              .searchProducts(pattern,list),
          builder: (BuildContext context,
              AsyncSnapshot<List<dynamic>> _listProductFilter)  {
            if (_listProductFilter.hasData == true) {
              //print("${pattern}");
              return  Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 3,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount:_listProductFilter.data!.length,
                      itemBuilder: (context, index) {
                        //print("i will print ${_ListProduct.data!.docs[index]}");
                        return
                          _widgetCard(_listProductFilter.data![index]);
                      }));
            }
            else return Text("j");
          },
        )
    );
  }
}