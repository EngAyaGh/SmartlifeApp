
import 'package:crm_smart/constants.dart';
import 'package:crm_smart/model/approvemodel.dart';
import 'package:crm_smart/model/notificationModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class cardapprove1 extends StatelessWidget {
  cardapprove1({Key? key, required this.itemapprove}) : super(key: key);
  late ApproveModel itemapprove;

  @override
  Widget build(BuildContext context) {

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
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all( Radius.circular(5)),),
          //height: 70,//MediaQuery.of(context).size.height*0.15,
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
                        Text(itemapprove.name_enterprise.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontFamily: kfontfamily3),
                        ),

                        Text(itemapprove.nameUser.toString(),
                        style: TextStyle(fontFamily: kfontfamily2),),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                            ElevatedButton(style: ButtonStyle(
                                backgroundColor: MaterialStateProperty
                                    .all(kMainColor)),
                                onPressed: () {},
                                child: Text('Approve')),
                        SizedBox(width: 4,),
                        ElevatedButton(style: ButtonStyle(
                            backgroundColor: MaterialStateProperty
                                .all(Colors.redAccent)),
                            onPressed: () {},
                            child: Text('Refuse')),
                          ],
                        ),

                      ],)

                  ],
                ),

              ),
          ),
        ),);
    //});
  }
}