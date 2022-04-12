import 'package:crm_smart/ui/screen/notification/notifypage.dart';
import 'package:crm_smart/ui/widgets/custom_widget/customTextStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'package:google_fonts/google_fonts.dart';
class customAppbar extends StatelessWidget implements PreferredSizeWidget{
  const customAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build appbar');
    return  AppBar(
      //textTheme: TextTheme(),
      title: Text('Smart Life',style:
      TextStyle(color: Colors.white,fontSize: 16,fontFamily: kfontfamily),),
      centerTitle: true,
      elevation: 1,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: Icon(
              Icons.notifications
              ,size: 20
              ,color: Colors.white,
            ), onPressed: () {

            Navigator.push(context,
                MaterialPageRoute(
                    builder: (context)=>
                    notify_pageview()
           // ,fullscreenDialog:true
                ));

          },
          ),
        ),
      ],
      iconTheme: IconThemeData(size: 10),
      // leading: Image(image:
      //  AssetImage('images/Image-3.jpg'),fit: BoxFit.fill,height: 10,width: 10,
      // ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>Size.fromHeight(50);
}
