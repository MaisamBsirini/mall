import 'package:flutter/material.dart';

import '../../core/constants/app_sizes.dart';
import '../app_design_system.dart';

class PlaceholderWidgets {
  final AppDesignSystem ds;

  const PlaceholderWidgets(this.ds);

  Widget shimmerBox({
    double? width,
    double? height,
    BorderRadius? borderRadius,
    BoxShape shape = BoxShape.rectangle,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: shape,
        gradient: ds.tokens.shimmerGradient(),
        borderRadius: shape == BoxShape.circle
            ? null
            : (borderRadius ?? ds.tokens.borderSm),
      ),
    );
  }

  Widget textLine(
    BuildContext context, {
    double widthFactor = 0.28,
    double heightFactor = 0.008,
  }) {
    return shimmerBox(
      width: AppSizes.w(context, widthFactor),
      height: AppSizes.h(context, heightFactor),
      borderRadius: BorderRadius.circular(4),
    );
  }

  Widget sectionHeader(BuildContext context) {
    return Padding(
      padding: ds.tokens.sectionPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textLine(context, widthFactor: 0.32, heightFactor: 0.010),
          SizedBox(height: ds.tokens.gapXs(context)),
          textLine(context, widthFactor: 0.22, heightFactor: 0.007),
        ],
      ),
    );
  }

  Widget imagePlaceholder({
    required double width,
    required double height,
    BorderRadius? borderRadius,
    BoxShape shape = BoxShape.rectangle,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: shape,
        borderRadius: shape == BoxShape.circle
            ? null
            : (borderRadius ?? ds.tokens.borderMd),
        gradient: ds.tokens.imagePlaceholderGradient(),
      ),
    );
  }

  Widget placeholderBox({
    double? width,
    double? height,
    BorderRadius? borderRadius,
    Gradient? gradient,
    Color? color,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? ds.palette.placeholderMid,
        gradient: gradient,
        borderRadius: borderRadius ?? ds.tokens.borderMd,
      ),
    );
  }

  Widget ctaPill(BuildContext context, {bool onDark = false}) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w(context, 0.06),
        vertical: AppSizes.h(context, 0.012),
      ),
      decoration: BoxDecoration(
        color: onDark
            ? ds.palette.glassFill
            : ds.palette.primarySoft(0.08),
        borderRadius: ds.tokens.borderLg,
        border: onDark
            ? Border.all(color: ds.palette.glassBorder)
            : null,
      ),
      child: textLine(
        context,
        widthFactor: 0.18,
        heightFactor: 0.007,
      ),
    );
  }
}
