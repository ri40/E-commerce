import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:myproject/logic/controllers/product_controller.dart';
import 'package:myproject/view/screens/auth/login_secreen.dart';
import 'package:myproject/view/screens/auth/signup_secreen.dart';

import '../logic/bindings/auth_binding.dart';
import '../logic/bindings/main_binding.dart';
import '../logic/bindings/product_binding.dart';
import '../view/screens/auth/cart_screen.dart';
import '../view/screens/auth/forgot_password_sceene.dart';
import '../view/screens/main_screen.dart';
import '../view/screens/welcome_secreen.dart';

class AppRoutes {
  // initialRoute
  static const welcome = Routes.welcomeScreen;
  static const mainScreen = Routes.mainScreen;

  // getPages
  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () => MainScreen(),
      bindings: [
        AuthBinding(),
        MainBinding(),
        ProductBinding(),
      ],
    ),
    GetPage(
      name: Routes.cartScreen,
      page: () => CartScreen(),
      bindings:[
        AuthBinding(),
        ProductBinding(),
      ],
    ),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
  static const forgotPasswordScreen = '/forgotPasswordScreen';
  static const mainScreen = '/mainScreen';
  static const cartScreen = '/cartScreen';

}
