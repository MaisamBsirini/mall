import 'package:flutter/material.dart';

import '../../widgets/ui_placeholders.dart';

/// Info 1 — large title, category chip, multi-line description.
class LargeTitleStackInfo extends StatelessWidget {
  const LargeTitleStackInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProductDetailUi.pagePadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductDetailUi.categoryChip(context),
          SizedBox(height: ProductDetailUi.gapSm(context)),
          ProductDetailUi.titleBlock(context, primaryWidth: 0.90),
          SizedBox(height: ProductDetailUi.gapMd(context)),
          ProductDetailUi.descriptionBlock(context),
        ],
      ),
    );
  }
}
