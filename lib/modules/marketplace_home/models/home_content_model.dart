import 'home_banner_model.dart';
import 'home_category_model.dart';
import 'home_product_model.dart';

class HomeContentModel {
  final List<HomeBannerModel> banners;
  final List<HomeCategoryModel> categories;
  final List<HomeProductModel> products;
  final int notificationCount;

  const HomeContentModel({
    required this.banners,
    required this.categories,
    required this.products,
    required this.notificationCount,
  });

  factory HomeContentModel.fromJson(Map<String, dynamic> json) {
    return HomeContentModel(
      banners: (json['banners'] as List<dynamic>)
          .map((e) => HomeBannerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => HomeCategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      products: (json['products'] as List<dynamic>)
          .map((e) => HomeProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      notificationCount: json['notification_count'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        'banners': banners.map((e) => e.toJson()).toList(),
        'categories': categories.map((e) => e.toJson()).toList(),
        'products': products.map((e) => e.toJson()).toList(),
        'notification_count': notificationCount,
      };
}
