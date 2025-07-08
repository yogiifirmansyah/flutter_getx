import 'package:flutter_getx/app/modules/product/models/product_model.dart';
import 'package:flutter_getx/app/services/product_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController {
  final storage = GetStorage();
  var productLists = <ProductModel>[].obs;
  var errorMessage = ''.obs;
  var isLoading = true.obs;

  final ProductService productService;

  ProductController({required this.productService});

  @override
  void onInit() {
    fetchProducts();

    List? storedProducts = storage.read<List>('productList');
    if (storedProducts != null) {
      productLists.assignAll(
        storedProducts.map((e) => ProductModel.fromJson(e)).toList(),
      );
    }

    ever(productLists, (callback) {
      storage.write(
        'productList',
        productLists.map((element) => element.toJson()).toList(),
      );
    });

    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      errorMessage('');
      var products = await productService.fetchProducts();
      productLists.assignAll(products);
    } catch (e) {
      errorMessage('Failed to fetch products');
    } finally {
      isLoading(false);
    }
  }
}
