import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/store_preview_controller.dart';
import '../widgets/carousel/store_carousel.dart';
import '../widgets/preview/store_preview_header.dart';
import '../widgets/tabs/category_tabs.dart';

class StorePreviewView extends StatelessWidget {
  const StorePreviewView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(StorePreviewController());

    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: const [
          Expanded(flex: 3, child: StorePreviewHeader()),

          CategoryTabs(),

          Expanded(flex: 4, child: StoreCarousel()),
        ],
      ),
    );
  }
}
