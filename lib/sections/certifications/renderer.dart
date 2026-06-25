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

    switch (config.style) {
      case CertificationsStyleId.certificateWall:
        return const CertificateWallStyle();
      case CertificationsStyleId.achievementGallery:
        return const AchievementGalleryStyle();
      case CertificationsStyleId.awardsShowcase:
        return const AwardsShowcaseStyle();
      case CertificationsStyleId.masonryAchievements:
        return const MasonryAchievementsStyle();
      case CertificationsStyleId.premiumCarousel:
        return const PremiumCarouselStyle();
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
