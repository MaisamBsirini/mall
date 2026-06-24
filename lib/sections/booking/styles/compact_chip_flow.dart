import 'package:flutter/material.dart';

import '../booking_prototype_flow.dart';
import '../booking_tokens.dart';

/// Prototype B — dense chip-based selectors, minimal vertical footprint.
class CompactChipFlowStyle extends StatelessWidget {
  const CompactChipFlowStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: BookingTokens.sectionPadding(context),
          child: BookingTokens.textLine(
            context,
            widthFactor: 0.30,
            heightFactor: 0.010,
          ),
        ),
        BookingPrototypeFlow.prototypeBanner(context),
        SizedBox(height: BookingTokens.gapMd(context)),
        Padding(
          padding: BookingTokens.sectionPadding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _CompactSection(
                step: BookingFlowStep.service,
                child: SizedBox(
                  height: 44,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    separatorBuilder: (_, __) =>
                        SizedBox(width: BookingTokens.gapSm(context)),
                    itemBuilder: (context, index) {
                      return BookingTokens.timeSlotPill(
                        context,
                        selected: index == 0,
                        widthFactor: 0.20,
                      );
                    },
                  ),
                ),
              ),
              _CompactSection(
                step: BookingFlowStep.staff,
                child: BookingPrototypeFlow.staffPicker(context),
              ),
              _CompactSection(
                step: BookingFlowStep.date,
                child: BookingPrototypeFlow.dateChips(context, compact: true),
              ),
              _CompactSection(
                step: BookingFlowStep.time,
                child: BookingPrototypeFlow.timeSlots(context, columns: 3),
              ),
              _CompactSection(
                step: BookingFlowStep.confirm,
                child: BookingPrototypeFlow.confirmBlock(
                  context,
                  showSummary: false,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CompactSection extends StatelessWidget {
  final BookingFlowStep step;
  final Widget child;

  const _CompactSection({required this.step, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: BookingTokens.gapLg(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BookingPrototypeFlow.stepTitle(context, step, showBadge: false),
          SizedBox(height: BookingTokens.gapSm(context)),
          child,
        ],
      ),
    );
  }
}
