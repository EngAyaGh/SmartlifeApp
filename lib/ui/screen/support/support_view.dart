

import 'package:crm_smart/constants.dart';
import 'package:crm_smart/ui/screen/search/search_container.dart';
import 'package:crm_smart/ui/screen/support/support_add.dart';
import 'package:crm_smart/ui/widgets/custom_widget/separatorLine.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class support_view extends StatefulWidget {
  const support_view({Key? key}) : super(key: key);

  @override
  _support_viewState createState() => _support_viewState();
}

class _support_viewState extends State<support_view> {
  @override void didChangeDependencies() async {
    await    Provider.of<invoice_vm>(context, listen: false)
        .getinvoice_Local("مشترك");
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('العملاء المشتركين',style: TextStyle(color: kWhiteColor),),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 10),
              child: ListView(
                children: [
                  search_widget("المؤسسة....",
                    Provider.of<invoice_vm>(context, listen: true)
                        .listInvoicesAccept,),
                  SizedBox(height: 5,),
                  Container(
                    height: MediaQuery.of(context).size.height*0.73,

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Consumer<invoice_vm> (
                          builder: (context,value,child) {
                            return value.listInvoicesAccept.length==0?
                            CircularProgressIndicator()
                                :Expanded(
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: value.listInvoicesAccept.length,
                                  itemBuilder: (context, index) {
                                    return SingleChildScrollView(
                                        child: Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Column(
                                            children: [
                                              ListTile(
                                                onTap: (){
                                                  Navigator.push(context,
                                                      MaterialPageRoute(builder:
                                                          (context) => support_add()));
                                                },
                                                title:Text(value.listInvoicesAccept[index]
                                        .name_enterprise.toString(),
                                                  style: TextStyle(
                                                  fontFamily: kfontfamily2
                                                ),) ,
                                               // leading:
                                                trailing:Text( value.listInvoicesAccept[index]
                                            .dateCreate.toString() ,style: TextStyle(
                                                    fontFamily: kfontfamily2
                                                ),) ,
                                              ),
                                              // const MySeparator(color: Colors.grey),
                                              Divider(thickness: 2,),
                                            ],
                                          ),
                                        ));
                                  }),
                            );
                          } ),
                    ),
                  ),
                ],
              )  ),
        ),
      ),
    );
  }
}
