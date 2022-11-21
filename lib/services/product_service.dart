import 'package:http/http.dart' as http;

import '../model/product_models.dart';
import '../utils/my_string.dart';

class ProductServices {
  static Future<List<ProdcuctModels>> getProduct() async {
    var response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return prodcuctModelsFromJson(jsonData);
    } else {
      return throw Exception('Failed to load product...');
    }
  }
}
