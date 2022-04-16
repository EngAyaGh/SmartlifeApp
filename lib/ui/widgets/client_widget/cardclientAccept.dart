import 'package:crm_smart/constants.dart';
import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/ui/screen/client/detail_client.dart';
import 'package:crm_smart/ui/screen/client/editClient.dart';
import 'package:crm_smart/ui/screen/invoice/addInvoice.dart';
import 'package:crm_smart/ui/screen/invoice/invoces.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custom_button_new.dart';
import 'package:crm_smart/ui/widgets/custom_widget/separatorLine.dart';
import 'package:crm_smart/view_model/all_user_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class cardClientAccept extends StatelessWidget {
  cardClientAccept(
      { Key? key,
        required this.iduser,
        required this.iteminvoice}) : super(key: key);
  //ClientModel itemClient;
  InvoiceModel iteminvoice;
  String iduser;

  @override
  Widget build(BuildContext context) {
    //العملاء المشتركين
    return Container(

      decoration: BoxDecoration(
        borderRadius:
        BorderRadius.only(bottomRight: Radius.circular(30)),
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
            //height: 125,//MediaQuery.of(context).size.height*0.15,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(iteminvoice.name_enterprise.toString(),
                            style: TextStyle(
                                fontFamily: kfontfamily2),
                          ),

                          // Text(
                          //   itemClient.name_regoin.toString(),
                          //   style: TextStyle(
                          //       fontFamily: kfontfamily2),),
                          //

                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  offset: Offset(1.0, 1.0),
                                  blurRadius: 8.0,
                                  color: Colors.black87.withOpacity(0.2),
                                ),
                              ],
                              color: kMainColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3,bottom: 3, left:20,right: 20),
                              child: Text(iteminvoice.name_regoin.toString(),style:
                              TextStyle(
                                  color: kWhiteColor,
                                  //fontWeight: FontWeight.bold,
                                  fontFamily: kfontfamily3),

                              ),
                            ),
                          ),

                          Text(iteminvoice.dateCreate.toString(),
                            style: TextStyle(
                                fontFamily: kfontfamily2),),
                          Row(
                            children: [
                              Text("المتبقي".toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                    fontFamily: kfontfamily2),),
                              SizedBox(width: 3,),

                              Text(""+
                                  ( double.parse(iteminvoice.total.toString())-
                                    double.parse(iteminvoice.amountPaid.toString())
                                  ).toString()
                                ,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,

                                    fontFamily: kfontfamily2),),
                            ],
                          ),
                        ],)

                    ],
                  ),

                ],),
            ),
          ),
        ),),
    );
    //});
  }
}
