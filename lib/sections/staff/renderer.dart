import 'package:flutter/material.dart';

import '../../design_system/scope/design_system_scope.dart';
import 'staff_section_config.dart';
import 'styles.dart';
import 'styles/alternating_profile_list.dart';
import 'styles/expert_cards_grid.dart';
import 'styles/featured_specialists.dart';

class StaffRenderer extends StatelessWidget {
  final StaffSectionConfig config;

  const StaffRenderer({
    super.key,
    required this.config,
  });

  StaffRenderer.fromStyleId({
    super.key,
    required String styleId,
    bool enabled = true,
  }) : config = StaffSectionConfig(
          id: 'staff',
          name: 'Staff',
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
      case StaffStyleId.alternatingProfileList:
        return const AlternatingProfileListStyle();
      case StaffStyleId.expertCardsGrid:
        return const ExpertCardsGridStyle();
      case StaffStyleId.featuredSpecialists:
        return const FeaturedSpecialistsStyle();
      default:
        return const _UnknownStaffStyle();
    }
  }
}

class _UnknownStaffStyle extends StatelessWidget {
  const _UnknownStaffStyle();

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
