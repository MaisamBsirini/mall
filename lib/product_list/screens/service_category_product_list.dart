import 'package:flutter/material.dart';

import '../../core/constants/app_sizes.dart';
import '../../design_system/scope/design_system_scope.dart';
import '../widgets/product_list_ui.dart';

/// Service category product list — vertical readable service cards.
class ServiceCategoryProductList extends StatelessWidget {
  const ServiceCategoryProductList({super.key});

  static const _itemCount = 4;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ProductListUi.sheetHeader(context),
        Expanded(
          child: ListView.separated(
            padding: ProductListUi.pagePadding(context),
            itemCount: _itemCount,
            separatorBuilder: (_, __) =>
                SizedBox(height: ProductListUi.gapMd(context)),
            itemBuilder: (_, __) => _ServiceCategoryCard(context: context),
          ),
        ),
      ],
    );
  }
}

class _ServiceCategoryCard extends StatelessWidget {
  final BuildContext context;

  const _ServiceCategoryCard({required this.context});

  @override
  Widget build(BuildContext _) {
    final palette = context.ds.palette;
    final imageHeight = AppSizes.h(context, 0.12);

    return Container(
      decoration: BoxDecoration(
        color: palette.surface,
        borderRadius: ProductListUi.radiusMd(context),
        border: Border.all(color: palette.border.withValues(alpha: 0.42)),
        boxShadow: ProductListUi.softShadow(context),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ProductListUi.imagePlaceholder(
            context,
            height: imageHeight,
            borderRadius: BorderRadius.zero,
          ),
          Padding(
            padding: EdgeInsets.all(ProductListUi.gapMd(context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductListUi.titleBlock(context, widthFactor: 0.68),
                SizedBox(height: ProductListUi.gapSm(context)),
                ProductListUi.line(context, widthFactor: 0.92, heightFactor: 0.006),
                SizedBox(height: ProductListUi.gapXs(context)),
                ProductListUi.line(context, widthFactor: 0.76, heightFactor: 0.006),
                SizedBox(height: ProductListUi.gapMd(context)),
                Row(
                  children: [
                    ProductListUi.priceBlock(context, widthFactor: 0.26),
                    const Spacer(),
                    ProductListUi.bookingArrow(context),
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
