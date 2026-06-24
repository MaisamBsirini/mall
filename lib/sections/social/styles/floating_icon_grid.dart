import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../social_section_data.dart';
import '../social_tokens.dart';

/// Style 2 — two rows of rounded icon + platform name chips.
class FloatingIconGridStyle extends StatelessWidget {
  final SocialSectionData? data;

  const FloatingIconGridStyle({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final items = SocialTokens.resolveItems(data);
    final chipHeight = AppSizes.h(context, 0.038);
    final mid = (items.length / 2).ceil();
    final row1 = items.take(mid).toList();
    final row2 = items.skip(mid).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SocialTokens.sectionTitle(context, title: data?.title),
        SizedBox(height: SocialTokens.gapSm(context)),
        Padding(
          padding: SocialTokens.sectionPadding(context),
          child: Column(
            children: [
              Wrap(
                spacing: SocialTokens.gapSm(context),
                runSpacing: SocialTokens.gapSm(context),
                children: [
                  for (final item in row1)
                    SocialTokens.iconChip(
                      context,
                      item: item,
                      height: chipHeight,
                    ),
                ],
              ),
              if (row2.isNotEmpty) ...[
                SizedBox(height: SocialTokens.gapSm(context)),
                Wrap(
                  spacing: SocialTokens.gapSm(context),
                  runSpacing: SocialTokens.gapSm(context),
                  children: [
                    for (final item in row2)
                      SocialTokens.iconChip(
                        context,
                        item: item,
                        height: chipHeight,
                      ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
