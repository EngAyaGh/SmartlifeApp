import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/ui/screen/user/userview.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_uitil.dart';
import 'package:crm_smart/ui/widgets/user_widget/target.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

class buildCardUsers extends StatelessWidget {
  buildCardUsers({required this.usermodell, Key? key}) : super(key: key);
  UserModel usermodell;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
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
                  child:
                      // Text(usermodell.nameUser.toString().substring(0, 1)),
                      usermodell.image.toString().isEmpty
                          ? Icon(
                              Icons.person,
                              size: 40,
                              color: Colors.lightBlueAccent,
                            )
                          : usermodell.nameUser.toString().isEmpty
                              ? Text('0')
                              : Text(usermodell.nameUser
                                  .toString()
                                  .substring(0, 1)),
                  backgroundColor: Colors.grey.withOpacity(0.1),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        TextUtilis(
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          textstring: usermodell.nameUser.toString(),
                          underline: TextDecoration.none,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TargetPage(userModel: usermodell
                                              //index: index,
                                              )));
                            },
                            child: Text(
                              '(Target)',
                              style: TextStyle(color: Colors.amber),
                            ))
                      ],
                    ),
                    TextUtilis(
                      color: Colors.black87,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      textstring: usermodell.typeAdministration.toString(),
                      underline: TextDecoration.none,
                    ),
                  ],
                ),
                SizedBox(width: 15),
              ],
            ),
            Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.black54,
            ),
          ],
        ),
      ),
    );
  }
}
