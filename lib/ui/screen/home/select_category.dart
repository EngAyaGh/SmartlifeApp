import 'package:crm_smart/constants.dart';
import 'package:crm_smart/constantsList.dart';
import 'package:crm_smart/ui/screen/home/this_title_category.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectCategory extends StatelessWidget {
  final int index;
  final List list;

  const SelectCategory({required this.index, required this.list, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(itemCategory[index]),
        centerTitle: true,
        backgroundColor: kMainColor,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 40),
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return buildSelectCategory(
                title: list[index],
                onTap: () {
                  Get.to(() => ThisTitleCategory(
                        // userModel: controllerUsers.usersList[index],
                        index: index,
                        list: list,
                      ));
                });
          },
        ),
      ),
      //  ListView.separated(
      //     scrollDirection: Axis.vertical,
      //     itemBuilder: (context, index) {
      //       return buildSelectCategory(
      //           title: listSelectCategory[index],
      //           onTap: () {
      //             Get.to(() => ThisTitleCategory(
      //                   // userModel: controllerUsers.usersList[index],
      //                   index: index,
      //                 ));
      //           });
      //     },
      //     separatorBuilder: (context, index) {
      //       return SizedBox();
      //       //  Divider(
      //       //   color: Colors.grey,
      //       //   thickness: 1,
      //       // );
      //     },
      //     itemCount: listSelectCategory.length),
    );
  }

  Widget buildSelectCategory({
    required String title,
    required Function() onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
        bottom: 30,
      ),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: InkWell(
          onTap: onTap,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Text(title),
                  ),
                  Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black38,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
