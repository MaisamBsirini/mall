import 'package:flutter/material.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../../../design_system/scope/design_system_scope.dart';
import '../../widgets/ui_placeholders.dart';

/// Info 3 — overlay card composition on image area.
class OverlayInfoStyle extends StatelessWidget {
  const OverlayInfoStyle({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final height = AppSizes.h(context, 0.22);

    return Padding(
      padding: ProductDetailUi.pagePadding(context),
      child: Stack(
        children: [
          ProductDetailUi.adaptiveImageBlock(
            context,
            height: height,
            borderRadius: ProductDetailUi.radiusMd(context),
          ),
          Positioned(
            left: ProductDetailUi.gapMd(context),
            right: ProductDetailUi.gapMd(context),
            bottom: ProductDetailUi.gapMd(context),
            child: Container(
              padding: EdgeInsets.all(ProductDetailUi.gapMd(context)),
              decoration: BoxDecoration(
                color: palette.surface.withValues(alpha: 0.92),
                borderRadius: ProductDetailUi.radiusSm(context),
                border: Border.all(color: palette.border.withValues(alpha: 0.4)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductDetailUi.titleBlock(context, lines: 1, primaryWidth: 0.72),
                  SizedBox(height: ProductDetailUi.gapXs(context)),
                  ProductDetailUi.descriptionBlock(context, compact: true, lines: 2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
