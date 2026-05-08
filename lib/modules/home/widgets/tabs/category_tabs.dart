import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../controllers/store_preview_controller.dart';
import 'category_tab_item.dart';

class CategoryTabs extends StatelessWidget {
  const CategoryTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StorePreviewController>();

    final categories = [
      "Hair",
      "Spa",
      "Brows",
    ];

    return Container(
      height: AppSizes.h(context, 0.075),

      margin: EdgeInsets.symmetric(
        horizontal: AppSizes.w(context, 0.04),
      ),

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.72),

        borderRadius: BorderRadius.circular(28),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 25,
            offset: const Offset(0, -5),
          ),
        ],

        border: Border.all(
          color: Colors.white.withOpacity(0.55),
        ),
      ),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),

        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10,
            sigmaY: 10,
          ),

          child: ListView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.w(context, 0.03),
            ),

            scrollDirection: Axis.horizontal,

            itemCount: categories.length,

            itemBuilder: (_, index) {
              final category = categories[index];

              return Obx(() {
                final isSelected =
                    controller.selectedCategory.value ==
                        category;

                return CategoryTabItem(
                  title: category,
                  isSelected: isSelected,

                  onTap: () {
                    controller.selectCategory(category);
                  },
                );
              });
            },
          ),
        ),
      ),
    );
  }
}