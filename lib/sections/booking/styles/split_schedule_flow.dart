import 'package:flutter/material.dart';

import '../../../design_system/scope/design_system_scope.dart';
import '../booking_prototype_flow.dart';
import '../booking_tokens.dart';

/// Prototype D — service/staff header band + calendar hero + time grid.
class SplitScheduleFlowStyle extends StatelessWidget {
  const SplitScheduleFlowStyle({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BookingTokens.sectionHeader(context),
        SizedBox(height: BookingTokens.gapSm(context)),
        BookingPrototypeFlow.prototypeBanner(context),
        SizedBox(height: BookingTokens.gapMd(context)),
        Padding(
          padding: BookingTokens.sectionPadding(context),
          child: Container(
            decoration: BoxDecoration(
              color: BookingTokens.surface(context),
              borderRadius: BookingTokens.borderLg(context),
              border: Border.all(color: palette.border),
              boxShadow: BookingTokens.elevatedShadow(context),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(BookingTokens.gapMd(context)),
                  decoration: BoxDecoration(
                    color: palette.primarySoft(0.06),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(context.ds.tokens.radiusLg),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BookingPrototypeFlow.stepTitle(
                        context,
                        BookingFlowStep.service,
                      ),
                      SizedBox(height: BookingTokens.gapSm(context)),
                      BookingPrototypeFlow.servicePicker(context),
                      SizedBox(height: BookingTokens.gapLg(context)),
                      BookingPrototypeFlow.stepTitle(
                        context,
                        BookingFlowStep.staff,
                      ),
                      SizedBox(height: BookingTokens.gapSm(context)),
                      BookingPrototypeFlow.staffPicker(context),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(BookingTokens.gapMd(context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BookingPrototypeFlow.stepTitle(
                        context,
                        BookingFlowStep.date,
                      ),
                      SizedBox(height: BookingTokens.gapMd(context)),
                      BookingPrototypeFlow.miniCalendar(context),
                      SizedBox(height: BookingTokens.gapLg(context)),
                      BookingPrototypeFlow.stepTitle(
                        context,
                        BookingFlowStep.time,
                      ),
                      SizedBox(height: BookingTokens.gapMd(context)),
                      BookingPrototypeFlow.timeSlots(context, columns: 3),
                      SizedBox(height: BookingTokens.gapLg(context)),
                      BookingPrototypeFlow.stepTitle(
                        context,
                        BookingFlowStep.confirm,
                      ),
                      SizedBox(height: BookingTokens.gapMd(context)),
                      BookingPrototypeFlow.confirmBlock(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
