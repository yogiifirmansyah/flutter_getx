import 'package:flutter_getx/app/modules/product/controllers/product_controller.dart';
import 'package:flutter_getx/app/services/product_service.dart';
import 'package:get/get.dart';

class Productbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductService>(() => ProductService());
    Get.lazyPut(
      () => ProductController(productService: Get.find<ProductService>()),
    );
  }
}
