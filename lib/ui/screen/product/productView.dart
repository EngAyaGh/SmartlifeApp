
import 'package:crm_smart/model/productmodel.dart';
import 'package:crm_smart/ui/widgets/product_widget/cardProduct.dart';
import 'package:crm_smart/view_model/country_vm.dart';
import 'package:crm_smart/view_model/product_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import 'addproduct.dart';

class ProductView extends StatefulWidget {
   ProductView({Key? key}) : super(key: key);

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool _isLoading=true;
 List<ProductModel> _listProd=[];
@override
void initState() {
   String id_country=Provider.of<country_vm>
     (context,listen: false).id_country;
   //Provider.of<product_vm>(context,listen: false).listProduct=[];
   Provider.of<product_vm>(context,listen: false)
       .getproduct_vm("1");//.then((value) => _isLoading=false);
  super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _listProd=Provider.of<product_vm>(context,listen: true).listProduct;
    _isLoading =_listProd.isEmpty?false:false;
    print(_listProd);
    return Scaffold(
      key: _scaffoldKey,
      floatingActionButton:FloatingActionButton(
        backgroundColor: kMainColor,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>addProduct()));
        },
        tooltip: 'إضافة منتج',
        child: Icon(Icons.add),
      ),
      appBar: AppBar(title: Text('المنتجات',style: TextStyle(color: kWhiteColor),textAlign: TextAlign.center,),),
      body: _isLoading?
          Center(child: CircularProgressIndicator(),)
          :(_listProd.isEmpty
          ? Center(child: Text('لا يوجد منتجات',style: TextStyle(fontSize: 22,color: kWhiteColor),),)
      :Padding(
        padding: const EdgeInsets.only(left:20,right: 20,top: 10,bottom: 10),
        child: Container(
          height: MediaQuery
              .of(context)
              .size
              .height *0.95,
          child: ListView.separated(
            itemCount: _listProd.length,
            separatorBuilder: (BuildContext context, int index) =>
            const Divider(height: 1,),
            itemBuilder: (BuildContext context, int index)=>
                Builder(builder:
                    (context)=>CardProduct( itemProd:
                    _listProd[index],scaffoldKey: _scaffoldKey)) ,
            //     _listProd.map(
            //         (item) => Builder(builder: (context)=>CardProduct( itemProd: item,)) ,
            // ).toList(),
          ),
        ),
      )
      ),
    );
  }
}


