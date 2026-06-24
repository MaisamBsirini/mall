import 'package:flutter/material.dart';

import '../../design_system/scope/design_system_scope.dart';
import 'banner_section_config.dart';
import 'styles.dart';
import 'styles/glass_banner.dart';
import 'styles/hero_banner.dart';
import 'styles/minimal_banner.dart';
import 'styles/modern_banner.dart';
import 'styles/slider_banner.dart';

class BannerRenderer extends StatelessWidget {
  final BannerSectionConfig config;

  const BannerRenderer({
    super.key,
    required this.config,
  });

  BannerRenderer.fromStyleId({
    super.key,
    required String styleId,
    bool enabled = true,
  }) : config = BannerSectionConfig(
          id: 'banner',
          name: 'Banner',
          enabled: enabled,
          order: 0,
          style: styleId,
        );

  @override
  Widget build(BuildContext context) {
    if (!config.enabled) {
      return const SizedBox.shrink();
    }

    switch (config.style) {
      case BannerStyleId.hero:
        return const HeroBanner();
      case BannerStyleId.slider:
        return const SliderBanner();
      case BannerStyleId.minimal:
        return const MinimalBanner();
      case BannerStyleId.modern:
        return const ModernBanner();
      case BannerStyleId.glass:
        return const GlassBanner();
      default:
        return const _UnknownBannerStyle();
    }
  }
}

class _UnknownBannerStyle extends StatelessWidget {
  const _UnknownBannerStyle();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: context.ds.placeholders.shimmerBox(
        height: 48,
        borderRadius: context.ds.tokens.borderSm,
      ),
    );
  }
}
