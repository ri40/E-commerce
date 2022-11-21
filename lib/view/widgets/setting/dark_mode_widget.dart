import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myproject/logic/controllers/setting_contoller.dart';
import 'package:myproject/utils/theme.dart';
import 'package:myproject/view/widgets/text_utils.dart';

import '../../../logic/controllers/theme_controller.dart';

class DarkModeWidget extends StatelessWidget {
  DarkModeWidget({Key? key}) : super(key: key);

  final controller = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildIconwidget(),
          Switch(
            activeTrackColor: Get.isDarkMode ? pinkColor : mainColor,
            activeColor: Get.isDarkMode ? pinkColor : mainColor,
            value: controller.switchValue.value,
            onChanged: (value) {
              ThemeController().changesTheme();
              controller.switchValue.value = value;
            },
          ),
        ],
      ),
    );
  }

  Widget buildIconwidget() {
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: darkSettings,
            ),
            child: Icon(
              Icons.dark_mode,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          TextUtils(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            txet: 'Dark Mode'.tr,
            color: Get.isDarkMode ? Colors.white : Colors.black,
            underline: TextDecoration.none,
          ),
        ],
      ),
    );
  }
}
