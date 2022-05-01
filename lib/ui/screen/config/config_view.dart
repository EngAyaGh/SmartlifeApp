


import 'package:crm_smart/provider/config_vm.dart';
import 'package:crm_smart/ui/widgets/container_boxShadows.dart';
import 'package:crm_smart/ui/widgets/custom_widget/customformtext.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';

class config_view extends StatelessWidget {
   config_view({Key? key}) : super(key: key);

  TextEditingController _controllertax=TextEditingController();
  TextEditingController _controllertarget=TextEditingController();
  TextEditingController _controllerdateinstall=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [

          IconButton(
              onPressed: (){
                for(int i=0;i< Provider.of<config_vm>(context,listen: false)
                    .listofconfig.length;i++){
                   //Provider.of<privilge_vm>(context,listen: false)
                  //     .updatepriv_vm(
                  //     Provider.of<privilge_vm>(context,listen: false)
                  //         .privilgelist[i].fkPrivileg,
                  //     Provider.of<privilge_vm>(context,listen: false)
                  //         .privilgelist[i].isCheck);
                }

                Navigator.pop(context);

              }, icon:Icon( Icons.check_rounded,color: kWhiteColor,)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ContainerShadows(
              margin: EdgeInsets.only(),
              child: Column(
                children: [
                  RowEdit(name: 'المبيعات', des: ''),
                  Row(
                    //فترة السماح للدعم الفني تحديد موعد التركيب للعميل
                    children: [
                      Text('ضريبة الدولة'),
                      CustomFormField(
                        read: false,
                        radius: 15,
                        maxline: 3,
                        vaild: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a value ';
                          }
                        },
                        con: _controllertax,
                        label: " ",
                        hintText: '%',
                      ),
                    ],
                  ),
                  Row(

                    children: [
                      Text('التاركيت '),
                      CustomFormField(
                        read: false,
                        radius: 15,
                        maxline: 3,
                        vaild: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a value ';
                          }
                        },
                        con: _controllertarget,
                        label: " ",
                        hintText: '',
                      ),
                    ],
                  ),
                  RowEdit(name: 'الدعم الفني', des: ''),
                  Row(
                    //
                    children: [
                      Text('فترة السماح للدعم الفني تحديد موعد التركيب للعميل'),
                      CustomFormField(
                        read: false,
                        radius: 15,
                        maxline: 3,
                        vaild: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a value ';
                          }
                        },
                        con: _controllerdateinstall,
                        label: " ",
                        hintText: 'ساعة',
                      ),
                    ],
                  ),
                  RowEdit(name: 'العناية بالعملاء ', des: ''),

                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
