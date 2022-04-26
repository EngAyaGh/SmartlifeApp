
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/ui/screen/user/userview.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_uitil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                  // Text(usermodell.nameUser.toString().substring(0, 1)),
                  usermodell.image.toString()=="" ?
                  usermodell.nameUser.toString().isEmpty||usermodell.nameUser==null
                      ? Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.lightBlueAccent,
                  )
                      : Text(usermodell.nameUser
                      .toString()
                      .substring(0, 1))
                  :Icon(//here image user
                    Icons.person,
                    size: 50,
                    color: Colors.lightBlueAccent,
                  ),
                  backgroundColor: Colors.grey.withOpacity(0.1),
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