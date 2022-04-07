
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class transferClient extends StatefulWidget {
   transferClient({Key? key}) : super(key: key);

  @override
  _transferClientState createState() => _transferClientState();
}

class _transferClientState extends State<transferClient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("من فضلك اختر اسم الموظف الذي ترغب بتحويل العميل إليه"),
            SizedBox(height: 5,),
            Consumer<user_vm_provider>(
              builder: (context, cart, child){
                return DropdownButton(
                  isExpanded: true,
                  hint: Text("حدد موظف"),
                  items: cart.userall!.map((level_one) {
                    return DropdownMenuItem(
                      child: Text(level_one.nameUser.toString()), //label of item
                      value: level_one.idUser, //value of item
                    );
                  }).toList(),
                  value:cart.selecteduser,
                  onChanged:(value) {
                    //  setState(() {
                    cart.changevalueuser(value.toString());
                    // });
                  },
                );},
            ),
            SizedBox(height: 5,),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      kMainColor)),
              onPressed: () {

              },
              child: Text('تأكيد العملية'),
            ),
          ],
        ),
      ),


    );
  }
}
