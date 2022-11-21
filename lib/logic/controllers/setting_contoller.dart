import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myproject/utils/my_string.dart';

class SettingController extends GetxController {
  var switchValue = false.obs;
  var storage = GetStorage();
  var lanLocal = ene;

  String capitalize(String profileName) {
    return profileName.split(' ').map((name) => name.capitalize).join(' ');
  }

  //Language

  @override
  void onInit() async {
    // TODO: implement onInit
    lanLocal = await getLanguage;
    super.onInit();
  }

  void saveLanguage(String lang) async {
    await storage.write("lang", lang);
  }

  Future<String> get getLanguage async {
    return await storage.read('lang');
  }

  void changeLanguage(String typeLang) {
    saveLanguage(typeLang);
    if (lanLocal == typeLang) {
      return;
    }
    if (lanLocal == frf) {
      lanLocal = frf;
      saveLanguage(frf);
    } else if (typeLang == ara) {
      lanLocal = ara;
      saveLanguage(ara);
    } else {
      lanLocal = ene;
      saveLanguage(ene);
    }
    update();
  }
}
