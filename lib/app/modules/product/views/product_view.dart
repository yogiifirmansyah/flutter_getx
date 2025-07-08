import 'package:flutter/material.dart';
import 'package:flutter_getx/app/modules/product/controllers/cart_controller.dart';
import 'package:flutter_getx/app/modules/product/controllers/product_controller.dart';
import 'package:get/get.dart';

class ProductView extends StatelessWidget {
  final ProductController productController = Get.find<ProductController>();
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('/cart');
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: productController.products.length,
          itemBuilder: (context, index) {
            final product = productController.products[index];

            return ListTile(
              title: Text(product.name),
              subtitle: Text('\$${product.price.toString()}'),
              trailing: IconButton(
                onPressed: () {
                  cartController.addToCart(product);
                  // Get.snackbar('Add to cart', '${product.name} added to cart');
                  Get.snackbar(
                    'Add to cart',
                    '${product.name} added to cart',
                    duration: Duration(seconds: 2),
                    snackPosition: SnackPosition.BOTTOM,
                    icon: Icon(Icons.shopping_cart_checkout),
                    margin: EdgeInsets.only(bottom: 12, left: 8, right: 8),
                  );
                },
                icon: Icon(Icons.add_shopping_cart),
              ),

              onTap: () {
                Get.toNamed('/product-details', arguments: product);
              },
            );
          },
        );
      }),
    );
  }
}
