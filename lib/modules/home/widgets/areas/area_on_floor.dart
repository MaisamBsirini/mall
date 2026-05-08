import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/floor_controller.dart';

import 'fancy_area_card.dart';

class AreasOnFloor extends StatelessWidget {
  final bool isActive;

  const AreasOnFloor({
    super.key,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FloorController>();

    return SizedBox(
      height: 140,

      child: Obx(() {
        return ListView.builder(
          scrollDirection: Axis.horizontal,

          itemCount: controller.areas.length,

          itemBuilder: (_, index) {
            final area = controller.areas[index];

            return Transform.scale(
              scale: isActive ? 0.9 : 0.70,

              child: FancyAreaCard(
                area: area,
              ),
            );
          },
        );
      }),
    );
  }
}