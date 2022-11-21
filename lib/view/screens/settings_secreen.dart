import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproject/view/widgets/text_utils.dart';

import '../../utils/theme.dart';
import '../../utils/theme.dart';
import '../widgets/setting/dark_mode_widget.dart';
import '../widgets/setting/language_widget.dart';
import '../widgets/setting/logout_widgit.dart';
import '../widgets/setting/profile_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: ListView(
        padding: EdgeInsets.all(24),
        children: [
          ProfileWidget(),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Get.isDarkMode ? Colors.white : Colors.grey,
            thickness: 2,
          ),
          SizedBox(
            height: 20,
          ),
          TextUtils(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            txet: 'GENERAL'.tr,
            color: Get.isDarkMode ? pinkColor : mainColor,
            underline: TextDecoration.none,
          ),
          SizedBox(
            height: 20,
          ),
          DarkModeWidget(),
          SizedBox(
            height: 20,
          ),
          LanguageWidget(),
          SizedBox(
            height: 20,
          ),
          LogOutWidget(),
        ],
      ),
    );
  }
}
