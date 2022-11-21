import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myproject/services/product_service.dart';

import '../../model/product_models.dart';

class ProductController extends GetxController {
  var productList = <ProdcuctModels>[].obs;
  var favoritesList = <ProdcuctModels>[].obs;
  var isLoading = true.obs;
  var stoarge = GetStorage();

  //Shearch
  var searchList = <ProdcuctModels>[].obs;
  TextEditingController searchTextController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    List? storedShoppings = stoarge.read<List>('isFavouritesList');
    if (storedShoppings != null) {
      favoritesList =
          storedShoppings.map((e) => ProdcuctModels.fromJson(e)).toList().obs;
    }
    getProducts();
  }

  void getProducts() async {
    var products = await ProductServices.getProduct();
    try {
      isLoading(true);
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

//Logic for Favorites Screen
  void manageFavourites(int productId) async {
    var existingIndex =
        favoritesList.indexWhere((element) => element.id == productId);
    // print('==========test=============');
    print(existingIndex);
    // print('==========test=============');
    if (existingIndex >= 0) {
      favoritesList.removeAt(existingIndex);
      await stoarge.remove('isFavouritesList');
    } else {
      favoritesList
          .add(productList.firstWhere((element) => element.id == productId));
      await stoarge.write('isFavouritesList', favoritesList);
    }
  }

  bool isFavourites(int productId) {
    return favoritesList.any((element) => element.id == productId);
  }

//  Search Bar Logic

  void addSearchToList(String searchName) {
    searchName = searchName.toLowerCase();
    searchList.value = productList.where((search) {
      var searchTitle = search.title.toLowerCase();
      var searchPrice = search.price.toString().toLowerCase();
      return searchTitle.contains(searchName) ||
          searchPrice.contains(searchName);
    }).toList();
    update();
  }

  void clearSearch() {
    searchTextController.clear();
    addSearchToList('');
  }
}
