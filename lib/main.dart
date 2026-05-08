import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'modules/home/views/explorer_view.dart';
import 'modules/home/views/home_view.dart';

import 'modules/home/bindings/floor_binding.dart';
import 'modules/home/bindings/explorer_binding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: "/home",

      getPages: [
        GetPage(
          name: "/home",
          page: () => HomeView(),
          binding: FloorBinding(),
        ),

        GetPage(
          name: "/explorer",
          page: () => ExplorerView(),
          binding: ExplorerBinding(),
        ),
      ],
    );
  }
}