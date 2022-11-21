import 'package:get/get.dart';
import 'package:myproject/logic/controllers/main_controller.dart';

import '../controllers/setting_contoller.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(MainController());
    Get.put(SettingController());
  }

}