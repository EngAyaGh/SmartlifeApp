
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/ui/screen/user/userview.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_uitil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
class buildCardUsers extends StatelessWidget {
   buildCardUsers ({required this.usermodell,Key? key}) : super(key: key);
UserModel usermodell;
  @override
  Widget build(BuildContext context) {

  return Padding(
    padding: const EdgeInsets.all(20),
    child: InkWell(
      onTap:(){
        Navigator.push(context,
          MaterialPageRoute(
              builder:
                  (context)=>
                  UserScreen(
                      userModel: usermodell
                    //index: index,
                  )));
      },
      child: Container(

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // const SizedBox(
              //   height: 5,
              // ),    Padding(
              //   padding: const EdgeInsets.only(left: 10),
              //   child: TextUtilis(
              //     color: Colors.black,
              //     fontSize: 25,
              //     fontWeight: FontWeight.bold,
              //     textstring: email,
              //     underline: TextDecoration.none,
              //   ),
              // ),

              Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey.withOpacity(0.2),
                  //     spreadRadius:2,
                  //     blurRadius: 3,
                  //   ),
                  // ],
                ),
                child:Icon(Icons.person,color: Colors.lightBlueAccent,),
                //Image.asset(kLogo), //Image.asset('assets\images\smartlife.jpeg'),
              ),
              const SizedBox(
                height:15,
              ),
              Center(
                child: Container(
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
                    padding: const EdgeInsets.only(top: 2,bottom: 2, left:10,right: 10),
                    child: TextUtilis(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      textstring: usermodell.typeAdministration.toString(),
                      underline: TextDecoration.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextUtilis(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    textstring: usermodell.nameUser.toString(),
                    underline: TextDecoration.none,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}}