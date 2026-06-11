class CategoriesStyleId {
  CategoriesStyleId._();

  static const String iconHub = 'icon_hub';
  static const String honeycombCategories = 'honeycomb_categories';
  static const String categoryRibbons = 'category_ribbons';
  static const String floatingCategoryCloud = 'floating_category_cloud';
  static const String categoryCommandCenter = 'category_command_center';

  static const List<String> all = [
    iconHub,
    honeycombCategories,
    categoryRibbons,
    floatingCategoryCloud,
    categoryCommandCenter,
  ];

  static bool isValid(String styleId) => all.contains(styleId);
}
