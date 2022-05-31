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

class View_installedClient extends StatefulWidget {
  const View_installedClient({Key? key}) : super(key: key);

  @override
  _View_installedClientState createState() => _View_installedClientState();
}

class _View_installedClientState extends State<View_installedClient> {
  List<CommunicationModel> listCommunicationinstall=[];
  bool isload=false;
  @override void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_)async {
      Provider.of<communication_vm>(context, listen: false)
          .getCommunicationInstall();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    listCommunicationinstall=Provider.of<communication_vm>
      (context, listen: true)
        .listCommunicationInstall;
    isload=Provider.of<communication_vm>
      (context, listen: true).isloading;
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'جودة التركيب والتدريب',
          style: TextStyle(color: kWhiteColor, fontFamily: kfontfamily2),
        ),
      ),
      body:
      isload==true?

        Center(
        child: CircularProgressIndicator()):
      listCommunicationinstall.length==0?
      Center(
          child: Text(messageNoData)
      ) :Padding(
        padding: const EdgeInsets.all(8.0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            child:
              GroupedListView<CommunicationModel, String>(
                elements:  listCommunicationinstall,
                groupBy: (element) {
                  if(element.dateCommunication==null)
                    return 'لم يتم التأكد من جودة التركيب والتدريب';
                  else if(element.fkUser!=null)
                    return ' تم التأكد من جودة التركيب والتدريب';
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
                                  .dateinstall_done
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
                      // buildcardExpansion(
                      //     get_title_care(element.typeCommuncation.toString())+'(فاتورة ${element.date_create})', '',
                      //     Column(
                      //       children: [
                      //         element.typeCommuncation=='ترحيب'?
                      //         cardRow(title:'تم الترحيب من قبل' ,value:getnameshort(element.nameUser) ,):Container(),
                      //         element.typeCommuncation=='ترحيب'?
                      //         cardRow(title:'تاريخ الترحيب بالعميل' ,value: element.dateCommunication.toString(),):Container(),
                      //         element.typeCommuncation=='تركيب'?
                      //         cardRow(title:'تم التأكد من جودة التركيب من قبل' ,
                      //           value:getnameshort(element.nameUser) ,):Container(),
                      //         element.typeCommuncation=='تركيب'?
                      //         cardRow(title:'تاريخ التأكد من التركيب للعميل' ,value: element.dateCommunication.toString(),):Container(),
                      //         element.typeCommuncation=='تركيب'?
                      //         cardRow(title:' نتيجة التواصل' ,value: element.result.toString(),):Container(),
                      //
                      //
                      //         element.typeCommuncation=='دوري'?
                      //         cardRow(title:'موظف التقييم' ,value:getnameshort(element.nameUser) ,):Container(),
                      //         element.typeCommuncation=='دوري'?
                      //         cardRow(title:'تاريخ التقييم' ,value: element.dateCommunication.toString(),):Container(),
                      //         element.typeCommuncation=='دوري'?
                      //         cardRow(title:'مستوى التقييم' ,value: element.rate.toString(),):Container(),
                      //       ],
                      //     )
                      // )
                  );
                },
              ),
           // ],
          ),
        ),
      ),
    );
  }
}
