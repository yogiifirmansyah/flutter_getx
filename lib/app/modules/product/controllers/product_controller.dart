import 'package:flutter_getx/app/modules/product/models/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var products = <ProductModel>[].obs;

  @override
  void onInit() {
    products.addAll([
      ProductModel(name: 'Product 1', price: 29.99),
      ProductModel(name: 'Product 2', price: 29.99),
      ProductModel(name: 'Product 3', price: 29.99),
      ProductModel(name: 'Product 4', price: 29.99),
      ProductModel(name: 'Product 5', price: 29.99),
    ]);
    super.onInit();
  }
}
