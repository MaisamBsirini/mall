/// A navigation category entry.
///
/// Merchants must provide an [icon]. [name] is optional because some
/// layouts are icon-only; styles decide whether to render the label.
///
/// Excluded by design:
/// - [image] / cover images — categories are icon-first navigation
/// - [description] — kept lightweight for quick scanning
class CategoryItem {
  final String? id;
  final String icon;
  final String? name;

  const CategoryItem({
    this.id,
    required this.icon,
    this.name,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      id: json['id'] as String?,
      icon: json['icon'] as String,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'icon': icon,
      if (name != null) 'name': name,
    };
  }
}
