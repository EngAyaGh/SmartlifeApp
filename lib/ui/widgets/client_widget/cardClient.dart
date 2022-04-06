import 'package:crm_smart/constants.dart';
import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/ui/screen/client/detail_client.dart';
import 'package:crm_smart/ui/screen/client/editClient.dart';
import 'package:crm_smart/ui/screen/invoice/addInvoice.dart';
import 'package:crm_smart/ui/screen/invoice/invoces.dart';
import 'package:crm_smart/ui/widgets/custom_widget/separatorLine.dart';
import 'package:crm_smart/view_model/all_user_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class cardClient extends StatelessWidget {
  cardClient(
      { Key? key,
        required this.iduser,
        required this.itemClient}) : super(key: key);
  ClientModel itemClient;
  String iduser;
  //final controllerUsers = Get.find<AllUserVMController>();

  @override
  Widget build(BuildContext context) {
    // controllerUsers.getcurrentUser();
    //return Obx( () {
    return Container(

        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: Offset(1.0, 1.0),
              blurRadius: 8.0,
              color: Colors.black87.withOpacity(0.2),
            ),
          ],
          color: Colors.white30,
        ),

        child: Center(
          child: InkWell(
            //splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Detail_Client()));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all( Radius.circular(5)),),
              height: 130,//MediaQuery.of(context).size.height*0.15,
              child: Padding(
                padding: EdgeInsets.all(6),
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    Column(
                      textDirection: TextDirection.rtl,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Column(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(itemClient.nameEnterprise.toString(),
                                      style: TextStyle(
                                          fontFamily: kfontfamily2),),

                                    Text('   اسم المؤسسة', style: TextStyle(
                                        fontFamily: kfontfamily2),),
                                  ],
                                ),
                                Positioned(
                                    top: 100,
                                    left: 0
                                    , right: 0,
                                    child:
                                    Row(
                                      children: [
                                        Text(
                                          itemClient.name_regoin.toString(),
                                          style: TextStyle(
                                              fontFamily: kfontfamily2),),

                                        Text('  المنطقة', style: TextStyle(
                                            fontFamily: kfontfamily2),),
                                        SizedBox(width: 3,),
                                        Text(itemClient.nameUser.toString(),
                                          style: TextStyle(
                                              fontFamily: kfontfamily3 ),),
                                        Text('  موظف المبيعات', style: TextStyle(
                                            fontFamily: kfontfamily3),),
                                      ],
                                    )),
                                // Row(
                                //   children: [
                                //     Text(itemClient.city.toString(),
                                //       style: TextStyle(
                                //           fontFamily: kfontfamily2),),
                                //     Text('   المدينة', style: TextStyle(
                                //         fontFamily: kfontfamily2),),
                                //   ],
                                // ),
                                //
                                // Row(
                                //
                                //   children: [
                                //     Text(itemClient.nameUser.toString(),
                                //       style: TextStyle(
                                //           fontFamily: kfontfamily3 ),),
                                //     Text('  موظف المبيعات', style: TextStyle(
                                //         fontFamily: kfontfamily3),),
                                //   ],
                                // )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(itemClient.typeClient.toString(),
                                      style: TextStyle(
                                          fontFamily: kfontfamily2),),
                                    // Text('   حالة العميل', style: TextStyle(
                                    //     fontFamily: kfontfamily2),),
                                  ],
                                ),

                                ButtonBar(
                                  children: <Widget>[
                                    new IconButton(
                                      icon: Icon(Icons.edit),
                                      onPressed: () {

                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context)=>
                                                    editclient(
                                                      itemClient:itemClient,
                                                      fkclient:  itemClient.idClients.toString(),
                                                      fkuser:    itemClient.fkUser.toString(),
                                                    )

                                            ));
                                      },
                                      //onPressed: REFRESH,
                                    ),

                                    ElevatedButton(style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty
                                            .all(kMainColor)),
                                        onPressed: () {},
                                        child: Text('Approve')),
                                  ],
                                ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //     // ElevatedButton(style: ButtonStyle(
                                //     //     backgroundColor: MaterialStateProperty
                                //     //         .all(kMainColor)),
                                //     //     onPressed: () {},
                                //     //     child: Text('Approve')),
                                //   ],
                                // ),
                              ],)

                          ],
                        ),
                      ],),
                    SizedBox(height: 7,),
                    const MySeparator(color: Colors.grey),
                    Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Row(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton
                              (style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    kMainColor)),
                                onPressed: () {
                                  //iduser
                                  Navigator.push(context,
                                      MaterialPageRoute(
                                      builder: (context)=>
                                      invoices(
                                          itemClient:itemClient,
                                          fkclient:  itemClient.idClients.toString(),
                                          fkuser:    itemClient.fkUser.toString(),
                                      )

                                      ));

                                },
                                // addinvoice(
                                //     iduser: iduser,
                                //     idClient: itemClient.idClients.toString()
                                child: Text('invoice')),
                            Spacer(),
                            Text('18/November/2021')
                          ],
                        ),

                        height:18// MediaQuery.of(context).size.height*0.2
                    ),
                  ],),
              ),
            ),
          ),),
      );
    //});
  }
}
