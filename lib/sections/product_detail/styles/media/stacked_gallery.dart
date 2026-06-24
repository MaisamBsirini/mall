import 'package:flutter/material.dart';

import '../../../../design_system/scope/design_system_scope.dart';
import '../../widgets/ui_placeholders.dart';

/// Media 3 — partially stacked cards with depth.
class StackedGalleryMedia extends StatelessWidget {
  const StackedGalleryMedia({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final count = ProductDetailUi.imageCount(context);
    final padding = ProductDetailUi.pagePadding(context);
    const cardHeight = 132.0;

    if (count == 0) {
      return Padding(
        padding: padding,
        child: ProductDetailUi.emptyImageBlock(
          context,
          height: cardHeight + 24,
          borderRadius: BorderRadius.circular(18),
        ),
      );
    }

    final layers = count == 1 ? 1 : count.clamp(2, 4);

    return Padding(
      padding: padding,
      child: SizedBox(
        height: cardHeight + (layers - 1) * 14.0,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            for (var i = layers - 1; i >= 0; i--)
              Positioned(
                top: i * 12.0,
                left: i * 6.0,
                right: i * 6.0,
                child: Transform.rotate(
                  angle: (i - 1) * 0.018,
                  child: Material(
                    elevation: (layers - i) * 1.5,
                    shadowColor: palette.overlayDark.withValues(alpha: 0.18),
                    borderRadius: BorderRadius.circular(18),
                    child: Container(
                      height: cardHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: palette.surface.withValues(alpha: 0.9),
                          width: 1.5,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(17),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            ProductDetailUi.imageBlock(
                              context,
                              height: cardHeight,
                              borderRadius: BorderRadius.circular(17),
                            ),
                            if (i == 0 && layers > 1)
                              Positioned(
                                right: 10,
                                top: 10,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: palette.surface.withValues(alpha: 0.92),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    '1 / $count',
                                    style: context.ds.typography.caption(context).copyWith(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
