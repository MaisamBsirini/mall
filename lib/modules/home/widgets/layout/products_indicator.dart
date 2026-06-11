import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/store_products_controller.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';

class ProductsIndicator
    extends StatelessWidget {
  const ProductsIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.find<StoreProductsController>();

    return Obx(
      () => Row(
        mainAxisAlignment:
            MainAxisAlignment.center,

        children: List.generate(
          controller.products.length,
          (index) {
            final isActive =
                controller.selectedIndex.value ==
                    index;

            return AnimatedContainer(
              duration:
                  const Duration(
                milliseconds: 300,
              ),

              margin:
                  const EdgeInsets.symmetric(
                horizontal: 4,
              ),

              width: isActive ? 24 : 8,

              height: 8,

              decoration: BoxDecoration(
                color: isActive
                    ? AppColors.primary
                    : Colors.grey.shade300,

                borderRadius:
                    BorderRadius.circular(
                  20,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}