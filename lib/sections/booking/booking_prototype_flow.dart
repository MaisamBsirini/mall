/// TEMPORARY PROTOTYPE — disposable booking UX exploration only.
///
/// Not for production. Will be replaced by Laravel-backed booking.
/// Shared static building blocks for all 5 prototype styles.
library;

import 'package:flutter/material.dart';

import '../../core/constants/app_sizes.dart';
import '../../design_system/scope/design_system_scope.dart';
import 'booking_tokens.dart';

/// Canonical 5-step booking flow (static showcase).
enum BookingFlowStep {
  service(1, 'Select Service'),
  staff(2, 'Select Staff'),
  date(3, 'Select Date'),
  time(4, 'Select Time'),
  confirm(5, 'Confirm Booking');

  final int number;
  final String label;

  const BookingFlowStep(this.number, this.label);
}

class BookingPrototypeFlow {
  BookingPrototypeFlow._();

  static const int serviceCount = 3;
  static const int staffCount = 3;
  static const int dateChipCount = 5;
  static const int timeSlotCount = 6;
  static const int calendarCells = 28;

  static const int selectedService = 0;
  static const int selectedStaff = 1;
  static const int selectedDate = 2;
  static const int selectedTime = 1;
  static const int selectedCalendarCell = 12;

  static Widget prototypeBanner(BuildContext context) {
    final palette = context.ds.palette;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: BookingTokens.horizontalMargin(context),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: BookingTokens.gapMd(context),
        vertical: BookingTokens.gapSm(context),
      ),
      decoration: BoxDecoration(
        color: palette.warning.withValues(alpha: 0.12),
        borderRadius: BookingTokens.borderSm(context),
        border: Border.all(color: palette.warning.withValues(alpha: 0.35)),
      ),
      child: Row(
        children: [
          Icon(Icons.science_outlined, size: 16, color: palette.warning),
          SizedBox(width: BookingTokens.gapSm(context)),
          Expanded(
            child: Text(
              'UX prototype — not production UI',
              style: context.ds.typography.caption(context).copyWith(
                    color: palette.textSecondary,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget stepBadge(
    BuildContext context, {
    required int step,
    required bool active,
    bool completed = false,
  }) {
    final palette = context.ds.palette;

    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: completed
            ? palette.success.withValues(alpha: 0.15)
            : active
                ? palette.primary
                : palette.placeholderLight,
        border: Border.all(
          color: completed
              ? palette.success
              : active
                  ? palette.primary
                  : palette.border,
        ),
      ),
      alignment: Alignment.center,
      child: completed
          ? Icon(Icons.check, size: 14, color: palette.success)
          : Text(
              '$step',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: active ? palette.onPrimary : palette.textSecondary,
              ),
            ),
    );
  }

  /// Step 1 — horizontal service cards.
  static Widget servicePicker(
    BuildContext context, {
    bool vertical = false,
  }) {
    if (vertical) {
      return Column(
        children: List.generate(serviceCount, (index) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: index < serviceCount - 1 ? BookingTokens.gapSm(context) : 0,
            ),
            child: _serviceTile(context, selected: index == selectedService),
          );
        }),
      );
    }

