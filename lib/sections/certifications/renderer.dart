import 'package:flutter/material.dart';

import '../../design_system/scope/design_system_scope.dart';
import 'certifications_section_config.dart';
import 'styles.dart';
import 'styles/achievement_gallery.dart';
import 'styles/awards_showcase.dart';
import 'styles/certificate_wall.dart';
import 'styles/masonry_achievements.dart';
import 'styles/premium_carousel.dart';

class CertificationsRenderer extends StatelessWidget {
  final CertificationsSectionConfig config;

  const CertificationsRenderer({
    super.key,
    required this.config,
  });

  CertificationsRenderer.fromStyleId({
    super.key,
    required String styleId,
    bool enabled = true,
  }) : config = CertificationsSectionConfig(
          id: 'certifications',
          name: 'Certifications',
          enabled: enabled,
          order: 0,
          style: styleId,
        );

  @override
  Widget build(BuildContext context) {
    if (!config.enabled) {
      return const SizedBox.shrink();
    }

    final data = config.data;

    switch (config.style) {
      case CertificationsStyleId.certificateWall:
        return CertificateWallStyle(data: data);
      case CertificationsStyleId.achievementGallery:
        return AchievementGalleryStyle(data: data);
      case CertificationsStyleId.awardsShowcase:
        return AwardsShowcaseStyle(data: data);
      case CertificationsStyleId.masonryAchievements:
        return MasonryAchievementsStyle(data: data);
      case CertificationsStyleId.premiumCarousel:
        return PremiumCarouselStyle(data: data);
      default:
        return const _UnknownCertificationsStyle();
    }
  }
}

class _UnknownCertificationsStyle extends StatelessWidget {
  const _UnknownCertificationsStyle();

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
