import 'marketplace_home_service.dart';

/// Local fake service — returns JSON-shaped maps until Laravel API is connected.
class FakeMarketplaceHomeService implements MarketplaceHomeService {
  @override
  Future<Map<String, dynamic>> fetchHomeContent() async {
    await Future<void>.delayed(const Duration(milliseconds: 80));
    return _homeContentJson;
  }

  static const _homeContentJson = {
    'notification_count': 3,
    'banners': [
      {
        'id': 'bnr_1',
        'title_en': 'Luxury Perfumes',
        'title_ar': 'عطور فاخرة',
        'description_en': 'Discover exclusive fragrances crafted for elegance.',
        'description_ar': 'اكتشف عطوراً حصرية صُنعت للأناقة.',
        'cta_en': 'Shop Now',
        'cta_ar': 'تسوق الآن',
        'tag_en': 'Special Offer',
        'tag_ar': 'عرض خاص',
        'icon_key': 'local_florist',
        'gradient_start': '#E8D5C4',
        'gradient_end': '#D4B896',
      },
      {
        'id': 'bnr_2',
        'title_en': 'Summer Collection',
        'title_ar': 'مجموعة الصيف',
        'description_en': 'Fresh styles and premium picks for the season.',
        'description_ar': 'أناقة صيفية ومنتجات مميزة للموسم.',
        'cta_en': 'Explore',
        'cta_ar': 'استكشف',
        'tag_en': 'New Arrival',
        'tag_ar': 'وصل حديثاً',
        'icon_key': 'wb_sunny',
        'gradient_start': '#F5E6D3',
        'gradient_end': '#E8C9A8',
      },
      {
        'id': 'bnr_3',
        'title_en': 'Wellness Week',
        'title_ar': 'أسبوع العافية',
        'description_en': 'Book premium services at special rates.',
        'description_ar': 'احجز خدمات مميزة بأسعار خاصة.',
        'cta_en': 'Book Now',
        'cta_ar': 'احجز الآن',
        'tag_en': 'Limited Time',
        'tag_ar': 'لفترة محدودة',
        'icon_key': 'spa',
        'gradient_start': '#E5DDD6',
        'gradient_end': '#CDBFB4',
      },
    ],
    'categories': [
      {
        'id': 'cat_restaurants',
        'name_en': 'Restaurants',
        'name_ar': 'مطاعم',
        'icon_key': 'restaurant_menu',
      },
      {
        'id': 'cat_fashion',
        'name_en': 'Fashion',
        'name_ar': 'أزياء',
        'icon_key': 'checkroom',
      },
      {
        'id': 'cat_electronics',
        'name_en': 'Electronics',
        'name_ar': 'إلكترونيات',
        'icon_key': 'smartphone',
      },
      {
        'id': 'cat_beauty',
        'name_en': 'Beauty',
        'name_ar': 'تجميل',
        'icon_key': 'face_retouching',
      },
      {
        'id': 'cat_home',
        'name_en': 'Home',
        'name_ar': 'منزل',
        'icon_key': 'chair',
      },
      {
        'id': 'cat_services',
        'name_en': 'Services',
        'name_ar': 'خدمات',
        'icon_key': 'handyman',
      },
    ],
    'products': [
      {
        'id': 'prd_1',
        'name_en': 'Classic Leather Bag',
        'name_ar': 'حقيبة جلدية كلاسيكية',
        'price': r'$120',
        'rating': 4.5,
        'icon_key': 'shopping_bag',
        'is_favorite': true,
      },
      {
        'id': 'prd_2',
        'name_en': 'Silk Evening Dress',
        'name_ar': 'فستان سهرة حريري',
        'price': r'$89',
        'rating': 4.8,
        'icon_key': 'checkroom',
        'is_favorite': false,
      },
      {
        'id': 'prd_3',
        'name_en': 'Wireless Headphones',
        'name_ar': 'سماعات لاسلكية',
        'price': r'$199',
        'rating': 4.6,
        'icon_key': 'headphones',
        'is_favorite': true,
      },
      {
        'id': 'prd_4',
        'name_en': 'Organic Face Serum',
        'name_ar': 'سيروم وجه عضوي',
        'price': r'$45',
        'rating': 4.9,
        'icon_key': 'water_drop',
        'is_favorite': false,
      },
      {
        'id': 'prd_5',
        'name_en': 'Minimal Desk Lamp',
        'name_ar': 'مصباح مكتب بسيط',
        'price': r'$65',
        'rating': 4.3,
        'icon_key': 'light',
        'is_favorite': false,
      },
    ],
  };
}
