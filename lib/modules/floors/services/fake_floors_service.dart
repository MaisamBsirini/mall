import 'floors_service.dart';

class FakeFloorsService implements FloorsService {
  @override
  Future<Map<String, dynamic>> fetchFloorsContent() async {
    await Future<void>.delayed(const Duration(milliseconds: 80));
    return _contentJson;
  }

  static const _contentJson = {
    'floors': [
      {
        'id': 'floor_g',
        'title_en': 'Ground Floor',
        'title_ar': 'الطابق الأرضي',
        'zones': [
          {
            'id': 'zone_fashion',
            'name_en': 'Fashion Avenue',
            'name_ar': 'جادة الأزياء',
            'type': 'stores',
            'icon_key': 'checkroom',
            'gradient_start': '#F5EBE3',
            'gradient_end': '#E8D5C8',
          },
          {
            'id': 'zone_beauty',
            'name_en': 'Beauty Lounge',
            'name_ar': 'ردهة التجميل',
            'type': 'services',
            'icon_key': 'face_retouching',
            'gradient_start': '#F3EAE4',
            'gradient_end': '#DECFC4',
          },
          {
            'id': 'zone_jewelry',
            'name_en': 'Jewelry Court',
            'name_ar': 'ساحة المجوهرات',
            'type': 'stores',
            'icon_key': 'shopping_bag',
            'gradient_start': '#EFE6DE',
            'gradient_end': '#D9C8BA',
          },
        ],
      },
      {
        'id': 'floor_1',
        'title_en': 'First Floor',
        'title_ar': 'الطابق الأول',
        'zones': [
          {
            'id': 'zone_electronics',
            'name_en': 'Tech Hub',
            'name_ar': 'مركز التقنية',
            'type': 'stores',
            'icon_key': 'smartphone',
            'gradient_start': '#EDE8E4',
            'gradient_end': '#D8CEC6',
          },
          {
            'id': 'zone_dining',
            'name_en': 'Dining Terrace',
            'name_ar': 'تراس المطاعم',
            'type': 'services',
            'icon_key': 'restaurant_menu',
            'gradient_start': '#F2ECE6',
            'gradient_end': '#E0D2C6',
          },
        ],
      },
      {
        'id': 'floor_2',
        'title_en': 'Second Floor',
        'title_ar': 'الطابق الثاني',
        'zones': [
          {
            'id': 'zone_home',
            'name_en': 'Home & Living',
            'name_ar': 'المنزل والمعيشة',
            'type': 'stores',
            'icon_key': 'chair',
            'gradient_start': '#F0EBE6',
            'gradient_end': '#DDD0C4',
          },
          {
            'id': 'zone_spa',
            'name_en': 'Wellness Spa',
            'name_ar': 'سبا العافية',
            'type': 'services',
            'icon_key': 'spa',
            'gradient_start': '#EDE6E1',
            'gradient_end': '#D4C4BA',
          },
          {
            'id': 'zone_kids',
            'name_en': 'Kids World',
            'name_ar': 'عالم الأطفال',
            'type': 'stores',
            'icon_key': 'local_florist',
            'gradient_start': '#F4EDE8',
            'gradient_end': '#E2D4CA',
          },
        ],
      },
    ],
    'interstitial_badges': [],
  };
}
