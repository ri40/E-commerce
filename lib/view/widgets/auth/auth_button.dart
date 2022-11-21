import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myproject/utils/theme.dart';
import 'package:myproject/view/widgets/text_utils.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const AuthButton({
    required this.text,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Get.isDarkMode ? pinkColor : mainColor,
        minimumSize: const Size(360, 50),
      ),
      child: TextUtils(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        txet: 'Sign Up',
        color: Colors.white,
        underline: TextDecoration.none,
      ),
    );
  }
}
