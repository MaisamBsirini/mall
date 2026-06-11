import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../booking_tokens.dart';

class QuickSlotsStyle extends StatelessWidget {
  const QuickSlotsStyle({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BookingTokens.sectionHeader(context),
        SizedBox(height: BookingTokens.gapMd(context)),
        Padding(
          padding: BookingTokens.sectionPadding(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              5,
              (index) => BookingTokens.dateChip(
                context,
                selected: index == BookingTokens.mockSelectedDateIndex,
                compact: true,
              ),
            ),
          ),
        ),
        SizedBox(height: BookingTokens.gapLg(context)),
        Padding(
          padding: BookingTokens.sectionPadding(context),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: BookingTokens.gapSm(context),
              crossAxisSpacing: BookingTokens.gapSm(context),
              childAspectRatio: 2.2,
            ),
            itemCount: 12,
            itemBuilder: (context, index) {
              final isSelected = index == 4;
              final isUnavailable = index == 7 || index == 10;

              return Container(
                decoration: BoxDecoration(
                  color: isUnavailable
                      ? palette.placeholderLight.withOpacity(0.5)
                      : isSelected
                          ? palette.primary
                          : palette.surface,
                  borderRadius: BookingTokens.borderMd(context),
                  border: Border.all(
                    color: isSelected ? palette.primary : palette.border,
                  ),
                  boxShadow: isSelected
                      ? BookingTokens.elevatedShadow(context)
                      : null,
                ),
                alignment: Alignment.center,
                child: isUnavailable
                    ? Icon(
                        Icons.block_rounded,
                        size: AppSizes.w(context, 0.045),
                        color: palette.textSecondary.withOpacity(0.30),
                      )
                    : BookingTokens.textLine(
                        context,
                        widthFactor: 0.10,
                        heightFactor: 0.008,
                      ),
              );
            },
          ),
        ),
        SizedBox(height: BookingTokens.gapLg(context)),
        Padding(
          padding: BookingTokens.sectionPadding(context),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BookingTokens.textLine(
                      context,
                      widthFactor: 0.20,
                      heightFactor: 0.008,
                    ),
                    SizedBox(height: BookingTokens.gapXs(context)),
                    BookingTokens.textLine(
                      context,
                      widthFactor: 0.14,
                      heightFactor: 0.006,
                    ),
                  ],
                ),
              ),
              BookingTokens.bookCta(context, fullWidth: false, widthFactor: 0.38),
            ],
          ),
        ),
      ],
    );
  }
}
