import 'package:crm_smart/constants.dart';
import 'package:crm_smart/model/productmodel.dart';
import 'package:crm_smart/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductControllre extends GetxController {
  var productMap = {}.obs;

  void addProductToCart(ProductModel productModels) {
    if (productMap.containsKey(productModels)) {
      productMap[productModels] += 1;
    } else {
      productMap[productModels] = 1;
      // print(productMap.entries.map((e) => e.key.price * e.value).toList());

    }
  }

  void removeOneProduct(ProductModel productModels) {
    Get.defaultDialog(
      backgroundColor: Colors.white,
      radius: 10,
      title: 'clear this product',
      titleStyle: TextStyle(
          fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
      middleText: 'Are you Sure you  need to clear this product',
      middleTextStyle: TextStyle(
          fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
      textCancel: 'No',
      cancelTextColor: Colors.black,
      onCancel: () {
        Get.toNamed(Routes.productview);
      },
      textConfirm: 'Yes',
      confirmTextColor: Colors.black,
      onConfirm: () {
        productMap.removeWhere((key, value) => key == productModels);
        Get.back();
      },
      buttonColor: kMainColor,
    );
  }
}
