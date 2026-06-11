import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../booking_tokens.dart';

class CalendarFirstStyle extends StatelessWidget {
  const CalendarFirstStyle({super.key});

  static const int _daysInMonth = 35;
  static const int _selectedDayIndex = 18;

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final cellSize = AppSizes.w(context, 0.105);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BookingTokens.sectionHeader(context),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BookingTokens.textLine(
                      context,
                      widthFactor: 0.22,
                      heightFactor: 0.010,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.chevron_left_rounded,
                          color: palette.textSecondary.withOpacity(0.5),
                        ),
                        Icon(
                          Icons.chevron_right_rounded,
                          color: palette.textSecondary.withOpacity(0.5),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: BookingTokens.gapMd(context)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: BookingTokens.mockWeekdays
                      .map(
                        (day) => SizedBox(
                          width: cellSize,
                          child: Center(
                            child: BookingTokens.textLine(
                              context,
                              widthFactor: 0.06,
                              heightFactor: 0.006,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                SizedBox(height: BookingTokens.gapSm(context)),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    mainAxisSpacing: BookingTokens.gapXs(context),
                    crossAxisSpacing: BookingTokens.gapXs(context),
                  ),
                  itemCount: _daysInMonth,
                  itemBuilder: (context, index) {
                    final isSelected = index == _selectedDayIndex;
                    final isAvailable = index > 6 && index % 5 != 0;

                    return Container(
                      decoration: BoxDecoration(
                        color: isSelected
                            ? palette.primary
                            : isAvailable
                                ? palette.primarySoft(0.06)
                                : Colors.transparent,
                        borderRadius: BookingTokens.borderSm(context),
                        border: isAvailable && !isSelected
                            ? Border.all(color: palette.border)
                            : null,
                      ),
                      alignment: Alignment.center,
                      child: BookingTokens.shimmerBox(
                        context,
                        width: AppSizes.w(context, 0.04),
                        height: AppSizes.h(context, 0.006),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    );
                  },
                ),
                SizedBox(height: BookingTokens.gapLg(context)),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: palette.border,
                ),
                SizedBox(height: BookingTokens.gapMd(context)),
                BookingTokens.textLine(
                  context,
                  widthFactor: 0.34,
                  heightFactor: 0.009,
                ),
                SizedBox(height: BookingTokens.gapMd(context)),
                Wrap(
                  spacing: BookingTokens.gapSm(context),
                  runSpacing: BookingTokens.gapSm(context),
                  children: List.generate(8, (index) {
                    return BookingTokens.timeSlotPill(
                      context,
                      selected: index == BookingTokens.mockSelectedTimeIndex,
                      widthFactor: 0.12,
                    );
                  }),
                ),
                SizedBox(height: BookingTokens.gapLg(context)),
                BookingTokens.bookCta(context),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
