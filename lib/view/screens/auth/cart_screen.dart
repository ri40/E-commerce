import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproject/logic/controllers/cart_contrller.dart';
import 'package:myproject/utils/theme.dart';

import '../../widgets/cart/cart_product.dart';
import '../../widgets/cart/cart_total.dart';
import '../../widgets/cart/empty_cart.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: Text('Cart Item'),
          elevation: 0,
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                controller.clearAllProducts();
              },
              icon: Icon(Icons.backspace),
            ),
          ],
        ),
        body: Obx(
          () {
            if (controller.productMap.isEmpty) {
              return EmptyCart();
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 600,
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return CartProductCard(
                            index: index,
                            prodcuctModels:
                                controller.productMap.keys.toList()[index],
                            quantity:
                                controller.productMap.values.toList()[index],
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          height: 20,
                        ),
                        itemCount: controller.productMap.length,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: CartTotal(),
                    )
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
