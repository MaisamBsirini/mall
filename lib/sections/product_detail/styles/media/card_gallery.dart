import 'package:flutter/material.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../../../design_system/scope/design_system_scope.dart';
import '../../widgets/ui_placeholders.dart';

/// Media 5 — floating overlapping cards with soft shadows.
class CardGalleryMedia extends StatelessWidget {
  const CardGalleryMedia({super.key});

  @override
  Widget build(BuildContext context) {
    final count = ProductDetailUi.imageCount(context);
    final cardHeight = AppSizes.h(context, 0.20);
    final padding = ProductDetailUi.pagePadding(context);

    if (count == 0) {
      return Padding(
        padding: padding,
        child: ProductDetailUi.emptyImageBlock(
          context,
          height: cardHeight,
          borderRadius: BorderRadius.circular(20),
        ),
      );
    }

    if (count == 1) {
      return Padding(
        padding: padding,
        child: _FloatingCard(
          context: context,
          height: cardHeight,
          width: double.infinity,
          elevation: 6,
          rotation: 0,
        ),
      );
    }

    final cards = count.clamp(2, 5);

    return Padding(
      padding: padding,
      child: SizedBox(
        height: cardHeight + 28,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            for (var i = 0; i < cards; i++)
              Positioned(
                left: i * 18.0,
                right: (cards - 1 - i) * 18.0,
                top: i * 6.0,
                child: Transform.rotate(
                  angle: (i - 1) * 0.035,
                  child: _FloatingCard(
                    context: context,
                    height: cardHeight - i * 4,
                    width: AppSizes.w(context, 0.72),
                    elevation: (cards - i + 2).toDouble(),
                    rotation: 0,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _FloatingCard extends StatelessWidget {
  final BuildContext context;
  final double height;
  final double width;
  final double elevation;
  final double rotation;

  const _FloatingCard({
    required this.context,
    required this.height,
    required this.width,
    required this.elevation,
    required this.rotation,
  });

  @override
  Widget build(BuildContext _) {
    final palette = context.ds.palette;

    return Material(
      elevation: elevation,
      shadowColor: palette.overlayDark.withValues(alpha: 0.22),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: palette.surface, width: 2),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: ProductDetailUi.imageBlock(
            context,
            height: height,
            width: width,
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}
