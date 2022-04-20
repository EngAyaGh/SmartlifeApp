
import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/ui/widgets/client_widget/cardClient.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class productSearchView extends StatelessWidget {

  String pattern;
  List<ClientModel> list;
  productSearchView(this.pattern,this.list, {Key? key}) : super(key: key);

  //String get pattern => null;

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
              AsyncSnapshot<List<ClientModel>> _listProductFilter)  {
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
                        return cardClient(
                            itemClient:_listProductFilter.data![index], iduser: '',);
                      }));
            }
            else return Text("j");
          },
        )
    );
  }
}