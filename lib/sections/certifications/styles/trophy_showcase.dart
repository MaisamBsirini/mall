import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../certifications_tokens.dart';

class TrophyShowcaseStyle extends StatelessWidget {
  const TrophyShowcaseStyle({super.key});

  static const List<_SatelliteLayer> _satellites = [
    _SatelliteLayer(offsetX: -0.02, offsetY: 0.04, rotation: -0.06, scale: 0.88),
    _SatelliteLayer(offsetX: 0.38, offsetY: 0.02, rotation: 0.05, scale: 0.82),
    _SatelliteLayer(offsetX: 0.42, offsetY: 0.38, rotation: 0.04, scale: 0.78),
    _SatelliteLayer(offsetX: -0.01, offsetY: 0.42, rotation: -0.04, scale: 0.80),
  ];

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final heroWidth = AppSizes.w(context, 0.58);
    final heroHeight = AppSizes.h(context, 0.30);
    final stackHeight = heroHeight + AppSizes.h(context, 0.18);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: CertificationsTokens.sectionPadding(context),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CertificationsTokens.titleLine(context, widthFactor: 0.30),
                    SizedBox(height: CertificationsTokens.gapXs(context)),
                    CertificationsTokens.organizationLine(context),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.w(context, 0.03),
                  vertical: AppSizes.h(context, 0.007),
                ),
                decoration: BoxDecoration(
                  color: palette.accent.withOpacity(0.12),
                  borderRadius: CertificationsTokens.borderSm(context),
                  border: Border.all(color: palette.accent.withOpacity(0.25)),
                ),
                child: CertificationsTokens.textLine(
                  context,
                  widthFactor: 0.12,
                  heightFactor: 0.006,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: CertificationsTokens.gapMd(context)),
        SizedBox(
          height: stackHeight,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: AppSizes.w(context, 0.04),
                top: AppSizes.h(context, 0.02),
                child: CertificationsTokens.shimmerBox(
                  context,
                  width: AppSizes.w(context, 0.20),
                  height: AppSizes.h(context, 0.006),
                ),
              ),
              ...List.generate(_satellites.length, (index) {
                final layer = _satellites[index];
                final slot = CertificationsTokens.achievements[index + 1];

                return Positioned(
                  left: AppSizes.w(context, 0.04) +
                      AppSizes.w(context, layer.offsetX),
                  top: AppSizes.h(context, layer.offsetY),
                  child: Transform.rotate(
                    angle: layer.rotation,
                    child: Transform.scale(
                      scale: layer.scale,
                      child: _SatelliteCard(
                        slot: slot,
                        width: AppSizes.w(context, 0.30),
                        height: AppSizes.h(context, 0.12),
                      ),
                    ),
                  ),
                );
              }),
              Positioned(
                left: AppSizes.w(context, 0.16),
                top: AppSizes.h(context, 0.06),
                child: _HeroShowcaseCard(
                  width: heroWidth,
                  height: heroHeight,
                  slot: CertificationsTokens.achievements.first,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SatelliteLayer {
  final double offsetX;
  final double offsetY;
  final double rotation;
  final double scale;

  const _SatelliteLayer({
    required this.offsetX,
    required this.offsetY,
    required this.rotation,
    required this.scale,
  });
}

class _HeroShowcaseCard extends StatelessWidget {
  final double width;
  final double height;
  final AchievementSlot slot;

  const _HeroShowcaseCard({
    required this.width,
    required this.height,
    required this.slot,
  });

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;

    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(AppSizes.w(context, 0.04)),
      decoration: BoxDecoration(
        color: CertificationsTokens.surface(context),
        borderRadius: CertificationsTokens.borderLg(context),
        border: Border.all(color: slot.accentHint.withOpacity(0.30), width: 1.5),
        boxShadow: CertificationsTokens.elevatedShadow(context),
      ),
      child: Column(
        children: [
          Expanded(
            child: CertificationsTokens.trophyPlaceholder(
              context,
              width: width * 0.85,
              height: height * 0.62,
              accentHint: slot.accentHint,
            ),
          ),
          SizedBox(height: CertificationsTokens.gapSm(context)),
          CertificationsTokens.titleLine(context, widthFactor: 0.36),
          SizedBox(height: CertificationsTokens.gapXs(context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CertificationsTokens.organizationLine(context, widthFactor: 0.18),
              SizedBox(width: CertificationsTokens.gapMd(context)),
              Container(
                width: 4,
                height: 4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: palette.accent.withOpacity(0.50),
                ),
              ),
              SizedBox(width: CertificationsTokens.gapMd(context)),
              CertificationsTokens.dateLine(context, widthFactor: 0.10),
            ],
          ),
        ],
      ),
    );
  }
}

class _SatelliteCard extends StatelessWidget {
  final AchievementSlot slot;
  final double width;
  final double height;

  const _SatelliteCard({
    required this.slot,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(AppSizes.w(context, 0.03)),
      decoration: BoxDecoration(
        color: CertificationsTokens.surface(context),
        borderRadius: CertificationsTokens.borderMd(context),
        border: Border.all(color: slot.accentHint.withOpacity(0.15)),
        boxShadow: CertificationsTokens.cardShadow(context),
      ),
      child: Row(
        children: [
          CertificationsTokens.badgePlaceholder(
            context,
            size: AppSizes.w(context, 0.09),
            shape: BadgeShape.medallion,
            accentHint: slot.accentHint,
            elevated: false,
          ),
          SizedBox(width: CertificationsTokens.gapSm(context)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CertificationsTokens.titleLine(context, widthFactor: 0.20),
                SizedBox(height: CertificationsTokens.gapXs(context)),
                CertificationsTokens.dateLine(context, widthFactor: 0.10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
