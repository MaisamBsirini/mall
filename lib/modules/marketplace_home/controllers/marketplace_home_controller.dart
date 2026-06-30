import 'package:get/get.dart';

import '../../shared/navigation/main_nav_routes.dart';
import '../models/home_banner_model.dart';
import '../models/home_category_model.dart';
import '../models/home_product_model.dart';
import '../repositories/marketplace_home_repository.dart';

class MarketplaceHomeController extends GetxController {
  MarketplaceHomeController(this._repository);

  final MarketplaceHomeRepository _repository;

  final isLoading = true.obs;
  final notificationCount = 0.obs;
  final banners = <HomeBannerModel>[].obs;
  final categories = <HomeCategoryModel>[].obs;
  final products = <HomeProductModel>[].obs;
  final favoriteIds = <String>{}.obs;

  static const navIndex = 0;

  @override
  void onInit() {
    super.onInit();
    loadHomeContent();
  }

  Future<void> loadHomeContent() async {
    isLoading.value = true;
    try {
      final content = await _repository.getHomeContent();
      banners.assignAll(content.banners);
      categories.assignAll(content.categories);
      products.assignAll(content.products);
      notificationCount.value = content.notificationCount;
      favoriteIds
        ..clear()
        ..addAll(
          content.products
              .where((product) => product.isFavorite)
              .map((product) => product.id),
        );
    } finally {
      isLoading.value = false;
    }
  }

  void setNavIndex(int index) => MainNavRoutes.goToTab(index);

  bool isFavorite(String productId) => favoriteIds.contains(productId);

  void toggleFavorite(String productId) {
    if (favoriteIds.contains(productId)) {
      favoriteIds.remove(productId);
    } else {
      favoriteIds.add(productId);
    }
  }

  void onViewAllRecentlyWatched() {}

  void onNotificationsTap() {}

  void onProfileTap() {}
}
