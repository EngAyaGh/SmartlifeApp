

import 'package:crm_smart/constants.dart';
import 'package:crm_smart/ui/screen/user/userview.dart';
import 'package:crm_smart/view_model/all_user_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get.dart';
import '../custom_widget/text_uitil.dart';

class CardUsers extends StatefulWidget {
  CardUsers({Key? key}) : super(key: key);

  @override
  _CardUsersState createState() => _CardUsersState();
}

class _CardUsersState extends State<CardUsers> {
  //final controllerUsers = Get.find<AllUserVMController>();
  @override void initState() {
    Provider.of<user_vm_provider>
      (context,listen: false).getuser_vm();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final controllerUsers=Provider.of<user_vm_provider>
      (context,listen: true);

    //return Obx( () {
        if (controllerUsers.userall!.length==0) {
          return Consumer<user_vm_provider>(
            builder:  (context, cart, child){
              return  const Center(
                child: Text('لا يوجد مستخدمين'),
                // CircularProgressIndicator(
                //   color: kMainColor,
                // ),
              );
            }

          );
        } else {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Expanded(
              child: GridView.builder(
                itemCount: controllerUsers.userall!.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 0.9,
                  mainAxisExtent: 250,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  maxCrossAxisExtent: 250,
                ),
                itemBuilder: (context, index) {
                  return Consumer<user_vm_provider>(
                    builder: (context, cart, child) {
                      return buildCardUsers(
                          email: controllerUsers.userall![index].email.toString(),
                          name: controllerUsers.userall![index].nameUser.toString(),
                          typeAdministration: controllerUsers
                              .userall![index].typeAdministration
                              .toString(),
                          image:
                          'image   ...controllerUsers.usersList[index].toString()',
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(
                                    builder:
                                        (context)=>
                                        UserScreen(
                                       userModel: controllerUsers
                                                .userall![index]
                                          //index: index,
                                        )));

                          });
                    }

                  );
                },
              ),
            ),
          );
        }
    //   },
    // );
  }

  Widget buildCardUsers({
    required String name,
    required String email,
    required String typeAdministration,
    required String image,
    required Function() onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: InkWell(
        onTap: onTap,
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
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius:2,
                        blurRadius: 3,
                      ),
                    ],
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
                        textstring: typeAdministration,
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
                      textstring: name,
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
  }
}