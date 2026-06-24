import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../booking_prototype_flow.dart';
import '../booking_tokens.dart';

/// Prototype C — vertical timeline rail connecting all 5 steps.
class TimelineRailFlowStyle extends StatelessWidget {
  const TimelineRailFlowStyle({super.key});

  static const _steps = BookingFlowStep.values;

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
            children: [
              for (var i = 0; i < _steps.length; i++)
                _TimelineStep(
                  step: _steps[i],
                  isLast: i == _steps.length - 1,
                  child: _contentForStep(context, _steps[i]),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _contentForStep(BuildContext context, BookingFlowStep step) {
    return switch (step) {
      BookingFlowStep.service => BookingPrototypeFlow.servicePicker(
          context,
          vertical: true,
        ),
      BookingFlowStep.staff => BookingPrototypeFlow.staffPicker(context),
      BookingFlowStep.date => BookingPrototypeFlow.miniCalendar(context),
      BookingFlowStep.time => BookingPrototypeFlow.timeSlots(context),
      BookingFlowStep.confirm => BookingPrototypeFlow.confirmBlock(context),
    };
  }
}

class _TimelineStep extends StatelessWidget {
  final BookingFlowStep step;
  final bool isLast;
  final Widget child;

  const _TimelineStep({
    required this.step,
    required this.isLast,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: AppSizes.w(context, 0.10),
            child: Column(
              children: [
                BookingPrototypeFlow.stepBadge(
                  context,
                  step: step.number,
                  active: step.number == 4,
                  completed: step.number < 4,
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      margin: EdgeInsets.symmetric(
                        vertical: BookingTokens.gapXs(context),
                      ),
                      color: palette.primarySoft(0.25),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(width: BookingTokens.gapMd(context)),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: isLast ? 0 : BookingTokens.gapLg(context),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    step.label,
                    style: context.ds.typography.title(context),
                  ),
                  SizedBox(height: BookingTokens.gapMd(context)),
                  child,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
