import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../certifications_tokens.dart';

class CertificationTimelineStyle extends StatelessWidget {
  const CertificationTimelineStyle({super.key});

  static const int _itemCount = 4;

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: CertificationsTokens.sectionPadding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CertificationsTokens.titleLine(context, widthFactor: 0.34),
              SizedBox(height: CertificationsTokens.gapXs(context)),
              CertificationsTokens.organizationLine(context, widthFactor: 0.26),
            ],
          ),
        ),
        SizedBox(height: CertificationsTokens.gapMd(context)),
        Padding(
          padding: CertificationsTokens.sectionPadding(context),
          child: Stack(
            children: [
              Positioned(
                left: AppSizes.w(context, 0.46),
                top: 0,
                bottom: 0,
                child: Container(
                  width: 2,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        palette.primary.withOpacity(0.05),
                        palette.primary.withOpacity(0.35),
                        palette.primary.withOpacity(0.05),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                children: List.generate(_itemCount, (index) {
                  final slot = CertificationsTokens.achievements[index];
                  final isLeft = index.isEven;

                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: index < _itemCount - 1
                          ? CertificationsTokens.gapLg(context)
                          : 0,
                    ),
                    child: _TimelineEntry(
                      slot: slot,
                      isLeft: isLeft,
                      isFirst: index == 0,
                      isLast: index == _itemCount - 1,
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TimelineEntry extends StatelessWidget {
  final AchievementSlot slot;
  final bool isLeft;
  final bool isFirst;
  final bool isLast;

  const _TimelineEntry({
    required this.slot,
    required this.isLeft,
    required this.isFirst,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final cardWidth = AppSizes.w(context, 0.40);
    final certHeight = AppSizes.h(context, 0.10);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: isLeft
                ? _TimelineCard(
                    slot: slot,
                    width: cardWidth,
                    certHeight: certHeight,
                    alignment: CrossAxisAlignment.end,
                  )
                : const SizedBox.shrink(),
          ),
          SizedBox(
            width: AppSizes.w(context, 0.08),
            child: Column(
              children: [
                if (isFirst) SizedBox(height: CertificationsTokens.gapSm(context)),
                Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: palette.surface,
                    border: Border.all(
                      color: slot.accentHint.withOpacity(0.70),
                      width: 2.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: slot.accentHint.withOpacity(0.25),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Container(
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: slot.accentHint,
                      ),
                    ),
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 1,
                      margin: EdgeInsets.symmetric(
                        vertical: CertificationsTokens.gapXs(context),
                      ),
                      color: palette.primarySoft(0.15),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: !isLeft
                ? _TimelineCard(
                    slot: slot,
                    width: cardWidth,
                    certHeight: certHeight,
                    alignment: CrossAxisAlignment.start,
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

class _TimelineCard extends StatelessWidget {
  final AchievementSlot slot;
  final double width;
  final double certHeight;
  final CrossAxisAlignment alignment;

  const _TimelineCard({
    required this.slot,
    required this.width,
    required this.certHeight,
    required this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;

    return Align(
      alignment: alignment == CrossAxisAlignment.end
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Container(
        width: width,
        padding: EdgeInsets.all(AppSizes.w(context, 0.035)),
        decoration: BoxDecoration(
          color: CertificationsTokens.surface(context),
          borderRadius: CertificationsTokens.borderMd(context),
          border: Border.all(color: slot.accentHint.withOpacity(0.18)),
          boxShadow: CertificationsTokens.cardShadow(context),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CertificationsTokens.badgePlaceholder(
                  context,
                  size: AppSizes.w(context, 0.08),
                  shape: BadgeShape.circle,
                  accentHint: slot.accentHint,
                  elevated: false,
                ),
                SizedBox(width: CertificationsTokens.gapSm(context)),
                Expanded(
                  child: CertificationsTokens.dateLine(
                    context,
                    widthFactor: 0.14,
                  ),
                ),
              ],
            ),
            SizedBox(height: CertificationsTokens.gapSm(context)),
            CertificationsTokens.certificateImage(
              context,
              width: width - AppSizes.w(context, 0.07),
              height: certHeight,
              accentHint: slot.accentHint,
            ),
            SizedBox(height: CertificationsTokens.gapSm(context)),
            CertificationsTokens.titleLine(context, widthFactor: 0.28),
            SizedBox(height: CertificationsTokens.gapXs(context)),
            CertificationsTokens.organizationLine(context, widthFactor: 0.20),
            SizedBox(height: CertificationsTokens.gapXs(context)),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.w(context, 0.025),
                vertical: AppSizes.h(context, 0.005),
              ),
              decoration: BoxDecoration(
                color: palette.primarySoft(0.06),
                borderRadius: CertificationsTokens.borderSm(context),
              ),
              child: CertificationsTokens.credentialLine(
                context,
                widthFactor: 0.22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
