enum ZoneType {
  stores,
  services;

  factory ZoneType.fromJson(String value) {
    return ZoneType.values.firstWhere(
      (type) => type.name == value,
      orElse: () => ZoneType.stores,
    );
  }

  String toJson() => name;
}
