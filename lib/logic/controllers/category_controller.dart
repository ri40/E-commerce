import 'package:get/get.dart';
import 'package:myproject/model/product_models.dart';
import 'package:myproject/services/category_sarvices.dart';

class CategoryController extends GetxController {
  var categoryNameList = <String>[].obs;
  var categoryList = <ProdcuctModels>[].obs;

  var isCategoryLoading = false.obs;
  var isAllCategory = false.obs;

  List<String> imageCategory = [
    "https://fakestoreapi.com/img/81QpkIctqPL._AC_SX679_.jpg",
    "https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg",
    "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg",
    "https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg",
  ].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategories();
  }

  void getCategories() async {
    var categoryName = await CategoryServices.geCategory();
    try {
      isCategoryLoading(true);
      if (categoryName.isNotEmpty) {
        categoryNameList.addAll(categoryName);
      }
    } finally {
      isCategoryLoading(false);
    }
  }

  getAllCategories(String nameCategory) async {
    isAllCategory(true);
    categoryList.value = await AllCategoryServices.geAllCategory(nameCategory);
    isAllCategory(false);
  }

  getCategoryIndex(int index) async {
    var categoryAllName = await getAllCategories(categoryNameList[index]);
    if (categoryAllName.isNotEmpty) {
      categoryList.value = categoryAllName;
    }
  }
}
