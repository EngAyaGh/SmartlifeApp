


import 'package:cached_network_image/cached_network_image.dart';
import 'package:crm_smart/model/commentmodel.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_uitil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class cardcomment extends StatelessWidget {
   cardcomment({ required this.commentmodel, Key? key}) : super(key: key);
   CommentModel commentmodel;
  @override
  Widget build(BuildContext context) {
    return   Padding(
        padding: EdgeInsets.all(8),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              maxRadius: 30,
              child:
              commentmodel.imgImage.toString().trim().length==0
              // ||usermodell.img_thumbnail.toString().trim().isEmpty
                  ? commentmodel.nameUser.toString().isEmpty||commentmodel.nameUser==null
                  ? Icon(
                Icons.person,
                size: 50,
                color: Colors.lightBlueAccent,
              ) : Text(commentmodel.nameUser.toString().substring(0, 1))
                  : CachedNetworkImage(
                placeholder: (context, url) =>
                const CircularProgressIndicator(),
                imageUrl: commentmodel.imgImage,
              ),
              // CachedNetworkImage(
              //   progressIndicatorBuilder: (context, url, progress) => Center(
              //     child: CircularProgressIndicator(
              //       value: progress.progress,
              //     ),
              //   ),
              //   imageUrl:usermodell.img_image!
              //    ),
              //Image.network(usermodell.img_image!, height: 150, width: 150, fit: BoxFit.cover,) ,
              // :  FileImage(
              //   File(
              //   //Provider.of<user_vm_provider>(context,listen: false)
              //   usermodell.img_thumbnail!)) as Widget ,//as ImageProvider,
              // backgroundColor: Colors.grey.withOpacity(0.1),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.only(bottomRight: Radius.circular(30)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 8.0,
                    color: Colors.black87.withOpacity(0.2),
                  ),
                ],
                color: Colors.black12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      TextUtilis(
                        color: Colors.black87,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        textstring: commentmodel.date_comment.toString(),
                        underline: TextDecoration.none,
                      ),
                      TextUtilis(
                        color: Colors.black87,
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                        textstring: commentmodel.nameUser.toString(),
                        underline: TextDecoration.none,
                      ),
                    ],
                  ),
                  TextUtilis(
                    color: Colors.black87,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    textstring: commentmodel.content,
                    underline: TextDecoration.none,
                  ),

                ],
              ),
            ),

            // Icon(
            //   Icons.arrow_back_ios_new_outlined,
            //   color: Colors.black54,
            // ),
          ],
        ),
      );
  }
}
