import 'package:flutter/material.dart';

import '../../design_system/scope/design_system_scope.dart';
import 'booking_section_config.dart';
import 'styles.dart';
import 'styles/accordion_step_flow.dart';
import 'styles/compact_chip_flow.dart';
import 'styles/popup_staff_picker_flow.dart';
import 'styles/stacked_step_cards.dart';
import 'styles/timeline_rail_flow.dart';

/// Routes booking section styles to TEMPORARY UX prototype widgets.
///
/// These prototypes are disposable and not connected to backend logic.
class BookingRenderer extends StatelessWidget {
  final BookingSectionConfig config;

  const BookingRenderer({
    super.key,
    required this.config,
  });

  BookingRenderer.fromStyleId({
    super.key,
    required String styleId,
    bool enabled = true,
  }) : config = BookingSectionConfig(
          id: 'booking',
          name: 'Booking',
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
      case BookingStyleId.stackedStepCards:
        return const StackedStepCardsStyle();
      case BookingStyleId.compactChipFlow:
        return const CompactChipFlowStyle();
      case BookingStyleId.timelineRailFlow:
        return const TimelineRailFlowStyle();
      case BookingStyleId.accordionStepFlow:
        return const AccordionStepFlowStyle();
      case BookingStyleId.popupStaffPickerFlow:
        return const PopupStaffPickerFlowStyle();
      default:
        return const _UnknownBookingStyle();
    }
  }
}

class _UnknownBookingStyle extends StatelessWidget {
  const _UnknownBookingStyle();

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
