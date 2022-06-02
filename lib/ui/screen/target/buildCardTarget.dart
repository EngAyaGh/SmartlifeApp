import 'package:cached_network_image/cached_network_image.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/ui/screen/target/target_user.dart';
import 'package:crm_smart/ui/screen/user/userview.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_uitil.dart';
import 'package:crm_smart/ui/screen/target/target_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

class buildCardTarget extends StatelessWidget {
  buildCardTarget({required this.usermodell, Key? key}) : super(key: key);
  UserModel usermodell;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TargetUser(
                        userModel: usermodell,
                      )));
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3.0,
                    blurRadius: 5.0)
              ]),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 10, right: size * 0.14, left: size * 0.14),
                  child:  CircleAvatar(
                    radius: 30,
                    child:
                    usermodell.img_image.toString().trim().length==0
                    // ||usermodell.img_thumbnail.toString().trim().isEmpty
                        ? usermodell.nameUser.toString().isEmpty||usermodell.nameUser==null
                        ? Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.lightBlueAccent,
                     ) : Text(usermodell.nameUser.toString().substring(0, 1))
                        : ClipRRect(
                      borderRadius: BorderRadius.circular(45),

                      child: CachedNetworkImage(
                        placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                        imageUrl: usermodell.img_image!,
                      ),
                    ),
                    // CachedNetworkImage(
                    //   progressIndicatorBuilder: (context, url, progress) => Center(
                    //     child: CircularProgressIndicator(
                    //       value: progress.progress,
                    //     ),
                    //   ),
                    //   imageUrl:usermodell.img_image!
                    //    ),
                    //Image.network(usermodell.img_image!, height: 150, width: 150, fit: BoxFit.cover,) ,
                    // :  FileImage(
                    //   File(
                    //   //Provider.of<user_vm_provider>(context,listen: false)
                    //   usermodell.img_thumbnail!)) as Widget ,//as ImageProvider,
                    // backgroundColor: Colors.grey.withOpacity(0.1),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding:
                      EdgeInsets.only(left: size * 0.01, right: size * 0.01),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextUtilis(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            textstring: usermodell.nameUser.toString(),
                            underline: TextDecoration.none,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          TextUtilis(
                            color: Colors.amber,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            textstring: usermodell.nameRegoin.toString(),
                            underline: TextDecoration.none,
                          ),
                        ],
                      ),
                      TextUtilis(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        textstring: usermodell.name_level.toString(),
                        underline: TextDecoration.none,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                // Padding(
                //   padding:
                //       EdgeInsets.only(right: size * 0.10, left: size * 0.10),
                //   child: Directionality(
                //     textDirection: TextDirection.ltr,
                //     child: Row(
                //       children: [
                //         TextUtilis(
                //           color: Colors.black,
                //           fontSize: 35,
                //           fontWeight: FontWeight.bold,
                //           textstring: 'Target :',
                //           underline: TextDecoration.none,
                //         ),
                //         TextUtilis(
                //           color: Colors.black54,
                //           fontSize: 35,
                //           fontWeight: FontWeight.normal,
                //           textstring: '400',
                //           underline: TextDecoration.none,
                //         ),
                //       ],
                //     ),
                //   ),
                // ),

                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          TextUtilis(
                            color: Colors.black,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            textstring: 'Q1 :',
                            underline: TextDecoration.none,
                          ),
                          TextUtilis(
                            color: Colors.black38,
                            fontSize: 35,
                            fontWeight: FontWeight.normal,
                            textstring: '100',
                            underline: TextDecoration.none,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          TextUtilis(
                            color: Colors.black,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            textstring: 'Q2 :',
                            underline: TextDecoration.none,
                          ),
                          TextUtilis(
                            color: Colors.black38,
                            fontSize: 35,
                            fontWeight: FontWeight.normal,
                            textstring: '200',
                            underline: TextDecoration.none,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          TextUtilis(
                            color: Colors.black,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            textstring: 'Q3 :',
                            underline: TextDecoration.none,
                          ),
                          TextUtilis(
                            color: Colors.black38,
                            fontSize: 35,
                            fontWeight: FontWeight.normal,
                            textstring: '300',
                            underline: TextDecoration.none,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          TextUtilis(
                            color: Colors.black,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            textstring: 'Q4 :',
                            underline: TextDecoration.none,
                          ),
                          TextUtilis(
                            color: Colors.black38,
                            fontSize: 35,
                            fontWeight: FontWeight.normal,
                            textstring: '400',
                            underline: TextDecoration.none,
                          ),
                        ],
                      )
                    ],
                  ),
                )
                // Row(
                //   children: [
                //     Text('600'),
                //     SizedBox(
                //       width: 10,
                //     ),
                //     Container(
                //       width: 50,
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(10),
                //         color: Colors.grey.withOpacity(0.2),
                //       ),
                //       child: Center(
                //         child: Text(
                //           'تارجت',
                //           style: TextStyle(color: Colors.amber),
                //         ),
                //       ),
                //     ),
                //   ],
                // )

                // Row(
                //   children: [
                //     Text('Q1 : 200  -'),
                //     SizedBox(
                //       width: 10,
                //     ),
                //     Text('Q2 : 200  -'),
                //     SizedBox(
                //       width: 10,
                //     ),
                //     Text('Q3 : 200  -'),
                //     SizedBox(
                //       width: 10,
                //     ),
                //     Text('Q4 : 200 '),
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
