class BookingStyleId {
  BookingStyleId._();

  /// TEMPORARY UX prototypes — all follow the same 5-step flow.
  static const String stackedStepCards = 'stacked_step_cards';
  static const String compactChipFlow = 'compact_chip_flow';
  static const String timelineRailFlow = 'timeline_rail_flow';
  static const String accordionStepFlow = 'accordion_step_flow';
  static const String popupStaffPickerFlow = 'popup_staff_picker_flow';

  static const List<String> all = [
    stackedStepCards,
    compactChipFlow,
    timelineRailFlow,
    accordionStepFlow,
    popupStaffPickerFlow,
  ];

  static bool isValid(String styleId) => all.contains(styleId);
}
