import 'package:flutter/material.dart';
import 'package:flutter_getx/app/modules/product/controllers/cart_controller.dart';
import 'package:flutter_getx/app/modules/product/models/product_model.dart';
import 'package:get/get.dart';

class ProductDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments;

    // Ensure Get.arguments is of correct type
    if (arguments == null || arguments is! ProductModel) {
      // Optional: Show a fallback page or an error message
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.offNamed('/product'); // Redirect to product list
      });
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final ProductModel product = arguments;
    final CartController cartController = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('product_details'.tr),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('/cart');
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(product.title, style: TextStyle(fontSize: 24)),
            const SizedBox(height: 10),
            Text('\$${product.price}', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                cartController.addToCart(product);
                Get.snackbar(
                  'add_to_cart'.tr,
                  '${product.title} added to your cart',
                );
              },
              child: Text('add_to_cart'.tr),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Get.bottomSheet(
                  Container(
                    color: Colors.white,
                    child: Wrap(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.shopping_cart),
                          title: Text('View cart'),
                          onTap: () {
                            Get.toNamed('/cart');
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.payment),
                          title: Text('Proceed to payment'),
                          onTap: () {
                            Get.offNamed('/checkout');
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: Text('More Actions'),
            ),
          ],
        ),
      ),
    );
  }
}
