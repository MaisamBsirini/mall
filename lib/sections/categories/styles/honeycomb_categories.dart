import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../categories_tokens.dart';

class HoneycombCategoriesStyle extends StatelessWidget {
  const HoneycombCategoriesStyle({super.key});

  static const List<_HexPosition> _positions = [
    _HexPosition(col: 1, row: 0, sizeFactor: 0.26),
    _HexPosition(col: 0, row: 1, sizeFactor: 0.24),
    _HexPosition(col: 2, row: 1, sizeFactor: 0.24),
    _HexPosition(col: 1, row: 2, sizeFactor: 0.28, featured: true),
    _HexPosition(col: 0, row: 3, sizeFactor: 0.22),
    _HexPosition(col: 2, row: 3, sizeFactor: 0.22),
    _HexPosition(col: 1, row: 4, sizeFactor: 0.24),
  ];

  @override
  Widget build(BuildContext context) {
    final hexWidth = AppSizes.w(context, 0.28);
    final hexHeight = hexWidth * 0.866;
    final colGap = AppSizes.w(context, 0.02);
    final rowGap = AppSizes.h(context, 0.008);
    final gridHeight = hexHeight * 4.5 + rowGap * 4;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CategoriesTokens.sectionHeader(context),
        SizedBox(height: CategoriesTokens.gapMd(context)),
        Padding(
          padding: CategoriesTokens.sectionPadding(context),
          child: SizedBox(
            height: gridHeight,
            child: Stack(
              children: List.generate(_positions.length, (index) {
                final pos = _positions[index];
                final slot = CategoriesTokens.categories[index];
                final size = AppSizes.w(context, pos.sizeFactor);
                final left = pos.col * (hexWidth * 0.75 + colGap);
                final top = pos.row * (hexHeight * 0.75 + rowGap);

                return Positioned(
                  left: left,
                  top: top,
                  child: _HexCategoryTile(
                    slot: slot,
                    size: size,
                    featured: pos.featured,
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}

class _HexPosition {
  final int col;
  final int row;
  final double sizeFactor;
  final bool featured;

  const _HexPosition({
    required this.col,
    required this.row,
    required this.sizeFactor,
    this.featured = false,
  });
}

class _HexCategoryTile extends StatelessWidget {
  final CategorySlot slot;
  final double size;
  final bool featured;

  const _HexCategoryTile({
    required this.slot,
    required this.size,
    this.featured = false,
  });

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;

    return SizedBox(
      width: size,
      height: size * 0.866,
      child: CustomPaint(
        painter: _HexagonPainter(
          fillColor: featured
              ? slot.accentHint.withOpacity(0.18)
              : CategoriesTokens.surface(context),
          borderColor: slot.accentHint.withOpacity(featured ? 0.45 : 0.25),
          shadow: featured ? CategoriesTokens.elevatedShadow(context) : null,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                slot.iconHint,
                size: size * 0.28,
                color: slot.accentHint.withOpacity(0.65),
              ),
              SizedBox(height: CategoriesTokens.gapXs(context)),
              CategoriesTokens.titleLine(
                context,
                widthFactor: featured ? 0.16 : 0.12,
              ),
              if (featured) ...[
                SizedBox(height: CategoriesTokens.gapXs(context)),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.w(context, 0.02),
                    vertical: AppSizes.h(context, 0.004),
                  ),
                  decoration: BoxDecoration(
                    color: palette.primarySoft(0.10),
                    borderRadius: CategoriesTokens.borderSm(context),
                  ),
                  child: CategoriesTokens.textLine(
                    context,
                    widthFactor: 0.08,
                    heightFactor: 0.005,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _HexagonPainter extends CustomPainter {
  final Color fillColor;
  final Color borderColor;
  final List<BoxShadow>? shadow;

  _HexagonPainter({
    required this.fillColor,
    required this.borderColor,
    this.shadow,
  });

  Path _hexPath(Size size) {
    final w = size.width;
    final h = size.height;
    return Path()
      ..moveTo(w * 0.5, 0)
      ..lineTo(w, h * 0.25)
      ..lineTo(w, h * 0.75)
      ..lineTo(w * 0.5, h)
      ..lineTo(0, h * 0.75)
      ..lineTo(0, h * 0.25)
      ..close();
  }

  @override
  void paint(Canvas canvas, Size size) {
    final path = _hexPath(size);

    if (shadow != null && shadow!.isNotEmpty) {
      canvas.drawPath(
        path,
        Paint()
          ..color = shadow!.first.color
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 12),
      );
    }

    canvas.drawPath(
      path,
      Paint()
        ..color = fillColor
        ..style = PaintingStyle.fill,
    );
    canvas.drawPath(
      path,
      Paint()
        ..color = borderColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5,
    );
  }

  @override
  bool shouldRepaint(covariant _HexagonPainter oldDelegate) => false;
}
