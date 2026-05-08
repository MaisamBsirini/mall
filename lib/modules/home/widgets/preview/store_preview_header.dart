import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_sizes.dart';

import '../../controllers/store_preview_controller.dart';

import 'animated_map_pin.dart';
import 'compass_button.dart';
import 'preview_title.dart';
import 'store_background.dart';

class StorePreviewHeader extends StatelessWidget {
  const StorePreviewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StorePreviewController>();

    return Obx(() {
      final store = controller.currentStore;

      return SizedBox(
        height: AppSizes.h(context, 0.02),

        child: Stack(
          children: [
            StoreBackground(
              image: store.image,
            ),

            PreviewTitle(
              title: store.name,
            ),

            AnimatedMapPin(
              x: store.mapX,
              y: store.mapY,
            ),

            Positioned(
              right: AppSizes.w(context, 0.06),
              bottom: AppSizes.h(context, 0.06),

              child: const CompassButton(),
            ),
          ],
        ),
      );
    });
  }
}