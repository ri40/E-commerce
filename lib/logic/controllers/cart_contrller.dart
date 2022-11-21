import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/product_models.dart';
import '../../routes/routes.dart';
import '../../utils/theme.dart';

class CartController extends GetxController {
  var productMap = {}.obs;

  void addProductToCart(ProdcuctModels prodcuctModels) {
    if (productMap.containsKey(prodcuctModels)) {
      productMap[prodcuctModels] += 1;
    } else {
      productMap[prodcuctModels] = 1;
    }
  }

  void removeProductsFromCart(ProdcuctModels prodcuctModels) {
    if (productMap.containsKey(prodcuctModels) &&
        productMap[prodcuctModels] == 1) {
      productMap.removeWhere((key, value) => key == prodcuctModels);
    } else {
      productMap[prodcuctModels] -= 1;
    }
  }

  void removeOneProduct(ProdcuctModels prodcuctModels) {
    productMap.removeWhere((key, value) => key == prodcuctModels);
  }

  void clearAllProducts() {
    Get.defaultDialog(
      title: 'Clean Products',
      titleStyle: TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      middleText: 'Are you sure you need clear products',
      middleTextStyle: TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Colors.grey,
      radius: 10,
      textCancel: 'No',
      cancelTextColor: Colors.white,
      textConfirm: 'YES',
      confirmTextColor: Colors.white,
      onCancel: () {
        Get.toNamed(Routes.cartScreen);
      },
      onConfirm: () {
        productMap.clear();
        Get.back();
      },
      buttonColor: Get.isDarkMode ? pinkColor : mainColor,
    );
  }

  get productSubTotal =>
      productMap.entries.map((e) => e.key.price * e.value).toList();

  get total => productMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  int quantity() {
    if (productMap.isEmpty) {
      return 0;
    } else {
      return productMap.entries
          .map((e) => e.value)
          .toList()
          .reduce((value, element) => value + element);
    }
  }
}
