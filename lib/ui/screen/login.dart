import 'package:crm_smart/services/send_otp.dart';
import 'package:crm_smart/ui/widgets/custombutton.dart';
import 'package:crm_smart/ui/widgets/customformtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  late String valueField;
  late String textbutton;
  @override
  Widget build(BuildContext context) {
    return Container(

      color: Colors.lightBlueAccent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomFormField(
                onChanged: (data){
                  valueField=data;
                },
            ),
            CustomButton(
              text:textbutton,
              onTap: () async {

                if(textbutton=="send code") {

                 if(await AuthServices().send_otp(valueField)){
                 textbutton="verfiy code";
                  }
                 }
                else{
                  if(await AuthServices().verfiy_otp(valueField,"")){

                  }
                }
            },)
          ],
    ),
      ),
     );
  }
}
