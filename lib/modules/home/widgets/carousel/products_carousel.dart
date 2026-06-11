import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/store_products_controller.dart';
import 'product_card.dart';

class ProductsCarousel
    extends StatelessWidget {
  const ProductsCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.find<StoreProductsController>();

    return Obx(
      () => PageView.builder(
        controller:
            controller.pageController,

        itemCount:
            controller.products.length,

        onPageChanged:
            controller.changeProduct,

        itemBuilder: (_, index) {
          final product =
              controller.products[index];

          final isActive =
              controller.selectedIndex.value ==
                  index;

          return ProductCard(
            product: product,
            isActive: isActive,
          );
        },
      ),
    );
  }
}