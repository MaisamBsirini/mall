import 'package:flutter/material.dart';

import '../design_system/scope/design_system_scope.dart';
import 'banner/renderer.dart';
import 'booking/booking_section_config.dart';
import 'booking/renderer.dart';
import 'categories/categories_section_config.dart';
import 'categories/renderer.dart';
import 'certifications/certifications_section_config.dart';
import 'certifications/renderer.dart';
import 'collections/collections_section_config.dart';
import 'collections/renderer.dart';
import 'merchant_storefront_config.dart';
import 'social/renderer.dart';
import 'social/social_section_config.dart';
import 'storefront_section_entry.dart';

class StorefrontRenderer extends StatelessWidget {
  final MerchantStorefrontConfig config;

  const StorefrontRenderer({
    super.key,
    required this.config,
  });

  @override
  Widget build(BuildContext context) {
    return DesignSystemScope.fromConfig(
      config: config.design,
      child: Builder(
        builder: (context) {
          final sections = config.visibleSections;

          return ColoredBox(
            color: context.ds.palette.background,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(
                vertical: context.ds.tokens.sectionGap(context),
              ),
              itemCount: sections.length,
              separatorBuilder: (context, _) => SizedBox(
                height: context.ds.tokens.sectionGap(context),
              ),
              itemBuilder: (context, index) {
                return _SectionHost(entry: sections[index]);
              },
            ),
          );
        },
      ),
    );
  }
}

class _SectionHost extends StatelessWidget {
  final StorefrontSectionEntry entry;

  const _SectionHost({required this.entry});

  @override
  Widget build(BuildContext context) {
    switch (entry.id) {
      case 'banner':
        return BannerRenderer(styleId: entry.style);
      case 'collections':
        return CollectionsRenderer(
          config: CollectionsSectionConfig(
            id: entry.id,
            name: entry.name,
            enabled: entry.enabled,
            order: entry.order,
            style: entry.style,
          ),
        );
      case 'social':
        return SocialRenderer(
          config: SocialSectionConfig(
            id: entry.id,
            name: entry.name,
            enabled: entry.enabled,
            order: entry.order,
            style: entry.style,
          ),
        );
      case 'certifications':
        return CertificationsRenderer(
          config: CertificationsSectionConfig(
            id: entry.id,
            name: entry.name,
            enabled: entry.enabled,
            order: entry.order,
            style: entry.style,
          ),
        );
      case 'categories':
        return CategoriesRenderer(
          config: CategoriesSectionConfig(
            id: entry.id,
            name: entry.name,
            enabled: entry.enabled,
            order: entry.order,
            style: entry.style,
          ),
        );
      case 'booking':
        return BookingRenderer(
          config: BookingSectionConfig(
            id: entry.id,
            name: entry.name,
            enabled: entry.enabled,
            order: entry.order,
            style: entry.style,
          ),
        );
      default:
        return Padding(
          padding: context.ds.tokens.sectionPadding(context),
          child: context.ds.placeholders.shimmerBox(
            height: 48,
            borderRadius: context.ds.tokens.borderSm,
          ),
        );
    }
  }
}
