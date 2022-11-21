import 'package:get/get.dart';
import 'package:myproject/logic/controllers/cart_contrller.dart';
import 'package:myproject/logic/controllers/category_controller.dart';
import 'package:myproject/logic/controllers/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ProductController());
    Get.lazyPut(
      () => CartController(),
    );
    Get.put(CategoryController());
  }
}
