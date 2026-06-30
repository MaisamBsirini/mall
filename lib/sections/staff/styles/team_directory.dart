import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../staff_item.dart';
import '../staff_section_data.dart';
import '../staff_tokens.dart';

/// Vertical team directory — clean cards for clinics and professional services.
class TeamDirectoryStyle extends StatelessWidget {
  final StaffSectionData? data;

  const TeamDirectoryStyle({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final items = StaffTokens.resolveItems(data?.items);
    final palette = context.ds.palette;
    final imageSize = AppSizes.w(context, 0.15);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StaffTokens.sectionTitle(context, title: data?.title),
        SizedBox(height: StaffTokens.gapSm(context)),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: StaffTokens.horizontalMargin(context),
          ),
          child: Column(
            children: [
              for (var index = 0; index < items.length; index++)
                Padding(
                  padding: EdgeInsets.only(
                    bottom: index < items.length - 1
                        ? StaffTokens.gapSm(context)
                        : 0,
                  ),
                  child: _DirectoryCard(
                    member: items[index],
                    imageSize: imageSize,
                    borderColor: palette.border,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _DirectoryCard extends StatelessWidget {
  final StaffItem member;
  final double imageSize;
  final Color borderColor;

  const _DirectoryCard({
    required this.member,
    required this.imageSize,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(StaffTokens.gapSm(context)),
      decoration: BoxDecoration(
        color: StaffTokens.surface(context),
        borderRadius: StaffTokens.borderMd(context),
        border: Border.all(color: borderColor),
        boxShadow: StaffTokens.cardShadow(context),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StaffTokens.profileImage(
            context,
            width: imageSize,
            height: imageSize,
            borderRadius: StaffTokens.borderMd(context),
          ),
          SizedBox(width: StaffTokens.gapSm(context)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StaffTokens.memberNamePlaceholder(context),
                SizedBox(height: StaffTokens.gapXs(context)),
                StaffTokens.memberRolePlaceholder(context),
                if (member.shortBio != null) ...[
                  SizedBox(height: StaffTokens.gapXs(context)),
                  StaffTokens.memberBioPlaceholder(context, lines: 1),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
