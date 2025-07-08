import 'package:get/get.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'hello': "Hello",
      'product_list': 'Product List',
      'add_to_cart': 'Add to Cart',
      'product_details': 'Product Details',
      'price': 'Price',
      'total': 'Total',
      'checkout': 'Checkout',
      'theme': 'Switch Theme',
      'language': 'Switch Language',
    },
    'id_ID': {
      'hello': "Halo",
      'product_list': 'Daftar Produk',
      'add_to_cart': 'Tambah ke Keranjang',
      'product_details': 'Detail Produk',
      'price': 'Harga',
      'total': 'Total',
      'checkout': 'Pembayaran',
      'theme': 'Ganti Tema',
      'language': 'Ganti Bahasa',
    },
  };
}
