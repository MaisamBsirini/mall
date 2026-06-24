class LocationComponentConfig {
  final String id;
  final String style;
  final bool previewExpanded;

  const LocationComponentConfig({
    this.id = 'location',
    required this.style,
    this.previewExpanded = false,
  });
}
