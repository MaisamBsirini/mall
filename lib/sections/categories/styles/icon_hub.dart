import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../categories_tokens.dart';

class IconHubStyle extends StatelessWidget {
  const IconHubStyle({super.key});

  static const List<double> _orbitAngles = [
    -math.pi / 2,
    -math.pi / 4,
    0,
    math.pi / 4,
    math.pi / 2,
    math.pi * 0.75,
    math.pi,
    -math.pi * 0.75,
  ];

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final hubSize = AppSizes.w(context, 0.82);
    final orbitRadius = AppSizes.w(context, 0.28);
    final iconSize = AppSizes.w(context, 0.12);
    final centerSize = AppSizes.w(context, 0.18);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: CategoriesTokens.sectionPadding(context),
          child: Row(
            children: [
              Expanded(
                child: CategoriesTokens.titleLine(context, widthFactor: 0.26),
              ),
              CategoriesTokens.itemCountBadge(context, widthFactor: 0.12),
            ],
          ),
        ),
        SizedBox(height: CategoriesTokens.gapMd(context)),
        Padding(
          padding: CategoriesTokens.sectionPadding(context),
          child: Container(
            height: hubSize,
            decoration: BoxDecoration(
              color: CategoriesTokens.surface(context),
              borderRadius: CategoriesTokens.borderLg(context),
              border: Border.all(color: palette.border),
              boxShadow: CategoriesTokens.cardShadow(context),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: Size(hubSize, hubSize),
                  painter: _HubGuidePainter(
                    angles: _orbitAngles,
                    orbitRadius: orbitRadius,
                    color: palette.primarySoft(0.10),
                  ),
                ),
                ...List.generate(8, (index) {
                  final slot = CategoriesTokens.categories[index];
                  final offset = CategoriesTokens.polarOffset(
                    orbitRadius,
                    _orbitAngles[index],
                  );

                  return Transform.translate(
                    offset: offset,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CategoriesTokens.iconPlaceholder(
                          context,
                          size: iconSize,
                          slot: slot,
                          shape: index.isEven
                              ? CategoryIconShape.circle
                              : CategoryIconShape.rounded,
                        ),
                        SizedBox(height: CategoriesTokens.gapXs(context)),
                        CategoriesTokens.titleLine(
                          context,
                          widthFactor: 0.10,
                        ),
                      ],
                    ),
                  );
                }),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: centerSize,
                      height: centerSize,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            palette.primary,
                            palette.primary.withOpacity(0.75),
                          ],
                        ),
                        boxShadow: CategoriesTokens.elevatedShadow(context),
                      ),
                      child: Icon(
                        Icons.grid_view_rounded,
                        size: centerSize * 0.40,
                        color: palette.onPrimary,
                      ),
                    ),
                    SizedBox(height: CategoriesTokens.gapSm(context)),
                    CategoriesTokens.textLine(
                      context,
                      widthFactor: 0.16,
                      heightFactor: 0.007,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _HubGuidePainter extends CustomPainter {
  final List<double> angles;
  final double orbitRadius;
  final Color color;

  _HubGuidePainter({
    required this.angles,
    required this.orbitRadius,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, orbitRadius, paint);

    for (final angle in angles) {
      final end = center + CategoriesTokens.polarOffset(orbitRadius, angle);
      canvas.drawLine(center, end, paint..color = color.withOpacity(0.5));
    }
  }

  @override
  bool shouldRepaint(covariant _HubGuidePainter oldDelegate) => false;
}
