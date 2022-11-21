import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproject/logic/controllers/cart_contrller.dart';
import 'package:myproject/model/product_models.dart';
import 'package:myproject/utils/theme.dart';
import 'package:myproject/view/widgets/text_utils.dart';

class AddCart extends StatelessWidget {
  final double price;
  final ProdcuctModels prodcuctModels;

  AddCart({
    required this.price,
    required this.prodcuctModels,
    Key? key,
  }) : super(key: key);

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                txet: 'Price',
                color: Colors.grey,
                underline: TextDecoration.none,
              ),
              Text(
                '\$ $price',
                style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  height: 1.5,
                ),
              )
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
                onPressed: () {
                  controller.addProductToCart(prodcuctModels);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Add to Cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.shopping_cart_outlined,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
