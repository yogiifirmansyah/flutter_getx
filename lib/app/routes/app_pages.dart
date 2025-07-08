import 'package:flutter_getx/app/bindings/CartBinding.dart';
import 'package:flutter_getx/app/bindings/ProductBinding.dart';
import 'package:flutter_getx/app/modules/product/views/cart_view.dart';
import 'package:flutter_getx/app/modules/product/views/checkout_view.dart';
import 'package:flutter_getx/app/modules/product/views/product_detail_view.dart';
import 'package:flutter_getx/app/modules/product/views/product_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.PRODUCT,
      page: () => ProductView(),
      bindings: [Productbinding(), Cartbinding()],
    ),
    GetPage(
      name: Routes.PRODUCT_DETAILS,
      page: () => ProductDetailView(),
      binding: Cartbinding(),
    ),
    GetPage(name: Routes.CART, page: () => CartView()),
    GetPage(name: Routes.CHECKOUT, page: () => CheckoutView()),
  ];
}
