
import 'package:crm_smart/model/productmodel.dart';
import 'package:crm_smart/ui/widgets/cardProduct.dart';
import 'package:crm_smart/view_model/product_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductView extends StatelessWidget {
   ProductView({Key? key}) : super(key: key);
 bool _isLoading=false;
  @override
  Widget build(BuildContext context) {
    Provider.of<product_vm>(context).getproduct_vm(context);
    List<ProductModel> _listProd=Provider.of<product_vm>(context).listProduct;
    print(_listProd);
    return Scaffold(
      appBar: AppBar(title: Text('products'),),
      body: _isLoading?
          Center(child: CircularProgressIndicator(),)
          :(_listProd.isEmpty
          ? Center(child: Text('no products added',style: TextStyle(fontSize: 22),),)
      :ListView(
        children: _listProd
            .map(
                (item) => Builder(builder: (context)=>CardProduct( itemProd: item,)) ,
        ).toList(),
      )
      ),
    );
  }
}


