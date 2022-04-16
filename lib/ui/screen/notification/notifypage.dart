

import 'package:crm_smart/model/approvemodel.dart';
import 'package:crm_smart/ui/widgets/cardnotify.dart';
import 'package:crm_smart/ui/widgets/client_widget/cardapprove1.dart';
import 'package:crm_smart/view_model/notify_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class notify_pageview extends StatefulWidget {
  const notify_pageview({Key? key}) : super(key: key);

  @override
  _notify_pageviewState createState() => _notify_pageviewState();
}

class _notify_pageviewState extends State<notify_pageview> {
  @override
  void initState() {
    //Provider.of<notifyvm>(context,listen: false).getNotification();
    super.initState();
  }
  @override
  void didChangeDependencies() {
        Provider.of<notifyvm>(context, listen: false)
         .getNotification();
    // Future.delayed(Duration(milliseconds: 10)).then((_) async {
    //   await    Provider.of<notifyvm>(context, listen: false)
    //       .getNotification();
    //   // user=context.read<user_vm_provider>().currentUser;
    //   // await    Provider.of<client_vm>(context, listen: false)
    //   //     .getclientByIdUser_vm(user!.idUser);
    //
    // }
    // );
    super.didChangeDependencies();
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Center(
          child:
          Consumer<notifyvm> (
              builder: (context,value,child) {
                return value.listnotify.length==0?
                CircularProgressIndicator()
                    :ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: value.listnotify.length,
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(0.7),
                            child:
                            // value.listnotify[index].typeNotify=="Approve"
                            // ?cardapprove1(
                            //   itemapprove: ApproveModel(
                            //       nameUser: "aya",
                            //       idApproveClient: '1',
                            //       dateApprove: '19-2-2021',
                            //       name_enterprise: 'جمعية خيرية', fkUser: '2',
                            //       nameRegoin: 'مكة المكرمة', fkClient: '',
                            //       isApprove: '', nameCountry: ''),)
                            //:
                            cardnotify(
                                itemNotify:
                                value.listnotify[index],
                               ),
                          ));
                    });
              } ),
        ),
      ),
    );
  }
}
