import 'package:flutter/material.dart';

import '../../design_system/scope/design_system_scope.dart';
import 'social_section_config.dart';
import 'styles.dart';
import 'styles/creator_showcase.dart';
import 'styles/glass_social_panel.dart';
import 'styles/social_carousel.dart';
import 'styles/social_hub.dart';
import 'styles/social_wall.dart';

class SocialRenderer extends StatelessWidget {
  final SocialSectionConfig config;

  const SocialRenderer({
    super.key,
    required this.config,
  });

  SocialRenderer.fromStyleId({
    super.key,
    required String styleId,
    bool enabled = true,
  }) : config = SocialSectionConfig(
          id: 'social',
          name: 'Social',
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
      case SocialStyleId.socialHub:
        return const SocialHubStyle();
      case SocialStyleId.socialWall:
        return const SocialWallStyle();
      case SocialStyleId.socialCarousel:
        return const SocialCarouselStyle();
      case SocialStyleId.glassSocialPanel:
        return const GlassSocialPanelStyle();
      case SocialStyleId.creatorShowcase:
        return const CreatorShowcaseStyle();
      default:
        return const _UnknownSocialStyle();
    }
  }
}

class _UnknownSocialStyle extends StatelessWidget {
  const _UnknownSocialStyle();

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
