import 'package:flutter/material.dart';

import '../../../design_system/scope/design_system_scope.dart';
import '../booking_prototype_flow.dart';
import '../booking_tokens.dart';

/// Prototype A — each flow step in its own elevated card.
class StackedStepCardsStyle extends StatelessWidget {
  const StackedStepCardsStyle({super.key});

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
              _StepCard(
                step: BookingFlowStep.service,
                child: BookingPrototypeFlow.servicePicker(context),
              ),
              _StepCard(
                step: BookingFlowStep.staff,
                child: BookingPrototypeFlow.staffPicker(context),
              ),
              _StepCard(
                step: BookingFlowStep.date,
                child: BookingPrototypeFlow.dateChips(context),
              ),
              _StepCard(
                step: BookingFlowStep.time,
                child: BookingPrototypeFlow.timeSlots(context),
              ),
              _StepCard(
                step: BookingFlowStep.confirm,
                child: BookingPrototypeFlow.confirmBlock(context),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StepCard extends StatelessWidget {
  final BookingFlowStep step;
  final Widget child;

  const _StepCard({required this.step, required this.child});

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: BookingTokens.gapMd(context)),
      padding: EdgeInsets.all(BookingTokens.gapMd(context)),
      decoration: BoxDecoration(
        color: BookingTokens.surface(context),
        borderRadius: BookingTokens.borderLg(context),
        border: Border.all(color: palette.border),
        boxShadow: BookingTokens.cardShadow(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BookingPrototypeFlow.stepTitle(context, step),
          SizedBox(height: BookingTokens.gapMd(context)),
          child,
        ],
      ),
    );
  }
}
