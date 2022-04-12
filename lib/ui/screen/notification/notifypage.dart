

import 'package:crm_smart/ui/widgets/cardnotify.dart';
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
    Future.delayed(Duration(milliseconds: 30)).then((_) async {
      await    Provider.of<notifyvm>(context, listen: false)
          .getNotification();
      // user=context.read<user_vm_provider>().currentUser;
      // await    Provider.of<client_vm>(context, listen: false)
      //     .getclientByIdUser_vm(user!.idUser);

    }
    );
    super.didChangeDependencies();
  }

    @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
          padding: const EdgeInsets.only(left:20,right: 20,top: 10,bottom: 10),
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
                              padding: const EdgeInsets.all(2),
                              child: cardnotify(
                                  itemNotify:
                                  value.listnotify[index],
                                 ),
                            ));
                      });
                } ),
          )  ),
    );
  }
}
