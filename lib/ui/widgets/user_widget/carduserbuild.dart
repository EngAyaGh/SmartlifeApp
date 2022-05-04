
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/ui/screen/user/userview.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_uitil.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import '../../../constants.dart';

class buildCardUsers extends StatelessWidget {
  buildCardUsers({required this.usermodell, Key? key}) : super(key: key);
  UserModel usermodell;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 10, top: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UserScreen(userModel: usermodell
                    //index: index,
                  )));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  maxRadius: 30,
                 child:
                  usermodell.img_thumbnail.toString().isEmpty ?
                  usermodell.nameUser.toString().isEmpty||usermodell.nameUser==null ?
                  Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.lightBlueAccent,
                  ) : Text(usermodell.nameUser
                      .toString()
                      .substring(0, 1))
                      :    Image.network( Provider.of<user_vm_provider>(context,listen: true)
                      .currentUser!.img_image!) ,
                    // :  FileImage(
                    //   File(
                    //   //Provider.of<user_vm_provider>(context,listen: false)
                    //   usermodell.img_thumbnail!)) as Widget ,//as ImageProvider,
                 // backgroundColor: Colors.grey.withOpacity(0.1),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtilis(
                      color: Colors.black87,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      textstring: usermodell.nameUser.toString(),
                      underline: TextDecoration.none,
                    ),
                    TextUtilis(
                      color: Colors.black87,
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                      textstring: usermodell.typeAdministration.toString(),
                      underline: TextDecoration.none,
                    ),
                  ],
                ),
              ],
            ),
            usermodell.fkRegoin==null?Text(''): Text(usermodell.nameRegoin.toString(),style: TextStyle(
              fontFamily: kfontfamily2
            ),),
            // Icon(
            //   Icons.arrow_back_ios_new_outlined,
            //   color: Colors.black54,
            // ),
          ],
        ),
      ),
    );
  }
}