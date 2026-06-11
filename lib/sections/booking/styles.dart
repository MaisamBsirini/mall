class BookingStyleId {
  BookingStyleId._();

  static const String calendarFirst = 'calendar_first';
  static const String timelineBooking = 'timeline_booking';
  static const String quickSlots = 'quick_slots';
  static const String stepBooking = 'step_booking';
  static const String clockPicker = 'clock_picker';

  static const List<String> all = [
    calendarFirst,
    timelineBooking,
    quickSlots,
    stepBooking,
    clockPicker,
  ];

  static bool isValid(String styleId) => all.contains(styleId);
}
