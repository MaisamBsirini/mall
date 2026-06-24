import 'package:flutter/material.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../../../design_system/scope/design_system_scope.dart';
import '../../widgets/ui_placeholders.dart';

/// Media 1 — hero image with floating pill indicators.
class HeroFullWidthMedia extends StatefulWidget {
  const HeroFullWidthMedia({super.key});

  @override
  State<HeroFullWidthMedia> createState() => _HeroFullWidthMediaState();
}

class _HeroFullWidthMediaState extends State<HeroFullWidthMedia> {
  int _active = 0;

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final height = AppSizes.h(context, 0.28);
    final count = ProductDetailUi.imageCount(context);
    final padding = ProductDetailUi.pagePadding(context);

    if (count == 0) {
      return Padding(
        padding: padding,
        child: ProductDetailUi.emptyImageBlock(
          context,
          height: height,
          borderRadius: BorderRadius.circular(20),
        ),
      );
    }

    final showIndicators = count > 1;

    return Padding(
      padding: padding,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Material(
            color: Colors.transparent,
            child: Container(
                height: height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: ProductDetailUi.softShadow(context, opacity: 0.14),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ProductDetailUi.imageBlock(
                        context,
                        height: height,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              palette.overlayDark.withValues(alpha: 0.02),
                              palette.overlayDark.withValues(alpha: 0.18),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          if (showIndicators)
            Positioned(
              left: 0,
              right: 0,
              bottom: 12,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: palette.surface.withValues(alpha: 0.88),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: ProductDetailUi.softShadow(context, opacity: 0.08, blur: 10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(count.clamp(1, 6), (i) {
                      final active = i == _active;
                      return GestureDetector(
                        onTap: () => setState(() => _active = i),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 220),
                          curve: Curves.easeOutCubic,
                          width: active ? 18 : 6,
                          height: 6,
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                            color: active
                                ? palette.primary
                                : palette.primarySoft(0.28),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
