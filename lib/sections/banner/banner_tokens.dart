import 'package:flutter/material.dart';

import '../../core/constants/app_sizes.dart';
import '../../design_system/scope/design_system_scope.dart';

class BannerTokens {
  BannerTokens._();

  static double horizontalMargin(BuildContext context) =>
      context.ds.tokens.horizontalMargin(context);

  static EdgeInsets sectionPadding(BuildContext context) =>
      context.ds.tokens.sectionPadding(context);

  static double gapXs(BuildContext context) =>
      context.ds.tokens.gapXs(context);

  static double gapSm(BuildContext context) =>
      context.ds.tokens.gapSm(context);

  static double gapMd(BuildContext context) =>
      context.ds.tokens.gapMd(context);

  static double gapLg(BuildContext context) =>
      context.ds.tokens.gapLg(context);

  static BorderRadius borderSm(BuildContext context) =>
      context.ds.tokens.borderSm;

  static BorderRadius borderMd(BuildContext context) =>
      context.ds.tokens.borderMd;

  static BorderRadius borderLg(BuildContext context) =>
      context.ds.tokens.borderLg;

  static LinearGradient placeholderGradient(BuildContext context) =>
      context.ds.tokens.imagePlaceholderGradient();

  static LinearGradient heroOverlayGradient(BuildContext context) =>
      context.ds.tokens.heroOverlayGradient();

  static LinearGradient glassBackgroundGradient(BuildContext context) =>
      context.ds.tokens.glassBackgroundGradient();

  static Widget placeholderBox(
    BuildContext context, {
    double? width,
    double? height,
    BorderRadius? borderRadius,
    Gradient? gradient,
    Color? color,
  }) {
    return context.ds.placeholders.placeholderBox(
      width: width,
      height: height,
      borderRadius: borderRadius,
      gradient: gradient,
      color: color,
    );
  }

  static Widget ctaPill(BuildContext context, {bool onDark = false}) {
    return context.ds.placeholders.ctaPill(context, onDark: onDark);
  }

  static Widget textLine(
    BuildContext context, {
    double widthFactor = 0.28,
    double heightFactor = 0.008,
  }) {
    return context.ds.placeholders.textLine(
      context,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
    );
  }
}
