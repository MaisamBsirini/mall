import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../controllers/store_preview_controller.dart';
import 'store_card.dart';

class StoreCarousel extends StatelessWidget {
  const StoreCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.find<StorePreviewController>();

    return Obx(() {
      return PageView.builder(
        controller: controller.pageController,

        padEnds: false,

        physics: const BouncingScrollPhysics(),

        onPageChanged: controller.changeStore,

        itemCount: controller.stores.length,

        itemBuilder: (_, index) {
          final store = controller.stores[index];

          final isActive =
              controller.selectedStoreIndex.value ==
                  index;

          return Padding(
            padding: EdgeInsets.only(
              bottom: AppSizes.h(context, 0.02),
            ),

            child: StoreCard(
              store: store,
              isActive: isActive,
            ),
          );
        },
      );
    });
  }
}