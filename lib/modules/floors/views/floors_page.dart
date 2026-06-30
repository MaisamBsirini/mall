import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../marketplace_home/theme/home_colors.dart';
import '../../marketplace_home/theme/home_layout_metrics.dart';
import '../../marketplace_home/widgets/home_bottom_nav_bar.dart';
import '../../marketplace_home/widgets/home_decorative_background.dart';
import '../controllers/floors_controller.dart';
import '../widgets/filter_button.dart';
import '../widgets/floor_card.dart';

class FloorsPage extends GetView<FloorsController> {
  const FloorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomeColors.background,
      body: SafeArea(
        bottom: false,
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(color: HomeColors.primary),
            );
          }

          return LayoutBuilder(
            builder: (context, constraints) {
              final metrics = HomeLayoutMetrics.of(context);
              final gap = metrics.sectionGap;
              final width = MediaQuery.sizeOf(context).width;

              return Stack(
                children: [
                  const Positioned.fill(child: HomeDecorativeBackground()),
                  Padding(
                    padding: EdgeInsets.only(bottom: metrics.bottomClearance),
                    child: Column(
                      children: [
                        SizedBox(height: metrics.topBreathing),
                        FloorsSearchHeader(
                          onFilterTap: controller.onFilterTap,
                        ),
                        SizedBox(height: gap),
                        Expanded(
                          child: ListView.separated(
                            padding: EdgeInsets.only(bottom: width * 0.03),
                            itemCount: controller.floors.length,
                            separatorBuilder: (_, __) =>
                                SizedBox(height: width * 0.074),
                            itemBuilder: (context, index) {
                              return FloorCard(floor: controller.floors[index]);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: HomeBottomNavBar(
                      currentIndex: FloorsController.navIndex,
                      onTap: controller.onNavTap,
                    ),
                  ),
                ],
              );
            },
          );
        }),
      ),
    );
  }
}

class FloorsPageShell extends StatelessWidget {
  final Locale locale;

  const FloorsPageShell({
    super.key,
    this.locale = const Locale('en'),
  });

  @override
  Widget build(BuildContext context) {
    final direction =
        locale.languageCode == 'ar' ? TextDirection.rtl : TextDirection.ltr;

    return Directionality(
      textDirection: direction,
      child: const FloorsPage(),
    );
  }
}
