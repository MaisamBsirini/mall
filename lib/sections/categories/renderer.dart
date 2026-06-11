import 'package:flutter/material.dart';

import '../../design_system/scope/design_system_scope.dart';
import 'categories_section_config.dart';
import 'styles.dart';
import 'styles/category_command_center.dart';
import 'styles/category_ribbons.dart';
import 'styles/floating_category_cloud.dart';
import 'styles/honeycomb_categories.dart';
import 'styles/icon_hub.dart';

class CategoriesRenderer extends StatelessWidget {
  final CategoriesSectionConfig config;

  const CategoriesRenderer({
    super.key,
    required this.config,
  });

  CategoriesRenderer.fromStyleId({
    super.key,
    required String styleId,
    bool enabled = true,
  }) : config = CategoriesSectionConfig(
          id: 'categories',
          name: 'Categories',
          enabled: enabled,
          order: 0,
          style: styleId,
        );

  @override
  Widget build(BuildContext context) {
    if (!config.enabled) {
      return const SizedBox.shrink();
    }

    switch (config.style) {
      case CategoriesStyleId.iconHub:
        return const IconHubStyle();
      case CategoriesStyleId.honeycombCategories:
        return const HoneycombCategoriesStyle();
      case CategoriesStyleId.categoryRibbons:
        return const CategoryRibbonsStyle();
      case CategoriesStyleId.floatingCategoryCloud:
        return const FloatingCategoryCloudStyle();
      case CategoriesStyleId.categoryCommandCenter:
        return const CategoryCommandCenterStyle();
      default:
        return const _UnknownCategoriesStyle();
    }
  }
}

class _UnknownCategoriesStyle extends StatelessWidget {
  const _UnknownCategoriesStyle();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: context.ds.placeholders.shimmerBox(
        height: 48,
        borderRadius: context.ds.tokens.borderSm,
      ),
    );
  }
}
