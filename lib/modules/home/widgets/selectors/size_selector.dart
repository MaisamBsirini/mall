import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/store_products_controller.dart';
import 'size_chip.dart';

class SizeSelector
    extends StatelessWidget {
  const SizeSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.find<StoreProductsController>();

    return Obx(() {
      final product =
          controller.currentProduct;

      return Row(
        mainAxisAlignment:
            MainAxisAlignment.center,

        children:
            product.sizes.map((size) {
          return Obx(() {
            final isSelected =
                controller.selectedSize.value ==
                    size;

            return SizeChip(
              title: size,
              isSelected: isSelected,

              onTap: () {
                controller.selectSize(
                  size,
                );
              },
            );
          });
        }).toList(),
      );
    });
  }
}