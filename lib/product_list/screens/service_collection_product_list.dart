import 'package:flutter/material.dart';

import '../../design_system/scope/design_system_scope.dart';
import '../widgets/product_list_ui.dart';

/// Service collection product list — compact curated service cards.
class ServiceCollectionProductList extends StatelessWidget {
  const ServiceCollectionProductList({super.key});

  static const _itemCount = 6;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ProductListUi.sheetHeader(context, showActions: false),
        Expanded(
          child: ListView.separated(
            padding: ProductListUi.pagePadding(context),
            itemCount: _itemCount,
            separatorBuilder: (_, __) =>
                SizedBox(height: ProductListUi.gapSm(context) * 1.2),
            itemBuilder: (_, __) => _ServiceCollectionCard(context: context),
          ),
        ),
      ],
    );
  }
}

class _ServiceCollectionCard extends StatelessWidget {
  final BuildContext context;

  const _ServiceCollectionCard({required this.context});

  @override
  Widget build(BuildContext _) {
    final palette = context.ds.palette;
    const imageSize = 64.0;

    return Container(
      padding: EdgeInsets.all(ProductListUi.gapSm(context) * 1.1),
      decoration: BoxDecoration(
        color: palette.background,
        borderRadius: ProductListUi.radiusMd(context),
        border: Border.all(color: palette.border.withValues(alpha: 0.38)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: ProductListUi.radiusSm(context),
            child: ProductListUi.imagePlaceholder(
              context,
              width: imageSize,
              height: imageSize,
              borderRadius: ProductListUi.radiusSm(context),
            ),
          ),
          SizedBox(width: ProductListUi.gapMd(context)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductListUi.titleBlock(context, widthFactor: 0.78),
                SizedBox(height: ProductListUi.gapXs(context)),
                ProductListUi.line(context, widthFactor: 0.62, heightFactor: 0.005),
                SizedBox(height: ProductListUi.gapSm(context)),
                Row(
                  children: [
                    ProductListUi.priceBlock(context, widthFactor: 0.22),
                    const Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: ProductListUi.gapSm(context),
                        vertical: ProductListUi.gapXs(context) * 0.7,
                      ),
                      decoration: BoxDecoration(
                        color: palette.primarySoft(0.12),
                        borderRadius: ProductListUi.radiusLg(context),
                        border: Border.all(
                          color: palette.primarySoft(0.24),
                        ),
                      ),
                      child: ProductListUi.line(
                        context,
                        widthFactor: 0.14,
                        heightFactor: 0.005,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
