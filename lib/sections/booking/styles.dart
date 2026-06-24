class BookingStyleId {
  BookingStyleId._();

  /// TEMPORARY UX prototypes — all follow the same 5-step flow.
  static const String stackedStepCards = 'stacked_step_cards';
  static const String compactChipFlow = 'compact_chip_flow';
  static const String timelineRailFlow = 'timeline_rail_flow';
  static const String splitScheduleFlow = 'split_schedule_flow';
  static const String scrollWizardFlow = 'scroll_wizard_flow';

  static const List<String> all = [
    stackedStepCards,
    compactChipFlow,
    timelineRailFlow,
    splitScheduleFlow,
    scrollWizardFlow,
  ];

  static bool isValid(String styleId) => all.contains(styleId);
}
