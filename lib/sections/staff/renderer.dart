import 'package:flutter/material.dart';

import '../../design_system/scope/design_system_scope.dart';
import 'staff_section_config.dart';
import 'styles.dart';
import 'styles/alternating_staff.dart';
import 'styles/premium_specialists_grid.dart';
import 'styles/team_directory.dart';

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

    final data = config.data;

    switch (config.style) {
      case StaffStyleId.alternatingStaff:
        return AlternatingStaffStyle(data: data);
      case StaffStyleId.teamDirectory:
        return TeamDirectoryStyle(data: data);
      case StaffStyleId.premiumSpecialistsGrid:
        return PremiumSpecialistsGridStyle(data: data);
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
