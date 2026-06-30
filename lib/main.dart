import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:mall/modules/floors/bindings/floors_binding.dart';
import 'package:mall/modules/floors/views/floors_page.dart';
import 'package:mall/modules/home/views/store_products_view.dart';
import 'package:mall/modules/marketplace_home/bindings/marketplace_home_binding.dart';
import 'package:mall/modules/marketplace_home/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('en'),
      fallbackLocale: const Locale('en'),
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialRoute: '/home',
      getPages: [
        GetPage(
          name: '/home',
          page: () => const HomePageShell(),
          binding: MarketplaceHomeBinding(),
        ),
        GetPage(
          name: '/home/ar',
          page: () => const HomePageShell(locale: Locale('ar')),
          binding: MarketplaceHomeBinding(),
        ),
        GetPage(
          name: '/floors',
          page: () => const FloorsPageShell(),
          binding: FloorsBinding(),
        ),
        GetPage(
          name: '/floors/ar',
          page: () => const FloorsPageShell(locale: Locale('ar')),
          binding: FloorsBinding(),
        ),
        GetPage(
          name: '/products',
          page: () => const StoreProductsView(),
        ),
      ],
    );
  }
}
