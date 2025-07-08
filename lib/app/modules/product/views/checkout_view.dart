import 'package:flutter/material.dart';
import 'package:flutter_getx/app/modules/product/controllers/cart_controller.dart';
import 'package:get/get.dart';

class CheckoutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Checkout')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text('Thank you for your purchase', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final CartController cartController =
                    Get.find<CartController>();

                cartController.cartService.clearCart();

                Get.offAllNamed('/product');
              },
              child: Text('Go to home page'),
            ),
          ],
        ),
      ),
    );
  }
}
