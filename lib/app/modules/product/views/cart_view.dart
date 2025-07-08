import 'package:flutter/material.dart';
import 'package:flutter_getx/app/modules/product/controllers/cart_controller.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: cartController.cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartController.cartItems[index];

                  return ListTile(
                    title: Text(item.title),
                    subtitle: Text('\$${item.price.toString()}'),
                    trailing: IconButton(
                      onPressed: () {
                        Get.defaultDialog(
                          title: 'Remove item',
                          middleText:
                              "Are you sure want to remove ${item.title} from cart?",
                          textConfirm: 'Yes',
                          textCancel: 'No',
                          onConfirm: () {
                            cartController.removeFromCart(item);
                            Get.back();
                          },
                        );
                      },
                      icon: Icon(Icons.remove_circle_outline),
                    ),
                  );
                },
              );
            }),
          ),
          Obx(() {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    'Total: \$${cartController.totalAmount.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 24),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.offNamed('/checkout');
                    },
                    child: Text('Proceed to checkout'),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
