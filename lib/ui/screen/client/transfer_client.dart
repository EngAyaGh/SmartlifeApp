
import 'package:crm_smart/api/fcm.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/ui/screen/client/tabclients.dart';
import 'package:crm_smart/ui/screen/home/home.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import '../../../constants.dart';
import 'clients.dart';

class transferClient extends StatefulWidget {
   transferClient({required this.name_enterprise, required this.idclient, Key? key}) : super(key: key);
   String idclient,name_enterprise;
  @override
  _transferClientState createState() => _transferClientState();
}

class _transferClientState extends State<transferClient> {
  late final String iduser;

  @override
  Future<void> didChangeDependencies() async {
    Future.delayed(Duration(milliseconds: 30)).then((_) async {
      await Provider.of<user_vm_provider>(context,listen: false)
          .getuser_vm();
      print(Provider.of<user_vm_provider>(context,listen: false)
          .userall.length);
    }
    );

    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        leading: IconButton(
        icon: Icon(Icons.arrow_back, color: kWhiteColor),
    onPressed: () => Navigator.of(context).pop(),
    )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("من فضلك اختر اسم الموظف الذي ترغب بتحويل العميل إليه"),
            SizedBox(height: 10,),
            Consumer<user_vm_provider>(
              builder: (context, cart, child){
              return  DropdownSearch<UserModel>(
                mode: Mode.DIALOG,
                  label: "Name",
                  //onFind: (String filter) => cart.getfilteruser(filter),
               filterFn: (user, filter) => user!.getfilteruser(filter!),
                //compareFn: (item, selectedItem) => item?.id == selectedItem?.id,
                 // itemAsString: (UserModel u) => u.userAsStringByName(),
                items: cart.userall,
                itemAsString:
                    ( u) => u!.userAsString(),
               // selectedItem: cart.currentUser,
                  onChanged: (data) => iduser=data!.idUser!,//print(data!.nameUser),
                showSearchBox: true,
                dropdownSearchDecoration: InputDecoration(
                  labelText: "choose a user",
                  contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                  border: OutlineInputBorder(),
                ),
                );

              },
            ),
            SizedBox(height: 5,),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      kMainColor)),
              onPressed: () {
                // Map<String,dynamic> data={
                //   'click_action':'FLUTTER_NOTIFICATION_CLICK',
                //   'id':'1',
                //   'name':'aya'};
                //
                // var body={
                //   //'token': "token",
                //   //"to":"",
                //   "direct_boot_ok" : true,
                //   "notification":{
                //     "title":"FCM Message",
                //     "body":"This is an FCM notification message!",
                //   },
                //   "data": data,
                //   'to': FirebaseMessaging.instance.getToken(),
                // };
                // //send notification
                // FCM().sendnotification(body);

                //remove client from my client
                // idclient
                // Provider.of<client_vm>(context,listen: false)
                //     .removeclient(widget.idclient);
                //update fkuser to new user
               Provider.of<client_vm>(context,listen: false)
                   .setfkUserclient_vm(
                 {
                   'fkuser':iduser,//user reciept
                   'nameusertransfer':
                   Provider.of<user_vm_provider>(context,listen: false)
                   .currentUser!.nameUser.toString(),//الموظف الذي حول العميل
                   'name_enterprise':widget.name_enterprise,
                   'fkusertrasfer':    Provider.of<user_vm_provider>(context,listen: false)
                   .currentUser!.idUser.toString(),
                   //'idclient':
                 },widget.idclient
               );
                //navigator to clients view page

                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context)=>Home()),
                        (route) => false
                      );
              },
              child: Text('تأكيد العملية'),
            ),
          ],
        ),
      ),
    );
  }
}
