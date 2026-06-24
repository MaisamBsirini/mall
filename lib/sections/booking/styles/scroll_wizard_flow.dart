import 'package:flutter/material.dart';

import '../../../design_system/scope/design_system_scope.dart';
import '../booking_prototype_flow.dart';
import '../booking_tokens.dart';

/// Prototype E — top progress track + full scrollable wizard body.
class ScrollWizardFlowStyle extends StatelessWidget {
  const ScrollWizardFlowStyle({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    const steps = BookingFlowStep.values;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: BookingTokens.sectionPadding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BookingTokens.textLine(
                context,
                widthFactor: 0.32,
                heightFactor: 0.010,
              ),
              SizedBox(height: BookingTokens.gapMd(context)),
              Row(
                children: List.generate(steps.length, (index) {
                  final step = steps[index];
                  final isActive = index == 3;
                  final isDone = index < 3;

                  return Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 4,
                            decoration: BoxDecoration(
                              color: isDone || isActive
                                  ? palette.primary
                                  : palette.placeholderLight,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                        if (index < steps.length - 1)
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: BookingTokens.gapXs(context),
                            ),
                            child: BookingPrototypeFlow.stepBadge(
                              context,
                              step: step.number,
                              active: isActive,
                              completed: isDone,
                            ),
                          ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
        BookingPrototypeFlow.prototypeBanner(context),
        SizedBox(height: BookingTokens.gapMd(context)),
        Padding(
          padding: BookingTokens.sectionPadding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _WizardSection(
                label: '1 · Service',
                child: BookingPrototypeFlow.servicePicker(context),
              ),
              _WizardSection(
                label: '2 · Staff',
                child: BookingPrototypeFlow.staffPicker(context),
              ),
              _WizardSection(
                label: '3 · Date',
                child: Column(
                  children: [
                    BookingPrototypeFlow.dateChips(context),
                    SizedBox(height: BookingTokens.gapMd(context)),
                    BookingPrototypeFlow.miniCalendar(context),
                  ],
                ),
              ),
              _WizardSection(
                label: '4 · Time',
                child: BookingPrototypeFlow.timeSlots(context),
              ),
              _WizardSection(
                label: '5 · Confirm',
                child: BookingPrototypeFlow.confirmBlock(context),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _WizardSection extends StatelessWidget {
  final String label;
  final Widget child;

  const _WizardSection({required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: BookingTokens.gapLg(context) * 1.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: context.ds.typography.heading(context),
          ),
          SizedBox(height: BookingTokens.gapMd(context)),
          child,
        ],
      ),
    );
  }
}
