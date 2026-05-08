import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mall/modules/home/controllers/explorer_controller.dart';

class Area3DView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ExplorerController>();
    final size = MediaQuery.of(context).size;

    return Obx(() {
      final area = controller.currentArea.value;
      if (area == null) return SizedBox();

      return AnimatedSwitcher(
        duration: Duration(milliseconds: 500),

        child: Container(
          key: ValueKey(area.id),
          height: size.height * 0.4,

          child: Stack(
            children: [
              /// background image + perspective
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateX(0.9),

                child: Image.network(
                  area.image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              /// title overlay
              Positioned(
                top: 40,
                left: 20,
                child: Text(
                  "${area.name} . ${area.usageType}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              /// animated pin
              AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,

                left: area.pinX * size.width,
                top: area.pinY * size.height * 0.4,

                child: Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}