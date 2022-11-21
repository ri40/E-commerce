import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproject/logic/controllers/cart_contrller.dart';
import 'package:myproject/utils/theme.dart';
import 'package:myproject/view/widgets/text_utils.dart';

class CartTotal extends StatelessWidget {
  CartTotal({Key? key}) : super(key: key);

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.all(25),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  txet: 'Total',
                  color: Colors.grey,
                  underline: TextDecoration.none,
                ),
                Text(
                  '\$ ${controller.total}',
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: SizedBox(
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0,
                    primary: Get.isDarkMode ? pinkColor : mainColor,
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Check Out  ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Icon(
                        Icons.shopping_cart,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
