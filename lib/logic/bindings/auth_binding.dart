import 'package:get/instance_manager.dart';

import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(AuthController());
  }
}
