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
   String? valueField;
   String? textbutton = "send code";
   TextEditingController? _textcontroller=TextEditingController();
   TextEditingController? _code=TextEditingController();
   final _globalKey=GlobalKey<FormState>();
  String? validateEmail(String email) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(email))
      return 'Please make sure your email address is valid';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Form(
          key: _globalKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomFormField(
                con: _textcontroller,
                vaild: (data) {
                  if (data!.isEmpty) {
                    return 'الحقل فارغ';
                  }
                 return validateEmail(data);
                },
                hintText: "Enter your Email",
                onChanged: (data) {
                  valueField = data;
                },
              ),
              SizedBox(
                height: 30,
              ),
              CustomButton(
                text: textbutton,
                onTap: () async {
                if(_globalKey.currentState!.validate()){
                   //print('before ${_textcontroller!.text}');
                  _globalKey.currentState!.save();
                  // print('after ${_textcontroller!.text}');
                  if (textbutton == "send code") {
                    if (await AuthServices().send_otp(valueField!)) {
                      textbutton = "verfiy code";
                    }
                  } else {
                    if (await AuthServices().verfiy_otp(valueField!, "")) {}
                  }
                }},
              )
            ],
          ),
        ),
      ),
    );
  }
}
