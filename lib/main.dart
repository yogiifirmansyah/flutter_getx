import 'package:flutter/material.dart';
import 'package:flutter_getx/app/routes/app_pages.dart';
import 'package:flutter_getx/app/services/cart_service.dart';
import 'package:flutter_getx/app/services/theme_service.dart';
import 'package:flutter_getx/app/services/translation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  Get.put(CartService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product App',
      translations: AppTranslation(),
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeService().theme,
      initialRoute: Routes.PRODUCT,
      getPages: AppPages.routes,
    );
  }
}
