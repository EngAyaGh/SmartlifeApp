import 'package:crm_smart/model/communication_modle.dart';
import 'package:crm_smart/ui/widgets/custom_widget/RowWidget.dart';
import 'package:crm_smart/ui/widgets/custom_widget/card_expansion.dart';
import 'package:crm_smart/view_model/communication_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import '../../../function_global.dart';
import 'install_add.dart';

class View_welcomeClient extends StatefulWidget {
  const View_welcomeClient({Key? key}) : super(key: key);

  @override
  _View_welcomeClientState createState() => _View_welcomeClientState();
}

class _View_welcomeClientState extends State<View_welcomeClient> {
  List<CommunicationModel> listCommunicationwelcome=[];

  @override void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_)async {
      Provider.of<communication_vm>(context, listen: false)
          .getCommunicationWelcome();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    listCommunicationwelcome=Provider.of<communication_vm>
      (context, listen: true)
        .listCommunicationWelcome;
    return Scaffold(

      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            child:
              GroupedListView<CommunicationModel, String>(
                elements:  listCommunicationwelcome,
                groupBy: (element) {
                  if(element.fkUser==null)
                    return 'لم يتم الترحيب';
                  else if(element.fkUser!=null)
                    return ' تم الترحيب بالعميل';
                  return '';
                },
                groupComparator: (value1, value2) => value2.compareTo(value1),
                itemComparator: (item1, item2) => item1.fkUser.toString().
                compareTo(item2.fkUser.toString()),
                order: GroupedListOrder.DESC,
                useStickyGroupSeparators: true,
                groupSeparatorBuilder: (String value) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    value,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                itemBuilder: (c, element) {
                  return Container(
                      child:
                      Padding(
                        padding: const EdgeInsets.all(
                            2),
                        child: Column(
                          children: [
                            ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder:
                                            (
                                            context) =>
                                            installAdd(
                                              com: element,
                                            )));
                              },
                              title: Text(
                                element.nameEnterprise
                                    .toString(),
                                style: TextStyle(
                                    fontFamily: kfontfamily2
                                ),),
                              // leading:
                              trailing: Text(
                                element
                                    .date_approve
                                    .toString(),
                                style: TextStyle(
                                    fontFamily: kfontfamily2
                                ),),
                            ),
                            // const MySeparator(color: Colors.grey),
                            Divider(thickness: 2,),
                          ],
                        ),
                      )
                  );
                },
              ),
            //],
          ),
        ),
      ),
    );
  }
}
