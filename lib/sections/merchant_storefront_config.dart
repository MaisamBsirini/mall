import '../design_system/merchant_design_config.dart';
import 'storefront_layout_config.dart';
import 'storefront_layout_engine.dart';
import 'storefront_section_entry.dart';

class MerchantStorefrontConfig {
  final MerchantDesignConfig design;
  final List<StorefrontSectionEntry> sections;

  const MerchantStorefrontConfig({
    required this.design,
    required this.sections,
  });

  List<StorefrontSectionEntry> get visibleSections {
    final resolved = StorefrontLayoutEngine.resolve(
      sections
          .map(
            (entry) => StorefrontLayoutSectionEntry(
              sectionId: entry.id,
              styleId: entry.style,
              enabled: entry.enabled,
              order: entry.order,
            ),
          )
          .toList(),
    );

    return resolved
        .map(
          (entry) => StorefrontSectionEntry(
            id: entry.sectionId,
            name: _nameFor(entry.sectionId),
            enabled: entry.enabled,
            order: entry.order,
            style: entry.styleId,
          ),
        )
        .toList();
  }

  static String _nameFor(String sectionId) {
    return sectionId
        .split('_')
        .map(
          (w) => w.isEmpty ? w : '${w[0].toUpperCase()}${w.substring(1)}',
        )
        .join(' ');
  }

  factory MerchantStorefrontConfig.fromJson(Map<String, dynamic> json) {
    final designJson = json['design'] as Map<String, dynamic>? ?? {};
    final sectionsJson = json['sections'] as List<dynamic>? ?? [];

    return MerchantStorefrontConfig(
      design: MerchantDesignConfig.fromJson(designJson),
      sections: sectionsJson
          .map(
            (entry) => StorefrontSectionEntry.fromJson(
              entry as Map<String, dynamic>,
            ),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'design': design.toJson(),
      'sections': sections.map((entry) => entry.toJson()).toList(),
    };
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

  static const Map<String, dynamic> exampleJson = {
    'design': {
      'palette': 'luxury_dark',
      'typography': 'elegant_serif',
    },
    'sections': [
      {
        'id': 'banner',
        'name': 'Banner',
        'enabled': true,
        'order': 1,
        'style': 'hero_banner',
      },
      {
        'id': 'collections',
        'name': 'Collections',
        'enabled': true,
        'order': 2,
        'style': 'horizontal_circles',
      },
    ],
  };
}
