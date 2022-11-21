import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/category/category_widget.dart';
import '../widgets/text_utils.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 15, top: 15),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 15, top: 15),
                child: TextUtils(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  txet: 'Category',
                  color:
                  Get.isDarkMode ? Colors.white : Colors.black,
                  underline: TextDecoration.none,
                ),
              ),
            ),
            SizedBox(height: 20,),
            CategoryWidget(),
          ],
        ),
      ),
    );
  }
}
