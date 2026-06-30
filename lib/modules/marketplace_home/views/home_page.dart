import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/marketplace_home_controller.dart';
import '../theme/home_colors.dart';
import '../theme/home_layout_metrics.dart';
import '../widgets/banner_section.dart';
import '../widgets/categories_section.dart';
import '../widgets/home_bottom_nav_bar.dart';
import '../widgets/home_decorative_background.dart';
import '../widgets/recently_watched_section.dart';
import '../widgets/top_bar_section.dart';

class HomePage extends GetView<MarketplaceHomeController> {
  const HomePage({super.key});

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
              final cardHeight =
                  metrics.computeRecentCardHeight(constraints.maxHeight);

              return Stack(
                children: [
                  const Positioned.fill(child: HomeDecorativeBackground()),
                  Padding(
                    padding: EdgeInsets.only(bottom: metrics.bottomClearance),
                    child: Column(
                      children: [
                        SizedBox(height: metrics.topBreathing),
                        TopBarSection(
                          notificationCount: controller.notificationCount.value,
                          onNotificationsTap: controller.onNotificationsTap,
                          onProfileTap: controller.onProfileTap,
                        ),
                        SizedBox(height: gap),
                        BannerSection(banners: controller.banners),
                        SizedBox(height: metrics.gapAfterBanner),
                        CategoriesSection(categories: controller.categories),
                        SizedBox(height: metrics.gapAfterCategories),
                        RecentlyWatchedSection(
                          products: controller.products,
                          cardHeight: cardHeight,
                          favoriteIds: controller.favoriteIds,
                          onFavoriteToggle: controller.toggleFavorite,
                          onViewAll: controller.onViewAllRecentlyWatched,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: HomeBottomNavBar(
                      currentIndex: MarketplaceHomeController.navIndex,
                      onTap: controller.setNavIndex,
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

/// Locale-aware shell with GetX binding for the home feature.
class HomePageShell extends StatelessWidget {
  final Locale locale;

  const HomePageShell({
    super.key,
    this.locale = const Locale('en'),
  });

  @override
  Widget build(BuildContext context) {
    final direction =
        locale.languageCode == 'ar' ? TextDirection.rtl : TextDirection.ltr;

    return Directionality(
      textDirection: direction,
      child: const HomePage(),
    );
  }
}
