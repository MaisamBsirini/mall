import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../staff_item.dart';
import '../staff_section_data.dart';
import '../staff_tokens.dart';

/// Editorial magazine layout — alternating image left / right per member.
class AlternatingStaffStyle extends StatelessWidget {
  final StaffSectionData? data;

  const AlternatingStaffStyle({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final items = StaffTokens.resolveItems(data?.items);
    final imageWidth = AppSizes.w(context, 0.34);
    final imageHeight = AppSizes.h(context, 0.22);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StaffTokens.sectionTitle(context, title: data?.title),
        SizedBox(height: StaffTokens.gapLg(context)),
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
                        ? StaffTokens.gapLg(context) * 1.2
                        : 0,
                  ),
                  child: _AlternatingRow(
                    member: items[index],
                    imageOnRight: index.isEven,
                    imageWidth: imageWidth,
                    imageHeight: imageHeight,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _AlternatingRow extends StatelessWidget {
  final StaffItem member;
  final bool imageOnRight;
  final double imageWidth;
  final double imageHeight;

  const _AlternatingRow({
    required this.member,
    required this.imageOnRight,
    required this.imageWidth,
    required this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    final image = StaffTokens.profileImage(
      context,
      width: imageWidth,
      height: imageHeight,
      elevated: true,
    );
    final content = _MemberTextBlock(member: member);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: imageOnRight
          ? [
              Expanded(child: content),
              SizedBox(width: StaffTokens.gapMd(context)),
              image,
            ]
          : [
              image,
              SizedBox(width: StaffTokens.gapMd(context)),
              Expanded(child: content),
            ],
    );
  }
}

class _MemberTextBlock extends StatelessWidget {
  final StaffItem member;

  const _MemberTextBlock({required this.member});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StaffTokens.memberNamePlaceholder(context),
        SizedBox(height: StaffTokens.gapSm(context)),
        StaffTokens.memberRolePlaceholder(context),
        if (member.shortBio != null) ...[
          SizedBox(height: StaffTokens.gapMd(context)),
          StaffTokens.memberBioPlaceholder(context, lines: 2),
        ],
      ],
    );
  }
}
