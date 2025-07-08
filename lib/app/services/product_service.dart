import 'dart:convert';
import 'package:flutter_getx/app/modules/product/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  final String apiUrl = 'https://fakestoreapi.com/products';

  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List data = json.decode(response.body);

      return data
          .map((productJson) => ProductModel.fromJson(productJson))
          .toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
