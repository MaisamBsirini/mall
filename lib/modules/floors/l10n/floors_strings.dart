import 'package:flutter/material.dart';

import '../models/zone_type.dart';

abstract final class FloorsStrings {
  static bool isRtl(BuildContext context) =>
      Directionality.of(context) == TextDirection.rtl;

  static String zoneTypeLabel(BuildContext context, ZoneType type) {
    if (type == ZoneType.services) {
      return isRtl(context) ? 'خدمات' : 'Services';
    }
    return isRtl(context) ? 'متاجر' : 'Stores';
  }
}
