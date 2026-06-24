import 'package:flutter/material.dart';

import '../../../../design_system/scope/design_system_scope.dart';
import '../../widgets/ui_placeholders.dart';

/// Reviews style 4 — editorial timeline.
class ReviewTimeline extends StatelessWidget {
  const ReviewTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;

    return Padding(
      padding: ProductDetailUi.pagePadding(context),
      child: Column(
        children: List.generate(3, (i) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: palette.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
                  if (i < 2)
                    Container(
                      width: 2,
                      height: 48,
                      color: palette.border.withValues(alpha: 0.45),
                    ),
                ],
              ),
              SizedBox(width: ProductDetailUi.gapSm(context)),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(bottom: ProductDetailUi.gapMd(context)),
                  child: ProductDetailUi.sectionSurface(
                    context,
                    padding: EdgeInsets.all(ProductDetailUi.gapSm(context)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductDetailUi.line(context, widthFactor: 0.55),
                        SizedBox(height: ProductDetailUi.gapXs(context)),
                        ProductDetailUi.line(context, widthFactor: 0.82, heightFactor: 0.006),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
