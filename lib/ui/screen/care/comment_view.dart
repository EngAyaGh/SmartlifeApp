import 'package:cached_network_image/cached_network_image.dart';
import 'package:crm_smart/ui/screen/care/card_comment.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/ui/widgets/widgetcalendar/utils.dart';
import 'package:crm_smart/view_model/comment.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class commentView extends StatefulWidget {
  commentView({required this.fk_client,required this.nameEnterprise, Key? key}) : super(key: key);
  String fk_client;
  String? nameEnterprise;
  @override
  _commentViewState createState() => _commentViewState();
}

class _commentViewState extends State<commentView> {
  TextEditingController _comment = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_)async {
      // Provider.of<comment_vm>(context, listen: false)
      //     .getComment(widget.fk_client);
    });
print('init in comment');
    super.initState();
  }
@override void dispose() {
   _comment.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ModalProgressHUD(
          inAsyncCall:  Provider.of<comment_vm>
            (context, listen: false).isloadadd,
          child: SafeArea(
      child: Padding(
          padding: EdgeInsets.only(left:10, right: 10, top: 10, bottom: 10),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: ListView(
                children: [
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 30,
                    child:
                    Provider.of<user_vm_provider>(context,listen:true).currentUser!.img_image.toString().trim().length==0
                    // ||usermodell.img_thumbnail.toString().trim().isEmpty
                        ? Provider.of<user_vm_provider>(context,listen:true).currentUser!.nameUser.toString().isEmpty||
                        Provider.of<user_vm_provider>(context,listen:true).currentUser!.nameUser==null
                        ? Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.lightBlueAccent,
                    ) : Text(Provider.of<user_vm_provider>(context,listen:true).currentUser!.nameUser.toString().substring(0, 1))
                        : ClipRRect(
                      borderRadius: BorderRadius.circular(45),
                          child: CachedNetworkImage(
                      placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                      imageUrl: Provider.of<user_vm_provider>(context,listen:true).currentUser!.img_image.toString(),
                    ),
                        ),
                  ),
                  SizedBox(width: 2,),
                  Flexible(
                    child: EditTextFormField(
                     // maxLines: 3,
                      paddcustom: EdgeInsets.all(20),
                      controller: _comment, hintText: 'إضافة تعليق',
                     // keyboardType: TextInputType.multiline,
                    ),
                  ),
                  IconButton(
                      onPressed: () async {
                        Provider.of<comment_vm>(context, listen: false)
                            .addComment_vm({
                          'content': _comment.text,
                          'fk_user':  await Provider.of<user_vm_provider>(context,
                                  listen: false)
                              .currentUser!
                              .idUser
                              .toString(),
                          'fk_client': widget.fk_client,
                          'date_comment':
                          //Utils.toDateTime(
                              DateTime.now().toString(),
                          //),
                          'nameUser': Provider.of<user_vm_provider>(context,
                              listen: false)
                              .currentUser!.nameUser,
                          'img_image':'',
                          'name_enterprise':widget.nameEnterprise
                        }, Provider.of<user_vm_provider>(context,
                            listen: false)
                            .currentUser!.img_image,);
                        _comment.text='';
                      },
                      icon: Icon(Icons.send, color: kMainColor)),

                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height* 0.7,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, top: 10.0, bottom: 5),
                  child: Consumer<comment_vm>(builder: (context, value, child) {
                    return value.listComments.length == 0
                        ? Text('')
                        : Column(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: value.listComments.length,
                                    itemBuilder: (context, index) {
                                      return SingleChildScrollView(
                                          child: Padding(
                                              padding: const EdgeInsets.all(2),
                                              child:
                                                  //Text(''),
                                                  cardcomment(
                                                  commentmodel:
                                                  value.listComments[index],
                                              )));
                                    }),
                              ),
                            ],
                          );
                  }),
                ),
              ),
            ]),
          ),
      ),
    ),
        ));
  }
}
