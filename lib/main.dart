import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mall/demo/ui_showcase_screen.dart';
import 'package:mall/modules/home/views/store_products_view.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: "/showcase",

      getPages: [
        GetPage(
          name: "/showcase",
          page: () => const UiShowcaseScreen(),
        ),
        GetPage(
          name: "/products",
          page: () => const StoreProductsView(),
        ),
      ],
    );
  }
}