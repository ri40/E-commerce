import 'package:get/route_manager.dart';
import 'package:myproject/language/ar.dart';
import 'package:myproject/language/en.dart';
import 'package:myproject/language/fr.dart';
import 'package:myproject/utils/my_string.dart';

class LocalizationApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ene: en,
        ara: ar,
        frf: fr,
      };
}
