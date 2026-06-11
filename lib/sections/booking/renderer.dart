import 'package:flutter/material.dart';

import '../../design_system/scope/design_system_scope.dart';
import 'booking_section_config.dart';
import 'styles.dart';
import 'styles/calendar_first.dart';
import 'styles/clock_picker.dart';
import 'styles/quick_slots.dart';
import 'styles/step_booking.dart';
import 'styles/timeline_booking.dart';

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
      case BookingStyleId.calendarFirst:
        return const CalendarFirstStyle();
      case BookingStyleId.timelineBooking:
        return const TimelineBookingStyle();
      case BookingStyleId.quickSlots:
        return const QuickSlotsStyle();
      case BookingStyleId.stepBooking:
        return const StepBookingStyle();
      case BookingStyleId.clockPicker:
        return const ClockPickerStyle();
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
