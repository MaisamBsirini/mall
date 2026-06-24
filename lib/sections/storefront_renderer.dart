import 'package:flutter/material.dart';

import '../design_system/scope/design_system_scope.dart';
import 'merchant_storefront_config.dart';
import 'storefront_layout_config.dart';
import 'storefront_layout_engine.dart';

class StorefrontRenderer extends StatelessWidget {
  final MerchantStorefrontConfig config;

  const StorefrontRenderer({
    super.key,
    required this.config,
  });

  @override
  Widget build(BuildContext context) {
    return DesignSystemScope.fromConfig(
      config: config.design,
      child: Builder(
        builder: (context) {
          return ColoredBox(
            color: context.ds.palette.background,
            child: StorefrontLayoutView(
              sections: config.layoutSections,
            ),
          );
        },
      ),
    );
  }
}

extension _StorefrontConfigLayout on MerchantStorefrontConfig {
  List<StorefrontLayoutSectionEntry> get layoutSections {
    return sections
        .map(
          (entry) => StorefrontLayoutSectionEntry(
            sectionId: entry.id,
            styleId: entry.style,
            enabled: entry.enabled,
            order: entry.order,
          ),
        )
        .toList();
  }
}
