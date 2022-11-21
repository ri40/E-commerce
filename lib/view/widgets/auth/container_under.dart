import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproject/utils/theme.dart';

import '../text_utils.dart';

class ContainerUnder extends StatelessWidget {
  final String text;
  final String textType;
  final Function() onPressed;

  const ContainerUnder({
    required this.text,
    required this.textType,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Get.isDarkMode ? pinkColor : mainColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            txet: text,
            color: Colors.white,
            underline: TextDecoration.none,
          ),
          TextButton(
            onPressed: onPressed,
            child: TextUtils(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              txet: textType,
              color: Colors.white,
              underline: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
