import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../social_tokens.dart';

class SocialCarouselStyle extends StatelessWidget {
  const SocialCarouselStyle({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final cardWidth = AppSizes.w(context, 0.74);
    final cardHeight = AppSizes.h(context, 0.28);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SocialTokens.sectionHeader(context),
        SizedBox(height: SocialTokens.gapMd(context)),
        SizedBox(
          height: cardHeight + AppSizes.h(context, 0.02),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: SocialTokens.sectionPadding(context),
            itemCount: SocialTokens.platformCount,
            separatorBuilder: (_, __) =>
                SizedBox(width: SocialTokens.gapMd(context)),
            itemBuilder: (context, index) {
              final slot = SocialTokens.platforms[index];
              final isFeatured = index == 0;

              return Container(
                width: cardWidth,
                decoration: BoxDecoration(
                  borderRadius: SocialTokens.borderLg(context),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: isFeatured
                        ? [
                            palette.primarySoft(0.14),
                            palette.surface,
                          ]
                        : [
                            palette.surface,
                            palette.primarySoft(0.05),
                          ],
                  ),
                  border: Border.all(
                    color: isFeatured
                        ? palette.primary.withOpacity(0.22)
                        : palette.border,
                  ),
                  boxShadow: isFeatured
                      ? SocialTokens.elevatedShadow(context)
                      : SocialTokens.cardShadow(context),
                ),
                child: Padding(
                  padding: EdgeInsets.all(AppSizes.w(context, 0.05)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SocialTokens.platformIcon(
                            context,
                            size: AppSizes.w(context, 0.14),
                            accentHint: slot.accentHint,
                          ),
                          SizedBox(width: SocialTokens.gapMd(context)),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SocialTokens.usernameLine(
                                  context,
                                  widthFactor: 0.38,
                                ),
                                SizedBox(height: SocialTokens.gapXs(context)),
                                SocialTokens.textLine(
                                  context,
                                  widthFactor: 0.24,
                                  heightFactor: 0.006,
                                ),
                              ],
                            ),
                          ),
                          if (isFeatured)
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppSizes.w(context, 0.025),
                                vertical: AppSizes.h(context, 0.006),
                              ),
                              decoration: BoxDecoration(
                                color: palette.primary.withOpacity(0.12),
                                borderRadius: SocialTokens.borderSm(context),
                              ),
                              child: SocialTokens.textLine(
                                context,
                                widthFactor: 0.10,
                                heightFactor: 0.006,
                              ),
                            ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: List.generate(3, (statIndex) {
                          return Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: statIndex < 2
                                    ? SocialTokens.gapSm(context)
                                    : 0,
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppSizes.w(context, 0.03),
                                  vertical: AppSizes.h(context, 0.012),
                                ),
                                decoration: BoxDecoration(
                                  color: palette.placeholderLight,
                                  borderRadius: SocialTokens.borderSm(context),
                                ),
                                child: SocialTokens.followerStat(
                                  context,
                                  widthFactor: 0.16,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: SocialTokens.gapMd(context)),
                      Row(
                        children: [
                          Expanded(
                            child: SocialTokens.ctaPill(context),
                          ),
                          SizedBox(width: SocialTokens.gapSm(context)),
                          Container(
                            width: AppSizes.w(context, 0.11),
                            height: AppSizes.w(context, 0.11),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: slot.accentHint.withOpacity(0.10),
                              border: Border.all(
                                color: slot.accentHint.withOpacity(0.25),
                              ),
                            ),
                            child: Center(
                              child: SocialTokens.shimmerBox(
                                context,
                                width: AppSizes.w(context, 0.04),
                                height: AppSizes.w(context, 0.04),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
