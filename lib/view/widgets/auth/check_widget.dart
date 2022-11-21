import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myproject/logic/controllers/auth_controller.dart';
import 'package:myproject/utils/theme.dart';

import '../text_utils.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({Key? key}) : super(key: key);
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) {
      return Row(
        children: [
          InkWell(
            onTap: () {
              controller.checkBox();
            },
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: controller.isCheckBox
                  ? Get.isDarkMode
                      ? const Icon(
                          Icons.done,
                          size: 30,
                          color: pinkColor,
                        )
                      : Image.asset('assets/images/check.png')
                  : Container(),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Row(
            children: [
              TextUtils(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                txet: 'I accept ',
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underline: TextDecoration.none,
              ),
              TextUtils(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                txet: 'term & condition',
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underline: TextDecoration.underline,
              ),
            ],
          ),
        ],
      );
    });
  }
}