    return SizedBox(
      height: AppSizes.h(context, 0.11),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: serviceCount,
        separatorBuilder: (_, __) => SizedBox(width: BookingTokens.gapSm(context)),
        itemBuilder: (context, index) {
          return _serviceTile(
            context,
            selected: index == selectedService,
            width: AppSizes.w(context, 0.38),
          );
        },
      ),
    );
  }

  static Widget _serviceTile(
    BuildContext context, {
    required bool selected,
    double? width,
  }) {
    final palette = context.ds.palette;

    return Container(
      width: width,
      padding: EdgeInsets.all(BookingTokens.gapSm(context)),
      decoration: BoxDecoration(
        color: selected ? palette.primarySoft(0.10) : BookingTokens.surface(context),
        borderRadius: BookingTokens.borderMd(context),
        border: Border.all(
          color: selected ? palette.primary : palette.border,
          width: selected ? 1.5 : 1,
        ),
      ),
      child: Row(
        children: [
          BookingTokens.shimmerBox(
            context,
            width: AppSizes.w(context, 0.09),
            height: AppSizes.w(context, 0.09),
            borderRadius: BookingTokens.borderSm(context),
          ),
          SizedBox(width: BookingTokens.gapSm(context)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BookingTokens.textLine(context, widthFactor: 0.22, heightFactor: 0.008),
                SizedBox(height: BookingTokens.gapXs(context)),
                BookingTokens.textLine(context, widthFactor: 0.14, heightFactor: 0.006),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Step 2 — staff avatar row.
  static Widget staffPicker(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(staffCount, (index) {
        final specialist = BookingTokens.specialists[index];
        return Column(
          children: [
            BookingTokens.specialistAvatar(
              context,
              specialist: specialist,
              size: AppSizes.w(context, 0.16),
              selected: index == selectedStaff,
            ),
            SizedBox(height: BookingTokens.gapXs(context)),
            BookingTokens.textLine(context, widthFactor: 0.12, heightFactor: 0.006),
          ],
        );
      }),
    );
  }

  /// Step 3 — date chips (compact).
  static Widget dateChips(BuildContext context, {bool compact = false}) {
    return SizedBox(
      height: compact ? AppSizes.h(context, 0.08) : AppSizes.h(context, 0.10),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: dateChipCount,
        separatorBuilder: (_, __) => SizedBox(width: BookingTokens.gapSm(context)),
        itemBuilder: (context, index) {
          return BookingTokens.dateChip(
            context,
            selected: index == selectedDate,
            compact: compact,
          );
        },
      ),
    );
  }

  /// Step 3 — mini calendar grid.
  static Widget miniCalendar(BuildContext context) {
    final palette = context.ds.palette;
    final cellSize = AppSizes.w(context, 0.105);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: BookingTokens.mockWeekdays
              .map(
                (_) => SizedBox(
                  width: cellSize,
                  child: Center(
                    child: BookingTokens.textLine(
                      context,
                      widthFactor: 0.05,
                      heightFactor: 0.005,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        SizedBox(height: BookingTokens.gapSm(context)),
        Wrap(
          spacing: BookingTokens.gapXs(context),
          runSpacing: BookingTokens.gapXs(context),
          children: List.generate(calendarCells, (index) {
            final selected = index == selectedCalendarCell;
            final available = index > 3 && index % 4 != 0;

            return Container(
              width: cellSize,
              height: cellSize,
              decoration: BoxDecoration(
                color: selected
                    ? palette.primary
                    : available
                        ? palette.primarySoft(0.06)
                        : Colors.transparent,
                borderRadius: BookingTokens.borderSm(context),
                border: available && !selected
                    ? Border.all(color: palette.border)
                    : null,
              ),
              alignment: Alignment.center,
              child: BookingTokens.shimmerBox(
                context,
                width: AppSizes.w(context, 0.035),
                height: AppSizes.h(context, 0.005),
                borderRadius: BorderRadius.circular(2),
              ),
            );
          }),
        ),
      ],
    );
  }

  /// Step 4 — time slot pills.
  static Widget timeSlots(
    BuildContext context, {
    int columns = 0,
  }) {
    if (columns > 0) {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columns,
          mainAxisSpacing: BookingTokens.gapSm(context),
          crossAxisSpacing: BookingTokens.gapSm(context),
          childAspectRatio: 2.4,
        ),
        itemCount: timeSlotCount,
        itemBuilder: (context, index) {
          return BookingTokens.timeSlotPill(
            context,
            selected: index == selectedTime,
            widthFactor: 0.10,
          );
        },
      );
    }

    return Wrap(
      spacing: BookingTokens.gapSm(context),
      runSpacing: BookingTokens.gapSm(context),
      children: List.generate(timeSlotCount, (index) {
        return BookingTokens.timeSlotPill(
          context,
          selected: index == selectedTime,
          widthFactor: 0.12,
        );
      }),
    );
  }

  /// Step 5 — confirm summary + CTA.
  static Widget confirmBlock(
    BuildContext context, {
    bool showSummary = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (showSummary) ...[
          Container(
            padding: EdgeInsets.all(BookingTokens.gapMd(context)),
            decoration: BoxDecoration(
              color: context.ds.palette.primarySoft(0.06),
              borderRadius: BookingTokens.borderMd(context),
              border: Border.all(color: context.ds.palette.border),
            ),
            child: Column(
              children: List.generate(4, (index) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: index < 3 ? BookingTokens.gapSm(context) : 0,
                  ),
                  child: Row(
                    children: [
                      BookingTokens.textLine(
                        context,
                        widthFactor: 0.14,
                        heightFactor: 0.006,
                      ),
                      const Spacer(),
                      BookingTokens.textLine(
                        context,
                        widthFactor: 0.18,
                        heightFactor: 0.006,
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: BookingTokens.gapMd(context)),
        ],
        BookingTokens.bookCta(context),
      ],
    );
  }

  static Widget stepTitle(
    BuildContext context,
    BookingFlowStep step, {
    bool showBadge = true,
  }) {
    return Row(
      children: [
        if (showBadge) ...[
          stepBadge(
            context,
            step: step.number,
            active: step == BookingFlowStep.confirm,
            completed: step.number < 5,
          ),
          SizedBox(width: BookingTokens.gapSm(context)),
        ],
        Expanded(
          child: Text(
            step.label,
            style: context.ds.typography.subtitle(context),
          ),
        ),
      ],
    );
  }
}
