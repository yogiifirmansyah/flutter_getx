import 'package:flutter_getx/app/modules/product/controllers/product_controller.dart';
import 'package:get/get.dart';

class Productbinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
  }
}
