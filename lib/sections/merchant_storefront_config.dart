import '../design_system/merchant_design_config.dart';
import 'storefront_section_entry.dart';

class MerchantStorefrontConfig {
  final MerchantDesignConfig design;
  final List<StorefrontSectionEntry> sections;

  const MerchantStorefrontConfig({
    required this.design,
    required this.sections,
  });

  List<StorefrontSectionEntry> get visibleSections {
    return sections.where((s) => s.enabled).toList()
      ..sort((a, b) => a.order.compareTo(b.order));
  }

  factory MerchantStorefrontConfig.fromJson(Map<String, dynamic> json) {
    final sectionsJson = json['sections'] as List<dynamic>? ?? [];

    return MerchantStorefrontConfig(
      design: MerchantDesignConfig.fromJson(json),
      sections: sectionsJson
          .map(
            (entry) => StorefrontSectionEntry.fromJson(
              entry as Map<String, dynamic>,
            ),
          )
          .toList(),
    );
  }

  static const MerchantStorefrontConfig preview = MerchantStorefrontConfig(
    design: MerchantDesignConfig.defaults,
    sections: [
      StorefrontSectionEntry(
        id: 'banner',
        name: 'Banner',
        enabled: true,
        order: 1,
        style: 'hero_banner',
      ),
      StorefrontSectionEntry(
        id: 'collections',
        name: 'Collections',
        enabled: true,
        order: 2,
        style: 'horizontal_circles',
      ),
    ],
  );
}
