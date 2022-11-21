import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproject/logic/controllers/auth_controller.dart';

import '../../../utils/theme.dart';
import '../text_utils.dart';

class LogOutWidget extends StatelessWidget {
  LogOutWidget({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_) => Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Get.defaultDialog(
              title: 'Logout From App',
              titleStyle: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              middleText: 'Are you sure you need to logout',
              middleTextStyle: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              backgroundColor: Colors.grey,
              radius: 10,
              textCancel: 'No',
              cancelTextColor: Colors.white,
              textConfirm: 'YES',
              confirmTextColor: Colors.white,
              onCancel: () {
                Get.back();
              },
              onConfirm: () {
                controller.signOutFromApp();
              },
              buttonColor: Get.isDarkMode ? pinkColor : mainColor,
            );
          },
          splashColor: Get.isDarkMode
              ? pinkColor.withOpacity(0.8)
              : mainColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(12),
          customBorder: StadiumBorder(),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: logOutSettings,
                ),
                child: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              TextUtils(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                txet: 'Logout'.tr,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underline: TextDecoration.none,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
