import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../certifications_tokens.dart';

class BadgeCollectionStyle extends StatelessWidget {
  const BadgeCollectionStyle({super.key});

  static const List<_BadgeLayout> _layouts = [
    _BadgeLayout(
      shape: BadgeShape.medallion,
      sizeFactor: 0.28,
      flex: 2,
    ),
    _BadgeLayout(
      shape: BadgeShape.circle,
      sizeFactor: 0.18,
      flex: 1,
    ),
    _BadgeLayout(
      shape: BadgeShape.shield,
      sizeFactor: 0.20,
      flex: 1,
    ),
    _BadgeLayout(
      shape: BadgeShape.circle,
      sizeFactor: 0.16,
      flex: 1,
    ),
    _BadgeLayout(
      shape: BadgeShape.shield,
      sizeFactor: 0.22,
      flex: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;

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
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  palette.primarySoft(0.06),
                  CertificationsTokens.surface(context),
                  palette.primarySoft(0.04),
                ],
              ),
              borderRadius: CertificationsTokens.borderLg(context),
              border: Border.all(color: palette.border),
              boxShadow: CertificationsTokens.cardShadow(context),
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: _BadgeTile(
                        layout: _layouts[0],
                        slot: CertificationsTokens.achievements[0],
                        featured: true,
                      ),
                    ),
                    SizedBox(width: CertificationsTokens.gapMd(context)),
                    Expanded(
                      child: Column(
                        children: [
                          _BadgeTile(
                            layout: _layouts[1],
                            slot: CertificationsTokens.achievements[1],
                          ),
                          SizedBox(height: CertificationsTokens.gapMd(context)),
                          _BadgeTile(
                            layout: _layouts[2],
                            slot: CertificationsTokens.achievements[2],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: CertificationsTokens.gapLg(context)),
                Row(
                  children: List.generate(2, (index) {
                    final layout = _layouts[index + 3];
                    final slot = CertificationsTokens.achievements[index + 3];
                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: index == 0
                              ? CertificationsTokens.gapSm(context)
                              : 0,
                        ),
                        child: _BadgeTile(layout: layout, slot: slot),
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

class _BadgeLayout {
  final BadgeShape shape;
  final double sizeFactor;
  final int flex;

  const _BadgeLayout({
    required this.shape,
    required this.sizeFactor,
    required this.flex,
  });
}

class _BadgeTile extends StatelessWidget {
  final _BadgeLayout layout;
  final AchievementSlot slot;
  final bool featured;

  const _BadgeTile({
    required this.layout,
    required this.slot,
    this.featured = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = AppSizes.w(context, layout.sizeFactor);

    return Column(
      children: [
        CertificationsTokens.badgePlaceholder(
          context,
          size: size,
          shape: layout.shape,
          accentHint: slot.accentHint,
          elevated: featured,
        ),
        SizedBox(height: CertificationsTokens.gapSm(context)),
        CertificationsTokens.titleLine(
          context,
          widthFactor: featured ? 0.24 : 0.16,
        ),
        SizedBox(height: CertificationsTokens.gapXs(context)),
        CertificationsTokens.dateLine(
          context,
          widthFactor: featured ? 0.14 : 0.10,
        ),
        if (featured) ...[
          SizedBox(height: CertificationsTokens.gapSm(context)),
          CertificationsTokens.organizationLine(
            context,
            widthFactor: 0.20,
          ),
        ],
      ],
    );
  }
}
