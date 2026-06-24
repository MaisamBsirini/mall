import 'package:flutter/material.dart';

import '../../../../design_system/scope/design_system_scope.dart';
import '../../widgets/ui_placeholders.dart';

/// Reviews style 1 — rating summary block.
class RatingSummaryReviews extends StatelessWidget {
  const RatingSummaryReviews({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;

    return Padding(
      padding: ProductDetailUi.pagePadding(context),
      child: ProductDetailUi.sectionSurface(
        context,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _starRow(context),
                SizedBox(width: ProductDetailUi.gapSm(context)),
                ProductDetailUi.line(context, widthFactor: 0.12, heightFactor: 0.010),
              ],
            ),
            SizedBox(height: ProductDetailUi.gapMd(context)),
            ProductDetailUi.line(context, widthFactor: 0.88),
            SizedBox(height: ProductDetailUi.gapXs(context)),
            ProductDetailUi.line(context, widthFactor: 0.72),
            SizedBox(height: ProductDetailUi.gapSm(context)),
            Container(
              height: 6,
              decoration: BoxDecoration(
                color: palette.placeholderLight.withValues(alpha: 0.35),
                borderRadius: ProductDetailUi.radiusSm(context),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: 0.72,
                child: Container(
                  decoration: BoxDecoration(
                    color: palette.primarySoft(0.45),
                    borderRadius: ProductDetailUi.radiusSm(context),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _starRow(BuildContext context) {
    final palette = context.ds.palette;

    return Row(
      children: List.generate(
        5,
        (_) => Icon(Icons.star_rounded, size: 16, color: palette.primary),
      ),
    );
  }
}
