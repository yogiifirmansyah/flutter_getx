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
        if (productController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (productController.errorMessage.isNotEmpty) {
          Future.microtask(() {
            Get.snackbar(
              'Failed',
              productController.errorMessage.value,
              margin: EdgeInsets.all(8),
              snackPosition: SnackPosition.BOTTOM,
            );
            productController.errorMessage.value = ''; // Clear after showing
          });
        }

        return ListView.builder(
          itemCount: productController.productLists.length,
          itemBuilder: (context, index) {
            final product = productController.productLists[index];

            return ListTile(
              title: Text(product.title),
              subtitle: Text('\$${product.price.toString()}'),
              trailing: IconButton(
                onPressed: () {
                  cartController.addToCart(product);
                  // Get.snackbar('Add to cart', '${product.title} added to cart');
                  Get.snackbar(
                    'Add to cart',
                    '${product.title} added to cart',
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
