import 'package:http/http.dart' as http;

import '../model/category_model.dart';
import '../model/product_models.dart';
import '../utils/my_string.dart';

class CategoryServices {
  static Future<List<String>> geCategory() async {
    var response = await http.get(Uri.parse('$baseUrl/products/categories'));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return categoryModelsFromJson(jsonData);
    } else {
      return throw Exception('Failed to load category...');
    }
  }
}

class AllCategoryServices {
  static Future<List<ProdcuctModels>> geAllCategory(String categoryNames) async {
    var response = await http.get(Uri.parse('$baseUrl/products/category/$categoryNames'));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return prodcuctModelsFromJson(jsonData);
    } else {
      return throw Exception('Failed to load product...');
    }
  }
}
