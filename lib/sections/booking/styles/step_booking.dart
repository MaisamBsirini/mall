import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../booking_tokens.dart';

class StepBookingStyle extends StatelessWidget {
  const StepBookingStyle({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: BookingTokens.sectionPadding(context),
          child: Row(
            children: List.generate(4, (index) {
              final isActive = index <= 2;
              final isCurrent = index == 2;
              return Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 3,
                        color: isActive
                            ? palette.primary
                            : palette.placeholderLight,
                      ),
                    ),
                    if (index < 3)
                      Container(
                        width: 8,
                        height: 8,
                        margin: EdgeInsets.symmetric(
                          horizontal: BookingTokens.gapXs(context),
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isCurrent
                              ? palette.primary
                              : isActive
                                  ? palette.primary.withOpacity(0.50)
                                  : palette.border,
                        ),
                      ),
                  ],
                ),
              );
            }),
          ),
        ),
        SizedBox(height: BookingTokens.gapMd(context)),
        Padding(
          padding: BookingTokens.sectionPadding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _StepSection(
                step: 1,
                titleWidth: 0.22,
                active: true,
                completed: true,
                child: Row(
                  children: List.generate(3, (index) {
                    final selected = index == 0;
                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: index < 2 ? BookingTokens.gapSm(context) : 0,
                        ),
                        child: Container(
                          padding: EdgeInsets.all(AppSizes.w(context, 0.03)),
                          decoration: BoxDecoration(
                            color: selected
                                ? palette.primarySoft(0.10)
                                : BookingTokens.surface(context),
                            borderRadius: BookingTokens.borderMd(context),
                            border: Border.all(
                              color: selected
                                  ? palette.primary
                                  : palette.border,
                            ),
                          ),
                          child: Column(
                            children: [
                              BookingTokens.shimmerBox(
                                context,
                                width: AppSizes.w(context, 0.08),
                                height: AppSizes.w(context, 0.08),
                                borderRadius: BookingTokens.borderSm(context),
                              ),
                              SizedBox(height: BookingTokens.gapSm(context)),
                              BookingTokens.textLine(
                                context,
                                widthFactor: 0.14,
                                heightFactor: 0.006,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              _StepConnector(context: context),
              _StepSection(
                step: 2,
                titleWidth: 0.18,
                active: true,
                completed: true,
                child: SizedBox(
                  height: AppSizes.h(context, 0.07),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    separatorBuilder: (_, __) =>
                        SizedBox(width: BookingTokens.gapSm(context)),
                    itemBuilder: (context, index) {
                      return BookingTokens.dateChip(
                        context,
                        selected: index == 2,
                        compact: true,
                      );
                    },
                  ),
                ),
              ),
              _StepConnector(context: context),
              _StepSection(
                step: 3,
                titleWidth: 0.18,
                active: true,
                child: Wrap(
                  spacing: BookingTokens.gapSm(context),
                  runSpacing: BookingTokens.gapSm(context),
                  children: List.generate(6, (index) {
                    return BookingTokens.timeSlotPill(
                      context,
                      selected: index == 1,
                      widthFactor: 0.12,
                    );
                  }),
                ),
              ),
              _StepConnector(context: context),
              _StepSection(
                step: 4,
                titleWidth: 0.16,
                active: false,
                child: Container(
                  padding: EdgeInsets.all(AppSizes.w(context, 0.04)),
                  decoration: BoxDecoration(
                    color: palette.primarySoft(0.06),
                    borderRadius: BookingTokens.borderMd(context),
                    border: Border.all(color: palette.border),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BookingTokens.textLine(
                        context,
                        widthFactor: 0.30,
                        heightFactor: 0.009,
                      ),
                      SizedBox(height: BookingTokens.gapSm(context)),
                      BookingTokens.textLine(context, widthFactor: 0.24),
                      SizedBox(height: BookingTokens.gapXs(context)),
                      BookingTokens.textLine(context, widthFactor: 0.18),
                      SizedBox(height: BookingTokens.gapMd(context)),
                      BookingTokens.bookCta(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StepSection extends StatelessWidget {
  final int step;
  final double titleWidth;
  final bool active;
  final bool completed;
  final Widget child;

  const _StepSection({
    required this.step,
    required this.titleWidth,
    required this.active,
    this.completed = false,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            BookingTokens.flowStepLabel(context, step: step, active: active),
            if (completed) ...[
              SizedBox(width: BookingTokens.gapSm(context)),
              Icon(
                Icons.check_rounded,
                size: 16,
                color: context.ds.palette.primary,
              ),
            ],
          ],
        ),
        SizedBox(height: BookingTokens.gapMd(context)),
        child,
      ],
    );
  }
}

class _StepConnector extends StatelessWidget {
  final BuildContext context;

  const _StepConnector({required this.context});

  @override
  Widget build(BuildContext _) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: BookingTokens.gapMd(context)),
      child: Container(
        margin: EdgeInsets.only(left: AppSizes.w(context, 0.03)),
        width: 2,
        height: AppSizes.h(context, 0.02),
        color: context.ds.palette.primarySoft(0.20),
      ),
    );
  }
}
