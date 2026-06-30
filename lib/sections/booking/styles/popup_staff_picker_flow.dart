import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../booking_prototype_flow.dart';
import '../booking_tokens.dart';

/// Prototype E — ordered slots; staff opens a temporary picker sheet (UI only).
class PopupStaffPickerFlowStyle extends StatefulWidget {
  const PopupStaffPickerFlowStyle({super.key});

  @override
  State<PopupStaffPickerFlowStyle> createState() =>
      _PopupStaffPickerFlowStyleState();
}

class _PopupStaffPickerFlowStyleState extends State<PopupStaffPickerFlowStyle> {
  static const _steps = [
    BookingFlowStep.service,
    BookingFlowStep.staff,
    BookingFlowStep.date,
    BookingFlowStep.time,
  ];

  int? _staffSheetSelection;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BookingTokens.sectionHeader(context),
        SizedBox(height: BookingTokens.gapSm(context)),
        BookingPrototypeFlow.prototypeBanner(context),
        SizedBox(height: BookingTokens.gapMd(context)),
        Padding(
          padding: BookingTokens.sectionPadding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (var i = 0; i < _steps.length; i++) ...[
                _OrderedSlot(
                  order: i + 1,
                  step: _steps[i],
                  child: _slotContent(context, _steps[i]),
                ),
                if (i < _steps.length - 1)
                  SizedBox(height: BookingTokens.gapMd(context)),
              ],
              SizedBox(height: BookingTokens.gapLg(context)),
              BookingPrototypeFlow.confirmBlock(context, showSummary: true),
            ],
          ),
        ),
      ],
    );
  }

  Widget _slotContent(BuildContext context, BookingFlowStep step) {
    return switch (step) {
      BookingFlowStep.service => SizedBox(
          height: AppSizes.h(context, 0.09),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            separatorBuilder: (_, __) =>
                SizedBox(width: BookingTokens.gapSm(context)),
            itemBuilder: (context, index) {
              return BookingTokens.timeSlotPill(
                context,
                selected: index == 0,
                widthFactor: 0.18,
              );
            },
          ),
        ),
      BookingFlowStep.staff => _StaffPickerCard(
          selectedIndex: _staffSheetSelection,
          onTap: () => _openStaffSheet(context),
        ),
      BookingFlowStep.date => BookingPrototypeFlow.dateChips(
          context,
          compact: true,
        ),
      BookingFlowStep.time => BookingPrototypeFlow.timeSlots(
          context,
          columns: 3,
        ),
      BookingFlowStep.confirm => const SizedBox.shrink(),
    };
  }

  Future<void> _openStaffSheet(BuildContext context) async {
    final picked = await showModalBottomSheet<int>(
      context: context,
      showDragHandle: true,
      backgroundColor: context.ds.palette.surface,
      builder: (sheetContext) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              BookingTokens.gapMd(sheetContext),
              0,
              BookingTokens.gapMd(sheetContext),
              BookingTokens.gapMd(sheetContext),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BookingTokens.textLine(
                  sheetContext,
                  widthFactor: 0.22,
                  heightFactor: 0.009,
                ),
                SizedBox(height: BookingTokens.gapMd(sheetContext)),
                for (var i = 0; i < BookingTokens.specialists.length; i++)
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: i < BookingTokens.specialists.length - 1
                          ? BookingTokens.gapSm(sheetContext)
                          : 0,
                    ),
                    child: _StaffSheetRow(
                      index: i,
                      selected: _staffSheetSelection == i,
                      onTap: () => Navigator.of(sheetContext).pop(i),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );

    if (picked != null) {
      setState(() => _staffSheetSelection = picked);
    }
  }
}

class _OrderedSlot extends StatelessWidget {
  final int order;
  final BookingFlowStep step;
  final Widget child;

  const _OrderedSlot({
    required this.order,
    required this.step,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: palette.primary,
              ),
              alignment: Alignment.center,
              child: Text(
                '$order',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: palette.onPrimary,
                ),
              ),
            ),
            if (order < 4)
              Container(
                width: 2,
                height: AppSizes.h(context, 0.04),
                margin: EdgeInsets.symmetric(vertical: BookingTokens.gapXs(context)),
                color: palette.primarySoft(0.3),
              ),
          ],
        ),
        SizedBox(width: BookingTokens.gapSm(context)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                step.label,
                style: context.ds.typography.caption(context).copyWith(
                      fontWeight: FontWeight.w600,
                      color: palette.textSecondary,
                    ),
              ),
              SizedBox(height: BookingTokens.gapSm(context)),
              child,
            ],
          ),
        ),
      ],
    );
  }
}

class _StaffPickerCard extends StatelessWidget {
  final int? selectedIndex;
  final VoidCallback onTap;

  const _StaffPickerCard({
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final specialist = selectedIndex != null
        ? BookingTokens.specialists[selectedIndex!]
        : null;

    return Material(
      color: palette.primarySoft(0.06),
      borderRadius: BookingTokens.borderMd(context),
      child: InkWell(
        onTap: onTap,
        borderRadius: BookingTokens.borderMd(context),
        child: Container(
          padding: EdgeInsets.all(BookingTokens.gapSm(context)),
          decoration: BoxDecoration(
            borderRadius: BookingTokens.borderMd(context),
            border: Border.all(color: palette.border),
          ),
          child: Row(
            children: [
              if (specialist != null)
                BookingTokens.specialistAvatar(
                  context,
                  specialist: specialist,
                  size: AppSizes.w(context, 0.11),
                  selected: true,
                )
              else
                Container(
                  width: AppSizes.w(context, 0.11),
                  height: AppSizes.w(context, 0.11),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: palette.border),
                  ),
                  child: Icon(
                    Icons.person_outline,
                    size: 18,
                    color: palette.textSecondary,
                  ),
                ),
              SizedBox(width: BookingTokens.gapSm(context)),
              Expanded(
                child: BookingTokens.textLine(
                  context,
                  widthFactor: selectedIndex != null ? 0.20 : 0.24,
                  heightFactor: 0.007,
                ),
              ),
              Icon(
                Icons.unfold_more,
                size: 18,
                color: palette.textSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StaffSheetRow extends StatelessWidget {
  final int index;
  final bool selected;
  final VoidCallback onTap;

  const _StaffSheetRow({
    required this.index,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final specialist = BookingTokens.specialists[index];

    return Material(
      color: selected ? palette.primarySoft(0.10) : palette.surface,
      borderRadius: BookingTokens.borderSm(context),
      child: InkWell(
        onTap: onTap,
        borderRadius: BookingTokens.borderSm(context),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: BookingTokens.gapMd(context),
            vertical: BookingTokens.gapSm(context),
          ),
          decoration: BoxDecoration(
            borderRadius: BookingTokens.borderSm(context),
            border: Border.all(
              color: selected ? palette.primary : palette.border,
            ),
          ),
          child: Row(
            children: [
              BookingTokens.specialistAvatar(
                context,
                specialist: specialist,
                size: AppSizes.w(context, 0.10),
                selected: selected,
              ),
              SizedBox(width: BookingTokens.gapSm(context)),
              Expanded(
                child: BookingTokens.textLine(
                  context,
                  widthFactor: 0.22,
                  heightFactor: 0.007,
                ),
              ),
              if (selected)
                Icon(Icons.check_circle, size: 18, color: palette.primary),
            ],
          ),
        ),
      ),
    );
  }
}
