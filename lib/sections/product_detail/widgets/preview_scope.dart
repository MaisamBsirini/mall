import 'package:flutter/material.dart';

/// UI-only preview density — not product data.
enum ProductDetailPreviewDensity { empty, single, standard, dense }

extension ProductDetailPreviewDensityX on ProductDetailPreviewDensity {
  String get showcaseLabel => switch (this) {
        ProductDetailPreviewDensity.empty => 'Empty',
        ProductDetailPreviewDensity.single => 'Single',
        ProductDetailPreviewDensity.standard => 'Standard',
        ProductDetailPreviewDensity.dense => 'Dense',
      };

  int get attributeGroups => switch (this) {
        ProductDetailPreviewDensity.empty => 0,
        ProductDetailPreviewDensity.single => 1,
        ProductDetailPreviewDensity.standard => 3,
        ProductDetailPreviewDensity.dense => 6,
      };

  int get optionsPerGroup => switch (this) {
        ProductDetailPreviewDensity.empty => 0,
        ProductDetailPreviewDensity.single => 3,
        ProductDetailPreviewDensity.standard => 4,
        ProductDetailPreviewDensity.dense => 5,
      };

  int get imageCount => switch (this) {
        ProductDetailPreviewDensity.empty => 0,
        ProductDetailPreviewDensity.single => 1,
        ProductDetailPreviewDensity.standard => 3,
        ProductDetailPreviewDensity.dense => 5,
      };

  int get titleLines => switch (this) {
        ProductDetailPreviewDensity.empty => 0,
        ProductDetailPreviewDensity.single => 1,
        ProductDetailPreviewDensity.standard => 2,
        ProductDetailPreviewDensity.dense => 2,
      };

  int get descriptionLines => switch (this) {
        ProductDetailPreviewDensity.empty => 0,
        ProductDetailPreviewDensity.single => 2,
        ProductDetailPreviewDensity.standard => 3,
        ProductDetailPreviewDensity.dense => 4,
      };

  bool get showCategory => this != ProductDetailPreviewDensity.empty;
}

class ProductDetailPreviewScope extends InheritedWidget {
  final ProductDetailPreviewDensity density;

  const ProductDetailPreviewScope({
    super.key,
    required this.density,
    required super.child,
  });

  static ProductDetailPreviewDensity of(BuildContext context) {
    return context
            .dependOnInheritedWidgetOfExactType<ProductDetailPreviewScope>()
            ?.density ??
        ProductDetailPreviewDensity.standard;
  }

  @override
  bool updateShouldNotify(ProductDetailPreviewScope oldWidget) {
    return density != oldWidget.density;
  }
}
