
import 'package:crm_smart/constants.dart';
import 'package:crm_smart/ui/screen/support/support_view.dart';
import 'package:crm_smart/ui/widgets/container_boxShadows.dart';
import 'package:crm_smart/ui/widgets/custom_widget/RowWidget.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
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

      ),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ContainerShadows(
              margin: EdgeInsets.all(12),
              child: Column(
                children: [
                  RowEdit(name: 'موعد التركيب للعميل من ', des: ''),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Flexible(
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.date_range,
                              color: kMainColor,
                            ),
                            hintStyle: const TextStyle(
                                color: Colors.black45,
                                fontSize: 16, fontWeight: FontWeight.w500),
                            hintText:
                            _currentDate==null
                              ?''
                              :_currentDate.toString(),
                            filled: true,
                            fillColor: Colors.grey.shade200,
                          ),
                          readOnly: true,
                          onTap: (){
                            _selectDate(context,DateTime.now());
                          },
                        ),
                      ),
                      // IconButton(onPressed: (){
                      //   //_selectDate(context,_currentDate);
                      // }, icon: Icon(Icons.edit,color: kMainColor,)),
                      IconButton(onPressed: (){},
                          icon:Icon( Icons.check,color: kMainColor)),
                    ],
                  ),
                  SizedBox(height: 6,),
                 
                  SizedBox(height: 20,),

                  cardRow(title: 'اسم المؤسسة',value: ''),
                  cardRow(title: 'معتمد الاشتراك ',value: 'آية'),
                  cardRow(title: 'هل تم التركيب ',value: 'بالانتظار'),
                  cardRow(title: 'طريقة التركيب ',value: 'ميداني'),
                  SizedBox(height: 16,),

    ElevatedButton(
    style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(
    kMainColor)),
    onPressed: () async{
                    bool result = await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('التأكيد'),
                          content: Text('هل تريد تأكيد عملية التركيب'),
                          actions: <Widget>[
                            new ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      kMainColor)),
                              onPressed: () {
                                Navigator.of(context,
                                    rootNavigator: true)
                                    .pop(
                                    false); // dismisses only the dialog and returns false
                              },
                              child: Text('لا'),
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      kMainColor)),
                              onPressed: () async {
                                Navigator.of(context,
                                    rootNavigator: true)
                                    .pop(true);
                              },
                              child: Text('نعم'),
                            ),
                          ],
                        );
                      },
                    );
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=> second()));
                  },
                      child: Text('تم التركيب للعميل')),
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
   late DateTime _currentDate = DateTime(1,1,1);
  // final DateFormat formatter = DateFormat('yyyy-MM-dd');

  Future<void> _selectDate(BuildContext context, DateTime currentDate) async {
    //String output = formatter.format(currentDate);

    final DateTime? pickedDate = await showDatePicker(
        context: context,
        currentDate: currentDate,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2080));
    if (pickedDate != null )//&& pickedDate != currentDate)
      setState(() {
        _currentDate = pickedDate;

      });
  }



}
