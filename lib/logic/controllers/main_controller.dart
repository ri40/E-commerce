import 'package:get/get.dart';
import 'package:myproject/view/screens/category_scrren.dart';
import 'package:myproject/view/screens/favorites_scrren.dart';
import 'package:myproject/view/screens/home_screen.dart';
import 'package:myproject/view/screens/settings_secreen.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  final tabs = [
    HomeScreen(),
    CategoryScreen(),
    FavoritesScreen(),
    SettingScreen(),
  ].obs;

  final title = [
    'Asroo Shop',
    'Categories',
    'Favorites',
    'Setting'
  ].obs;
}
