import 'package:flutter/material.dart';

/// Lightweight bilingual strings for the home screen (no intl dependency).
abstract final class HomeStrings {
  static bool isRtl(BuildContext context) =>
      Directionality.of(context) == TextDirection.rtl;

  static String searchHint(BuildContext context) =>
      isRtl(context) ? 'ابحث عن منتج أو خدمة' : 'Search for a product or service';

  static String categories(BuildContext context) =>
      isRtl(context) ? 'التصنيفات' : 'Categories';

  static String recentlyWatched(BuildContext context) =>
      isRtl(context) ? 'شاهدت مؤخراً' : 'Recently Watched';

  static String viewAll(BuildContext context) =>
      isRtl(context) ? 'عرض الكل' : 'View All';

  static String shopNow(BuildContext context) =>
      isRtl(context) ? 'تسوق الآن' : 'Shop Now';

  static List<({String en, String ar})> navItems = [
    (en: 'Home', ar: 'الرئيسية'),
    (en: 'Floors', ar: 'الطوابق'),
    (en: 'Zones', ar: 'المناطق'),
    (en: 'Stores', ar: 'المتاجر'),
    (en: 'Services', ar: 'الخدمات'),
  ];

  static String navLabel(BuildContext context, int index) {
    final item = navItems[index];
    return isRtl(context) ? item.ar : item.en;
  }
}
