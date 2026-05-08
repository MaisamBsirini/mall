import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/floor_controller.dart';
import 'floor_widget.dart';

class FloorsStack extends StatelessWidget {
  const FloorsStack({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FloorController>();

    final pageController = PageController(
      viewportFraction: 0.50,
    );

    return Obx(() {
      return PageView.builder(
        scrollDirection: Axis.vertical,
        controller: pageController,

        itemCount: controller.floors.length,

        onPageChanged: controller.changeFloor,

        itemBuilder: (_, index) {
          final floor = controller.floors[index];

          return AnimatedBuilder(
            animation: pageController,

            builder: (_, child) {
              double page = 0;

              if (pageController.hasClients &&
                  pageController.page != null) {
                page = pageController.page!;
              }

              final parallax = page - index;

              return FloorWidget(
                index: index,
                title: floor.name,
                parallax: parallax,
              );
            },
          );
        },
      );
    });
  }
}