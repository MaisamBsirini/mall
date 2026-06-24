import 'package:flutter/material.dart';

import '../../../../design_system/scope/design_system_scope.dart';
import '../../widgets/ui_placeholders.dart';

/// Reviews style 5 — minimal rating strip.
class MinimalRatingStrip extends StatelessWidget {
  const MinimalRatingStrip({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;

    return Padding(
      padding: ProductDetailUi.pagePadding(context),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: ProductDetailUi.gapMd(context),
          vertical: ProductDetailUi.gapSm(context),
        ),
        decoration: BoxDecoration(
          color: palette.primarySoft(0.08),
          borderRadius: ProductDetailUi.radiusMd(context),
          border: Border.all(color: palette.primarySoft(0.18)),
        ),
        child: Row(
          children: [
            Icon(Icons.star_rounded, size: 18, color: palette.primary),
            SizedBox(width: ProductDetailUi.gapXs(context)),
            ProductDetailUi.line(context, widthFactor: 0.10, heightFactor: 0.008),
            SizedBox(width: ProductDetailUi.gapSm(context)),
            Expanded(
              child: ProductDetailUi.line(context, widthFactor: 0.42, heightFactor: 0.006),
            ),
            Icon(
              Icons.chevron_right_rounded,
              size: 20,
              color: palette.textSecondary,
            ),
          ],
        ),
      ),
    );
  }
}
