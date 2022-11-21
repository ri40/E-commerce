import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproject/logic/controllers/auth_controller.dart';
import 'package:myproject/view/widgets/text_utils.dart';

import '../../../logic/controllers/setting_contoller.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget({Key? key}) : super(key: key);

  final controller = Get.find<SettingController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      authController.displayUserPhoto.value,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtils(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    txet: controller
                        .capitalize(authController.displayUserName.value),
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    underline: TextDecoration.none,
                  ),
                  TextUtils(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    txet: authController.displayUserEmail.value,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    underline: TextDecoration.none,
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
