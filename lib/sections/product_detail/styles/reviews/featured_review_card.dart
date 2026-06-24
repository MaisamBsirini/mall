import 'package:flutter/material.dart';

import '../../widgets/ui_placeholders.dart';

/// Reviews style 3 — featured review card.
class FeaturedReviewCard extends StatelessWidget {
  const FeaturedReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProductDetailUi.pagePadding(context),
      child: ProductDetailUi.sectionSurface(
        context,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ProductDetailUi.line(context, widthFactor: 0.22, heightFactor: 0.008),
                const Spacer(),
                ProductDetailUi.line(context, widthFactor: 0.14, heightFactor: 0.007),
              ],
            ),
            SizedBox(height: ProductDetailUi.gapMd(context)),
            ProductDetailUi.line(context, widthFactor: 0.95, heightFactor: 0.007),
            SizedBox(height: ProductDetailUi.gapXs(context)),
            ProductDetailUi.line(context, widthFactor: 0.88, heightFactor: 0.007),
            SizedBox(height: ProductDetailUi.gapXs(context)),
            ProductDetailUi.line(context, widthFactor: 0.62, heightFactor: 0.007),
          ],
        ),
      ),
    );
  }
}
