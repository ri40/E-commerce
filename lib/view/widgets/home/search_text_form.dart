import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproject/logic/controllers/product_controller.dart';

class SearchFromText extends StatelessWidget {
  SearchFromText({Key? key}) : super(key: key);

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (_) => TextField(
        controller: controller.searchTextController,
        cursorColor: Colors.black,
        keyboardType: TextInputType.text,
        onChanged: (searchName) {
          controller.addSearchToList(searchName);
        },
        decoration: InputDecoration(
          fillColor: Colors.white,
          focusColor: Colors.red,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          suffixIcon: controller.searchTextController.text.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    controller.clearSearch();
                  },
                  icon: Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                )
              : null,
          hintText: "Search whit name & price",
          hintStyle: TextStyle(
            color: Colors.black45,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
