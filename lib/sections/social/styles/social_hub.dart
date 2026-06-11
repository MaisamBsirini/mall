import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../social_tokens.dart';

class SocialHubStyle extends StatelessWidget {
  const SocialHubStyle({super.key});

  static const List<double> _orbitAngles = [
    -math.pi / 2,
    -math.pi / 6,
    math.pi / 3,
    math.pi * 0.75,
    math.pi * 1.35,
  ];

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final hubSize = AppSizes.w(context, 0.88);
    final profileSize = AppSizes.w(context, 0.22);
    final orbitRadius = AppSizes.w(context, 0.30);
    final platformSize = AppSizes.w(context, 0.13);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SocialTokens.sectionHeader(context),
        SizedBox(height: SocialTokens.gapMd(context)),
        Padding(
          padding: SocialTokens.sectionPadding(context),
          child: Container(
            height: hubSize,
            decoration: BoxDecoration(
              borderRadius: SocialTokens.borderLg(context),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  palette.surface,
                  palette.primarySoft(0.06),
                  palette.surface,
                ],
              ),
              border: Border.all(color: palette.primarySoft(0.10)),
              boxShadow: SocialTokens.elevatedShadow(context),
            ),
            child: ClipRRect(
              borderRadius: SocialTokens.borderLg(context),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned.fill(
                    child: CustomPaint(
                      painter: _HubConnectionPainter(
                        angles: _orbitAngles,
                        orbitRadius: orbitRadius,
                        lineColor: palette.primarySoft(0.18),
                        dotColor: palette.primary.withOpacity(0.35),
                      ),
                    ),
                  ),
                  Positioned(
                    top: AppSizes.h(context, 0.018),
                    right: AppSizes.w(context, 0.04),
                    child: _FloatingBadge(context: context),
                  ),
                  ...List.generate(SocialTokens.platforms.length, (index) {
                    final slot = SocialTokens.platforms[index];
                    final offset = SocialTokens.polarOffset(
                      orbitRadius,
                      _orbitAngles[index],
                    );

                    return Transform.translate(
                      offset: offset,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SocialTokens.platformIcon(
                            context,
                            size: platformSize,
                            accentHint: slot.accentHint,
                          ),
                          SizedBox(height: SocialTokens.gapXs(context)),
                          SocialTokens.shimmerBox(
                            context,
                            width: AppSizes.w(context, 0.10),
                            height: AppSizes.h(context, 0.005),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ],
                      ),
                    );
                  }),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SocialTokens.profileImage(
                        context,
                        size: profileSize,
                        borderWidth: 3.5,
                      ),
                      SizedBox(height: SocialTokens.gapMd(context)),
                      SocialTokens.usernameLine(
                        context,
                        widthFactor: 0.28,
                      ),
                      SizedBox(height: SocialTokens.gapXs(context)),
                      SocialTokens.textLine(
                        context,
                        widthFactor: 0.18,
                        heightFactor: 0.006,
                      ),
                      SizedBox(height: SocialTokens.gapSm(context)),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _HubStatChip(context: context),
                          SizedBox(width: SocialTokens.gapSm(context)),
                          _HubStatChip(context: context, compact: true),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _HubStatChip extends StatelessWidget {
  final BuildContext context;
  final bool compact;

  const _HubStatChip({
    required this.context,
    this.compact = false,
  });

  @override
  Widget build(BuildContext _) {
    final palette = context.ds.palette;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w(context, compact ? 0.03 : 0.04),
        vertical: AppSizes.h(context, 0.008),
      ),
      decoration: BoxDecoration(
        color: palette.primarySoft(0.08),
        borderRadius: SocialTokens.borderSm(context),
        border: Border.all(color: palette.primarySoft(0.14)),
      ),
      child: SocialTokens.textLine(
        context,
        widthFactor: compact ? 0.10 : 0.14,
        heightFactor: 0.007,
      ),
    );
  }
}

class _FloatingBadge extends StatelessWidget {
  final BuildContext context;

  const _FloatingBadge({required this.context});

  @override
  Widget build(BuildContext _) {
    final palette = context.ds.palette;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w(context, 0.035),
        vertical: AppSizes.h(context, 0.009),
      ),
      decoration: BoxDecoration(
        color: palette.primary,
        borderRadius: SocialTokens.borderLg(context),
        boxShadow: [
          BoxShadow(
            color: palette.primary.withOpacity(0.35),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: SocialTokens.textLine(
        context,
        widthFactor: 0.14,
        heightFactor: 0.007,
      ),
    );
  }
}

class _HubConnectionPainter extends CustomPainter {
  final List<double> angles;
  final double orbitRadius;
  final Color lineColor;
  final Color dotColor;

  _HubConnectionPainter({
    required this.angles,
    required this.orbitRadius,
    required this.lineColor,
    required this.dotColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final linePaint = Paint()
      ..color = lineColor
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke;

    final dotPaint = Paint()
      ..color = dotColor
      ..style = PaintingStyle.fill;

    for (final angle in angles) {
      final end = center + SocialTokens.polarOffset(orbitRadius, angle);
      canvas.drawLine(center, end, linePaint);
      canvas.drawCircle(end, 3, dotPaint);
    }

    canvas.drawCircle(center, 4, dotPaint);
  }

  @override
  bool shouldRepaint(covariant _HubConnectionPainter oldDelegate) => false;
}
