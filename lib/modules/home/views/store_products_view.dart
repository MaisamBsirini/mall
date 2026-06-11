import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/store_products_controller.dart';
import '../widgets/carousel/products_carousel.dart';
import '../widgets/layout/products_background.dart';
import '../widgets/layout/products_indicator.dart';
import '../widgets/layout/products_top_bar.dart';
import '../widgets/selectors/size_selector.dart';

class StoreProductsView
    extends StatelessWidget {
  const StoreProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(StoreProductsController());

    return Scaffold(
      backgroundColor: Colors.white,

      body: Stack(
        children: [
          const ProductsBackground(),

          SafeArea(
            child: Column(
              children: const [
                ProductsTopBar(),

                Expanded(
                  child: ProductsCarousel(),
                ),

                ProductsIndicator(),

                SizedBox(height: 30),

                SizeSelector(),

                SizedBox(height: 35),
              ],
            ),
          ),
        ],
      ),
    );
  }
}