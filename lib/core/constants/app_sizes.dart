import 'package:flutter/material.dart';

class AppSizes {
  static double w(BuildContext context, double percent) {
    return MediaQuery.of(context).size.width * percent;
  }

  static double h(BuildContext context, double percent) {
    return MediaQuery.of(context).size.height * percent;
  }

  static double sp(BuildContext context, double percent) {
    return MediaQuery.of(context).size.width * percent;
  }
}