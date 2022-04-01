
import 'package:crm_smart/constants.dart';
import 'package:crm_smart/ui/screen/support/secound.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class support_add extends StatefulWidget {
  const support_add({Key? key}) : super(key: key);

  @override
  _support_addState createState() => _support_addState();
}

class _support_addState extends State<support_add> {
  TextEditingController _textsupport=TextEditingController();

  @override
  void initState()  {

print('initt');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('builld');
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back))
        ],
      ),
      body: Column(
        children: [
          TextField(
            controller: _textsupport,
            decoration: InputDecoration(
              hintTextDirection: TextDirection.rtl,
              alignLabelWithHint: true,

              labelText: 'label',
              labelStyle: TextStyle(color: kMainColor,),
              hintText: 'hintText',

              filled: true,
              fillColor: Colors.white,
              // hintStyle: const TextStyle(
              //     color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w500),
              //filled: false,
              //fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.black)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.black)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.black)),
            ),
          ),
          TextButton(onPressed: (){

            Navigator.push(context, MaterialPageRoute(builder: (context)=> second()));
          }, child: Text('move'))
        ],
      ),

    );
  }


}
