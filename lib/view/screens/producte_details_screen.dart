import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproject/model/product_models.dart';

import '../widgets/productDetalis/addd_cart.dart';
import '../widgets/productDetalis/clothes_info.dart';
import '../widgets/productDetalis/image_shader.dart';
import '../widgets/productDetalis/size_list.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProdcuctModels prodcuctModels;

  const ProductDetailsScreen({
    required this.prodcuctModels,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageShaders(
                imageUrl: prodcuctModels.image,
              ),
              ClothesInfo(
                title: prodcuctModels.title,
                productId: prodcuctModels.id,
                rate: prodcuctModels.rating.rate,
                description: prodcuctModels.description,
              ),
              SizeList(),
              AddCart(
                prodcuctModels: prodcuctModels,
                price: prodcuctModels.price,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
