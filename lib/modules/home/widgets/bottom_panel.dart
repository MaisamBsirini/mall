import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mall/modules/home/controllers/explorer_controller.dart';
import 'package:mall/modules/home/widgets/service_card.dart';

class BottomPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ExplorerController>();

    return DraggableScrollableSheet(
      initialChildSize: 0.25,
      minChildSize: 0.2,
      maxChildSize: 0.6,

      builder: (_, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),

          child: Column(
            children: [
              SizedBox(height: 10),

              /// handle
              Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              SizedBox(height: 10),

              /// stores carousel
              Expanded(
                child: Obx(() {
                  final services = controller.currentArea.value?.services ?? [];

                  return PageView.builder(
                    controller: PageController(viewportFraction: 0.75),
                    itemCount: services.length,

                    itemBuilder: (_, index) {
                      return ServiceCard(service: services[index]);
                    },
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }
}
