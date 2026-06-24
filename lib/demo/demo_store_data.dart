import '../design_system/merchant_design_config.dart';
import '../design_system/registries/palette_ids.dart';
import '../design_system/registries/typography_ids.dart';
import '../sections/merchant_storefront_config.dart';
import '../sections/storefront_section_entry.dart';

/// Fake category entry for demo navigation taps.
class DemoCategory {
  final String id;
  final String name;
  final String icon;

  const DemoCategory({
    required this.id,
    required this.name,
    required this.icon,
  });
}

/// Fake collection entry for demo navigation taps.
class DemoCollection {
  final String id;
  final String name;

  const DemoCollection({
    required this.id,
    required this.name,
  });
}

/// Temporary fake storefront configuration — UI preview only.
///
/// Deliberately uses a non-default section order, mixed styles, and one
/// disabled section to exercise [StorefrontLayoutEngine] resolution.
abstract final class DemoStoreData {
  static const merchantName = 'Lumière Beauty & Wellness';

  static const categories = [
    DemoCategory(id: 'cat_skincare', name: 'Skincare', icon: 'spa_outlined'),
    DemoCategory(
      id: 'cat_wellness',
      name: 'Wellness',
      icon: 'fitness_center_outlined',
    ),
    DemoCategory(
      id: 'cat_fragrance',
      name: 'Fragrance',
      icon: 'local_florist_outlined',
    ),
    DemoCategory(
      id: 'cat_tools',
      name: 'Tools',
      icon: 'brush_outlined',
    ),
  ];

  static const collections = [
    DemoCollection(id: 'col_bestsellers', name: 'Best Sellers'),
    DemoCollection(id: 'col_new', name: 'New Arrivals'),
    DemoCollection(id: 'col_spa', name: 'Spa Essentials'),
    DemoCollection(id: 'col_gifts', name: 'Gift Sets'),
  ];

  /// Fake booking preview labels (visual reference only).
  static const bookingPreview = DemoBookingPreview(
    title: 'Book an Appointment',
    nextSlot: 'Today · 2:30 PM',
    services: ['Hydra Facial', 'LED Therapy', 'Consultation'],
    staff: ['Dr. Amira Hassan', 'Dr. James Chen', 'Sofia Laurent'],
    availableTimes: ['10:00', '11:30', '14:00', '15:30', '17:00'],
  );

  static MerchantStorefrontConfig get config => MerchantStorefrontConfig(
        design: const MerchantDesignConfig(
          paletteId: PaletteId.roseBoutique,
          typographyId: TypographyId.luxuryEditorial,
        ),
        sections: [
          // Intentionally non-sequential order — banner still pins to top.
          const StorefrontSectionEntry(
            id: 'collections',
            name: 'Collections',
            enabled: true,
            order: 2,
            style: 'split_cards',
          ),
          const StorefrontSectionEntry(
            id: 'categories',
            name: 'Categories',
            enabled: true,
            order: 1,
            style: 'honeycomb_categories',
          ),
          const StorefrontSectionEntry(
            id: 'offers',
            name: 'Offers',
            enabled: false,
            order: 3,
            style: 'image_left_strip',
          ),
          const StorefrontSectionEntry(
            id: 'staff',
            name: 'Staff',
            enabled: true,
            order: 4,
            style: 'alternating_staff',
          ),
          const StorefrontSectionEntry(
            id: 'banner',
            name: 'Banner',
            enabled: true,
            order: 8,
            style: 'glass_banner',
          ),
          const StorefrontSectionEntry(
            id: 'booking',
            name: 'Booking',
            enabled: true,
            order: 5,
            style: 'timeline_rail_flow',
          ),
          const StorefrontSectionEntry(
            id: 'reviews',
            name: 'Reviews',
            enabled: true,
            order: 6,
            style: 'editorial_timeline_reviews',
          ),
          const StorefrontSectionEntry(
            id: 'location',
            name: 'Location',
            enabled: true,
            order: 7,
            style: 'location_ribbon',
          ),
          const StorefrontSectionEntry(
            id: 'social_media',
            name: 'Social Media',
            enabled: true,
            order: 9,
            style: 'elegant_card_stack',
          ),
          const StorefrontSectionEntry(
            id: 'certifications',
            name: 'Certifications',
            enabled: true,
            order: 10,
            style: 'premium_carousel',
          ),
        ],
      );
}

class DemoBookingPreview {
  final String title;
  final String nextSlot;
  final List<String> services;
  final List<String> staff;
  final List<String> availableTimes;

  const DemoBookingPreview({
    required this.title,
    required this.nextSlot,
    required this.services,
    required this.staff,
    required this.availableTimes,
  });
}
