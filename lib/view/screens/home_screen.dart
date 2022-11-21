import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproject/utils/theme.dart';
import 'package:myproject/view/widgets/home/card_items.dart';
import 'package:myproject/view/widgets/text_utils.dart';

import '../widgets/home/search_text_form.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                color: Get.isDarkMode ? darkGreyClr : mainColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtils(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      txet: 'Find Your',
                      color: Colors.white,
                      underline: TextDecoration.none,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextUtils(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      txet: 'INSPIRATION',
                      color: Colors.white,
                      underline: TextDecoration.none,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SearchFromText(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: TextUtils(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  txet: 'Categories',
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underline: TextDecoration.none,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            CardItems(),
          ],
        ),
      ),
    );
  }
}
