import 'package:flutter/material.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../../../design_system/scope/design_system_scope.dart';
import '../../widgets/ui_placeholders.dart';

/// Media 2 — large preview with horizontal thumbnail strip.
class SwipeGalleryMedia extends StatefulWidget {
  const SwipeGalleryMedia({super.key});

  @override
  State<SwipeGalleryMedia> createState() => _SwipeGalleryMediaState();
}

class _SwipeGalleryMediaState extends State<SwipeGalleryMedia> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final count = ProductDetailUi.imageCount(context);
    final previewHeight = AppSizes.h(context, 0.24);
    final thumbSize = 52.0;
    final padding = ProductDetailUi.pagePadding(context);

    if (count == 0) {
      return Padding(
        padding: padding,
        child: ProductDetailUi.emptyImageBlock(
          context,
          height: previewHeight,
          borderRadius: BorderRadius.circular(16),
        ),
      );
    }

    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 280),
            switchInCurve: Curves.easeOutCubic,
            child: Container(
              key: ValueKey(_selected),
              height: previewHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: ProductDetailUi.softShadow(context),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: ProductDetailUi.imageBlock(
                  context,
                  height: previewHeight,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          if (count > 1) ...[
            SizedBox(height: ProductDetailUi.gapMd(context)),
            SizedBox(
              height: thumbSize + 8,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: count.clamp(1, 6),
                separatorBuilder: (_, __) =>
                    SizedBox(width: ProductDetailUi.gapSm(context)),
                itemBuilder: (_, i) {
                  final selected = i == _selected;
                  return GestureDetector(
                    onTap: () => setState(() => _selected = i),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 220),
                      width: thumbSize,
                      height: thumbSize,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: selected ? palette.primary : palette.border,
                          width: selected ? 2 : 1,
                        ),
                        boxShadow: selected
                            ? ProductDetailUi.softShadow(context, opacity: 0.12, blur: 8)
                            : null,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(11),
                        child: ProductDetailUi.imageBlock(
                          context,
                          width: thumbSize,
                          height: thumbSize,
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ],
      ),
    );
  }
}
