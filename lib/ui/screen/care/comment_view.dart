import 'package:crm_smart/ui/screen/care/card_comment.dart';
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
      Provider.of<comment_vm>(context, listen: false)
          .getComment(widget.fk_client);
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
          inAsyncCall:  Provider.of<comment_vm>(context, listen: false).isloadadd,
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
                  Flexible(
                    child: TextField(
                     // maxLines: 3,
                      controller: _comment,
                      keyboardType: TextInputType.multiline,
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
                          'date_comment':Utils.toDateTime(
                              DateTime.now()),
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
                      icon: Icon(Icons.check, color: kMainColor)),

                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, top: 8.0, bottom: 20),
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
