import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myproject/logic/controllers/cart_contrller.dart';
import 'package:myproject/logic/controllers/main_controller.dart';
import 'package:myproject/utils/theme.dart';

import '../../routes/routes.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final controller = Get.find<MainController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            elevation: 0,
            leading: Container(),
            actions: [
              Obx(
                () => Badge(
                  position: BadgePosition.topEnd(top: 0, end: 3),
                  animationDuration: Duration(milliseconds: 300),
                  animationType: BadgeAnimationType.slide,
                  badgeContent: Text(
                    cartController.quantity().toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.cartScreen);
                    },
                    icon: Image.asset('assets/images/shop.png'),
                  ),
                ),
              ),
            ],
            backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
            title: Text(controller.title[controller.currentIndex.value]),
            centerTitle: true,
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
            currentIndex: controller.currentIndex.value,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: '',
                activeIcon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ? pinkColor : mainColor,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.category,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: '',
                activeIcon: Icon(
                  Icons.category,
                  color: Get.isDarkMode ? pinkColor : mainColor,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: '',
                activeIcon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ? pinkColor : mainColor,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: '',
                activeIcon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? pinkColor : mainColor,
                ),
              ),
            ],
            onTap: (index) {
              controller.currentIndex.value = index;
            },
          ),
          body: IndexedStack(
            index: controller.currentIndex.value,
            children: controller.tabs.value,
          ),
        );
      }),
    );
  }
}
