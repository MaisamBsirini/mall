import 'package:flutter/material.dart';

import '../../design_system/scope/design_system_scope.dart';
import 'social_section_config.dart';
import 'styles.dart';
import 'styles/bottom_social_dock.dart';
import 'styles/compact_profile_strip.dart';
import 'styles/elegant_card_stack.dart';
import 'styles/floating_icon_grid.dart';
import 'styles/minimal_social_chips.dart';

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
          id: 'social_media',
          name: 'Social Media',
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
      case SocialStyleId.minimalSocialChips:
        return const MinimalSocialChipsStyle();
      case SocialStyleId.floatingIconGrid:
        return const FloatingIconGridStyle();
      case SocialStyleId.compactProfileStrip:
        return const CompactProfileStripStyle();
      case SocialStyleId.elegantCardStack:
        return const ElegantCardStackStyle();
      case SocialStyleId.bottomSocialDock:
        return const BottomSocialDockStyle();
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
