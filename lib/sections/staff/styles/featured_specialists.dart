import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../staff_tokens.dart';

class FeaturedSpecialistsStyle extends StatelessWidget {
  const FeaturedSpecialistsStyle({super.key});

  static const int _cardCount = 4;

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final cardWidth = AppSizes.w(context, 0.82);
    final cardHeight = AppSizes.h(context, 0.22);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StaffTokens.sectionHeader(context),
        SizedBox(height: StaffTokens.gapMd(context)),
        SizedBox(
          height: cardHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: StaffTokens.sectionPadding(context),
            itemCount: _cardCount,
            separatorBuilder: (_, __) =>
                SizedBox(width: StaffTokens.gapMd(context)),
            itemBuilder: (context, index) {
              final member = StaffTokens.members[index];
              final isFeatured = index == 0;

              return Container(
                width: cardWidth,
                decoration: BoxDecoration(
                  color: StaffTokens.surface(context),
                  borderRadius: StaffTokens.borderLg(context),
                  border: Border.all(
                    color: isFeatured
                        ? member.accentHint.withOpacity(0.35)
                        : palette.border,
                    width: isFeatured ? 1.5 : 1,
                  ),
                  boxShadow: isFeatured
                      ? StaffTokens.elevatedShadow(context)
                      : StaffTokens.cardShadow(context),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: AppSizes.w(context, 0.32),
                      child: ClipRRect(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(context.ds.tokens.radiusLg),
                        ),
                        child: StaffTokens.profileImage(
                          context,
                          width: AppSizes.w(context, 0.32),
                          height: cardHeight,
                          shape: StaffImageShape.roundedRectangle,
                          accentHint: member.accentHint,
                          elevated: false,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(AppSizes.w(context, 0.045)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (isFeatured)
                              Padding(
                                padding: EdgeInsets.only(
                                  bottom: StaffTokens.gapXs(context),
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: AppSizes.w(context, 0.025),
                                    vertical: AppSizes.h(context, 0.004),
                                  ),
                                  decoration: BoxDecoration(
                                    color: member.accentHint.withOpacity(0.12),
                                    borderRadius: StaffTokens.borderSm(context),
                                  ),
                                  child: StaffTokens.textLine(
                                    context,
                                    widthFactor: 0.14,
                                    heightFactor: 0.005,
                                  ),
                                ),
                              ),
                            StaffTokens.nameLine(
                              context,
                              widthFactor: 0.34,
                            ),
                            SizedBox(height: StaffTokens.gapSm(context)),
                            StaffTokens.roleLine(
                              context,
                              widthFactor: 0.26,
                            ),
                            SizedBox(height: StaffTokens.gapMd(context)),
                            StaffTokens.bioBlock(
                              context,
                              lines: 2,
                              widthFactor: 0.38,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
