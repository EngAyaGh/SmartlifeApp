

import 'package:crm_smart/constants.dart';
import 'package:crm_smart/ui/screen/user/userview.dart';
import 'package:crm_smart/view_model/all_user_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get.dart';
import 'text_uitil.dart';

class CardUsers extends StatelessWidget {
  CardUsers({Key? key}) : super(key: key);

  final controllerUsers = Get.find<AllUserVMController>();

  @override
  Widget build(BuildContext context) {
    return Obx( () {
        if (controllerUsers.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(
              color: kMainColor,
            ),
          );
        } else {
          return Expanded(
            child: GridView.builder(
              itemCount: controllerUsers.usersList.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 0.9,
                mainAxisExtent: 250,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                maxCrossAxisExtent: 250,
              ),
              itemBuilder: (context, index) {
                return buildCardUsers(
                  email: controllerUsers.usersList[index].email.toString(),
                    name: controllerUsers.usersList[index].nameUser.toString(),
                    typeAdministration: controllerUsers
                        .usersList[index].typeAdministration
                        .toString(),
                    image:
                    'image   ...controllerUsers.usersList[index].toString()',
                    onTap: () {
                      Get.to(() => UserScreen(
                        // userModel: controllerUsers.usersList[index],
                        index: index,
                      ),
                      );
                    });
              },
            ),
          );
        }
      },
    );
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
                Container(
                  width: double.infinity,
                  height: 80,
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
                  child:Icon(Icons.person),
                  //Image.asset(kLogo), //Image.asset('assets\images\smartlife.jpeg'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextUtilis(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    textstring: name,
                    underline: TextDecoration.none,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),    Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextUtilis(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    textstring: email,
                    underline: TextDecoration.none,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextUtilis(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    textstring: typeAdministration,
                    underline: TextDecoration.none,
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