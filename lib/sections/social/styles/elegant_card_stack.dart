import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../social_section_data.dart';
import '../social_tokens.dart';

/// Style 4 — all icons grouped inside one soft gradient pod.
class ElegantCardStackStyle extends StatelessWidget {
  final SocialSectionData? data;

  const ElegantCardStackStyle({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final items = SocialTokens.resolveItems(data);
    final iconSize = AppSizes.w(context, 0.095);
    final podHeight = AppSizes.h(context, 0.078);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SocialTokens.sectionTitle(context, title: data?.title),
        SizedBox(height: SocialTokens.gapSm(context)),
        Padding(
          padding: SocialTokens.sectionPadding(context),
          child: Container(
            height: podHeight,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: AppSizes.w(context, 0.04)),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  palette.primarySoft(0.06),
                  palette.placeholderLight.withValues(alpha: 0.5),
                ],
              ),
              borderRadius: SocialTokens.borderLg(context),
              border: Border.all(color: palette.border.withValues(alpha: 0.35)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (final item in items)
                  SocialTokens.brandIconOutline(
                    context,
                    item: item,
                    size: iconSize,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
