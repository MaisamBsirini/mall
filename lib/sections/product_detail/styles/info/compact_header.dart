import 'package:flutter/material.dart';

import '../../widgets/ui_placeholders.dart';

/// Info 2 — compact inline hierarchy.
class CompactHeaderInfo extends StatelessWidget {
  const CompactHeaderInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProductDetailUi.pagePadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: ProductDetailUi.titleBlock(context, lines: 1)),
              SizedBox(width: ProductDetailUi.gapSm(context)),
              ProductDetailUi.categoryChip(context),
            ],
          ),
          SizedBox(height: ProductDetailUi.gapSm(context)),
          ProductDetailUi.descriptionBlock(context, compact: true, lines: 2),
        ],
      ),
    );
  }
}
