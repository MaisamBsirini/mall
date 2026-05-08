import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_sizes.dart';

import '../../controllers/floor_controller.dart';

import '../areas/area_on_floor.dart';

import '../shared/parallax_transform.dart';

import 'floor_highlight.dart';
import 'floor_title.dart';
import 'glass_floor.dart';

class FloorWidget extends StatelessWidget {
  final int index;
  final String title;
  final double parallax;

  const FloorWidget({
    super.key,
    required this.index,
    required this.title,
    required this.parallax,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FloorController>();

    return Obx(() {
      final isActive =
          controller.selectedFloorIndex.value == index;

      final scale = isActive ? 1.0 : 0.9;
      final opacity = isActive ? 1.0 : 0.5;

      return AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: opacity,

        child: AnimatedContainer(
          duration: const Duration(milliseconds: 350),

          margin: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 16,
          ),

          height: AppSizes.h(context, 0.20),

          child: Transform.scale(
            scale: scale,

            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // glass floor
                GlassFloor(
                  isActive: isActive,
                  parallax: parallax,
                ),

                // top highlight
                const FloorHighlight(),

                // floor title
                FloorTitle(
                  title: title,
                  isActive: isActive,
                ),

                // areas cards
                Positioned(
                  top: -30,
                  left: 0,
                  right: 0,

                  child: ParallaxTransform(
                    parallax: parallax,

                    child: AreasOnFloor(
                      isActive: isActive,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}