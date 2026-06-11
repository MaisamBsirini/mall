import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../booking_tokens.dart';

class TimelineBookingStyle extends StatelessWidget {
  const TimelineBookingStyle({super.key});

  static const List<double> _slotHeights = [0.08, 0.06, 0.10, 0.07, 0.09];
  static const List<int> _slotStarts = [0, 2, 4, 6, 8];

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: BookingTokens.sectionPadding(context),
          child: BookingTokens.textLine(
            context,
            widthFactor: 0.26,
            heightFactor: 0.010,
          ),
        ),
        SizedBox(height: BookingTokens.gapMd(context)),
        SizedBox(
          height: AppSizes.h(context, 0.10),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: BookingTokens.sectionPadding(context),
            itemCount: 7,
            separatorBuilder: (_, __) =>
                SizedBox(width: BookingTokens.gapSm(context)),
            itemBuilder: (context, index) {
              return BookingTokens.dateChip(
                context,
                selected: index == BookingTokens.mockSelectedDateIndex,
              );
            },
          ),
        ),
        SizedBox(height: BookingTokens.gapMd(context)),
        Padding(
          padding: BookingTokens.sectionPadding(context),
          child: Container(
            padding: EdgeInsets.all(AppSizes.w(context, 0.04)),
            decoration: BoxDecoration(
              color: BookingTokens.surface(context),
              borderRadius: BookingTokens.borderLg(context),
              border: Border.all(color: palette.border),
              boxShadow: BookingTokens.cardShadow(context),
            ),
            child: Column(
              children: List.generate(_slotStarts.length, (index) {
                final isSelected = index == 2;
                final height = AppSizes.h(context, _slotHeights[index]);

                return Padding(
                  padding: EdgeInsets.only(
                    bottom: index < _slotStarts.length - 1
                        ? BookingTokens.gapMd(context)
                        : 0,
                  ),
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          width: AppSizes.w(context, 0.14),
                          child: Column(
                            children: [
                              BookingTokens.textLine(
                                context,
                                widthFactor: 0.10,
                                heightFactor: 0.007,
                              ),
                              Expanded(
                                child: Container(
                                  width: 2,
                                  margin: EdgeInsets.symmetric(
                                    vertical: BookingTokens.gapXs(context),
                                  ),
                                  color: palette.primarySoft(0.20),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: height,
                            padding: EdgeInsets.all(
                              AppSizes.w(context, 0.035),
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? palette.primarySoft(0.12)
                                  : palette.placeholderLight,
                              borderRadius: BookingTokens.borderMd(context),
                              border: Border.all(
                                color: isSelected
                                    ? palette.primary.withOpacity(0.40)
                                    : palette.border,
                                width: isSelected ? 1.5 : 1,
                              ),
                              boxShadow: isSelected
                                  ? BookingTokens.elevatedShadow(context)
                                  : null,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 4,
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? palette.primary
                                        : palette.textSecondary
                                            .withOpacity(0.25),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                                SizedBox(width: BookingTokens.gapMd(context)),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      BookingTokens.textLine(
                                        context,
                                        widthFactor: 0.18,
                                        heightFactor: 0.008,
                                      ),
                                      SizedBox(
                                          height: BookingTokens.gapXs(context)),
                                      BookingTokens.textLine(
                                        context,
                                        widthFactor: 0.12,
                                        heightFactor: 0.006,
                                      ),
                                    ],
                                  ),
                                ),
                                if (isSelected)
                                  Icon(
                                    Icons.check_circle_rounded,
                                    size: AppSizes.w(context, 0.05),
                                    color: palette.primary,
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
        SizedBox(height: BookingTokens.gapMd(context)),
        Padding(
          padding: BookingTokens.sectionPadding(context),
          child: BookingTokens.bookCta(context),
        ),
      ],
    );
  }
}
