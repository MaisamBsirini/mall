import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../certifications_tokens.dart';

class HallOfAchievementsStyle extends StatelessWidget {
  const HallOfAchievementsStyle({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final featuredWidth = AppSizes.w(context, 0.84);
    final featuredHeight = AppSizes.h(context, 0.26);
    final smallWidth = AppSizes.w(context, 0.26);
    final smallHeight = AppSizes.h(context, 0.14);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CertificationsTokens.sectionHeader(context),
        SizedBox(height: CertificationsTokens.gapMd(context)),
        Padding(
          padding: CertificationsTokens.sectionPadding(context),
          child: Container(
            padding: EdgeInsets.all(AppSizes.w(context, 0.045)),
            decoration: BoxDecoration(
              color: CertificationsTokens.surface(context),
              borderRadius: CertificationsTokens.borderLg(context),
              border: Border.all(color: palette.primarySoft(0.10)),
              boxShadow: CertificationsTokens.elevatedShadow(context),
            ),
            child: Column(
              children: [
                _MuseumPlaque(context: context),
                SizedBox(height: CertificationsTokens.gapLg(context)),
                CertificationsTokens.certificateImage(
                  context,
                  width: featuredWidth,
                  height: featuredHeight,
                  featured: true,
                  accentHint: CertificationsTokens.achievements.first.accentHint,
                ),
                SizedBox(height: CertificationsTokens.gapMd(context)),
                CertificationsTokens.metaBlock(
                  context,
                  includeCredential: true,
                ),
                SizedBox(height: CertificationsTokens.gapLg(context)),
                Container(
                  height: 1,
                  margin: EdgeInsets.symmetric(
                    horizontal: AppSizes.w(context, 0.08),
                  ),
                  color: palette.primarySoft(0.12),
                ),
                SizedBox(height: CertificationsTokens.gapLg(context)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(3, (index) {
                    final slot = CertificationsTokens.achievements[index + 1];
                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: index > 0 ? CertificationsTokens.gapSm(context) : 0,
                          right: index < 2 ? CertificationsTokens.gapSm(context) : 0,
                        ),
                        child: Column(
                          children: [
                            CertificationsTokens.certificateImage(
                              context,
                              width: smallWidth,
                              height: smallHeight,
                              accentHint: slot.accentHint,
                            ),
                            SizedBox(height: CertificationsTokens.gapSm(context)),
                            CertificationsTokens.titleLine(
                              context,
                              widthFactor: 0.18,
                            ),
                            SizedBox(height: CertificationsTokens.gapXs(context)),
                            CertificationsTokens.dateLine(
                              context,
                              widthFactor: 0.10,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _MuseumPlaque extends StatelessWidget {
  final BuildContext context;

  const _MuseumPlaque({required this.context});

  @override
  Widget build(BuildContext _) {
    final palette = context.ds.palette;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w(context, 0.06),
        vertical: AppSizes.h(context, 0.010),
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            palette.primarySoft(0.10),
            palette.primarySoft(0.04),
          ],
        ),
        borderRadius: CertificationsTokens.borderSm(context),
        border: Border.all(color: palette.accent.withOpacity(0.20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: palette.accent.withOpacity(0.60),
            ),
          ),
          SizedBox(width: CertificationsTokens.gapSm(context)),
          CertificationsTokens.textLine(
            context,
            widthFactor: 0.28,
            heightFactor: 0.007,
          ),
          SizedBox(width: CertificationsTokens.gapSm(context)),
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: palette.accent.withOpacity(0.60),
            ),
          ),
        ],
      ),
    );
  }
}
