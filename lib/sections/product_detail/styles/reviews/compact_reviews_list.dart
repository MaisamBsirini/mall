import 'package:flutter/material.dart';

import '../../widgets/ui_placeholders.dart';

/// Reviews style 2 — compact review list.
class CompactReviewsList extends StatelessWidget {
  const CompactReviewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProductDetailUi.pagePadding(context),
      child: Column(
        children: List.generate(3, (i) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: i < 2 ? ProductDetailUi.gapSm(context) : 0,
            ),
            child: ProductDetailUi.sectionSurface(
              context,
              padding: EdgeInsets.all(ProductDetailUi.gapSm(context)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductDetailUi.line(context, widthFactor: 0.10, heightFactor: 0.010),
                  SizedBox(width: ProductDetailUi.gapSm(context)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductDetailUi.line(context, widthFactor: 0.78),
                        SizedBox(height: ProductDetailUi.gapXs(context)),
                        ProductDetailUi.line(context, widthFactor: 0.92, heightFactor: 0.006),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
