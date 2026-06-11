import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../certifications_tokens.dart';

class CertificateWallStyle extends StatelessWidget {
  const CertificateWallStyle({super.key});

  @override
  Widget build(BuildContext context) {
    final gap = CertificationsTokens.gapSm(context);
    final margin = CertificationsTokens.horizontalMargin(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: CertificationsTokens.sectionPadding(context),
          child: CertificationsTokens.textLine(
            context,
            widthFactor: 0.26,
            heightFactor: 0.010,
          ),
        ),
        SizedBox(height: CertificationsTokens.gapMd(context)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: margin),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: _WallTile(
                      height: AppSizes.h(context, 0.28),
                      slotIndex: 0,
                      layout: _WallTileLayout.tall,
                    ),
                  ),
                  SizedBox(width: gap),
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        _WallTile(
                          height: AppSizes.h(context, 0.13),
                          slotIndex: 1,
                          layout: _WallTileLayout.compact,
                        ),
                        SizedBox(height: gap),
                        _WallTile(
                          height: AppSizes.h(context, 0.13),
                          slotIndex: 2,
                          layout: _WallTileLayout.compact,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: gap),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: _WallTile(
                      height: AppSizes.h(context, 0.16),
                      slotIndex: 3,
                      layout: _WallTileLayout.wide,
                    ),
                  ),
                  SizedBox(width: gap),
                  Expanded(
                    flex: 4,
                    child: _WallTile(
                      height: AppSizes.h(context, 0.16),
                      slotIndex: 4,
                      layout: _WallTileLayout.featured,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

enum _WallTileLayout { tall, compact, wide, featured }

class _WallTile extends StatelessWidget {
  final double height;
  final int slotIndex;
  final _WallTileLayout layout;

  const _WallTile({
    required this.height,
    required this.slotIndex,
    required this.layout,
  });

  @override
  Widget build(BuildContext context) {
    final slot = CertificationsTokens.achievements[
        slotIndex % CertificationsTokens.achievements.length];

    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: CertificationsTokens.borderMd(context),
        boxShadow: CertificationsTokens.cardShadow(context),
      ),
      child: ClipRRect(
        borderRadius: CertificationsTokens.borderMd(context),
        child: Stack(
          fit: StackFit.expand,
          children: [
            CertificationsTokens.shimmerBox(
              context,
              width: double.infinity,
              height: height,
              borderRadius: BorderRadius.zero,
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    slot.accentHint.withOpacity(0.08),
                    Colors.black.withOpacity(0.35),
                  ],
                  stops: const [0.4, 0.75, 1.0],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(AppSizes.w(context, 0.035)),
              child: _buildContent(context, slot),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, AchievementSlot slot) {
    switch (layout) {
      case _WallTileLayout.tall:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CertificationsTokens.badgePlaceholder(
              context,
              size: AppSizes.w(context, 0.09),
              shape: BadgeShape.circle,
              accentHint: slot.accentHint,
              elevated: false,
            ),
            const Spacer(),
            CertificationsTokens.titleLine(context, widthFactor: 0.30),
            SizedBox(height: CertificationsTokens.gapXs(context)),
            CertificationsTokens.dateLine(context, widthFactor: 0.12),
          ],
        );
      case _WallTileLayout.compact:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CertificationsTokens.titleLine(context, widthFactor: 0.22),
            SizedBox(height: CertificationsTokens.gapXs(context)),
            CertificationsTokens.organizationLine(context, widthFactor: 0.16),
          ],
        );
      case _WallTileLayout.wide:
        return Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CertificationsTokens.titleLine(context, widthFactor: 0.24),
                  SizedBox(height: CertificationsTokens.gapXs(context)),
                  CertificationsTokens.dateLine(context, widthFactor: 0.10),
                ],
              ),
            ),
            CertificationsTokens.badgePlaceholder(
              context,
              size: AppSizes.w(context, 0.08),
              shape: BadgeShape.shield,
              accentHint: slot.accentHint,
              elevated: false,
            ),
          ],
        );
      case _WallTileLayout.featured:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CertificationsTokens.badgePlaceholder(
                  context,
                  size: AppSizes.w(context, 0.08),
                  shape: BadgeShape.medallion,
                  accentHint: slot.accentHint,
                  elevated: false,
                ),
                const Spacer(),
                CertificationsTokens.dateLine(context, widthFactor: 0.10),
              ],
            ),
            const Spacer(),
            CertificationsTokens.titleLine(context, widthFactor: 0.28),
            SizedBox(height: CertificationsTokens.gapXs(context)),
            CertificationsTokens.credentialLine(context, widthFactor: 0.18),
          ],
        );
    }
  }
}
