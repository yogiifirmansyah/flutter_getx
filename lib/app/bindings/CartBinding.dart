import 'package:flutter_getx/app/modules/product/controllers/cart_controller.dart';
import 'package:get/get.dart';

class Cartbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(() => CartController());
  }
}
