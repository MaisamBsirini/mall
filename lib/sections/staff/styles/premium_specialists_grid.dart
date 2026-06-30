import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../staff_item.dart';
import '../staff_section_data.dart';
import '../staff_tokens.dart';

/// Responsive luxury grid — image-first cards with strong hierarchy.
class PremiumSpecialistsGridStyle extends StatelessWidget {
  final StaffSectionData? data;

  const PremiumSpecialistsGridStyle({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final items = StaffTokens.resolveItems(data?.items);
    const crossAxisCount = 2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StaffTokens.sectionTitle(context, title: data?.title),
        SizedBox(height: StaffTokens.gapMd(context)),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: StaffTokens.horizontalMargin(context),
          ),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: StaffTokens.gapSm(context),
              crossAxisSpacing: StaffTokens.gapSm(context),
              childAspectRatio: 0.95,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return _SpecialistCard(member: items[index]);
            },
          ),
        ),
      ],
    );
  }
}

class _SpecialistCard extends StatelessWidget {
  final StaffItem member;

  const _SpecialistCard({required this.member});

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;

    return Container(
      decoration: BoxDecoration(
        color: StaffTokens.surface(context),
        borderRadius: StaffTokens.borderLg(context),
        border: Border.all(color: palette.border),
        boxShadow: StaffTokens.elevatedShadow(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 4,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(context.ds.tokens.radiusLg),
              ),
              child: StaffTokens.profileImage(
                context,
                width: double.infinity,
                height: double.infinity,
                borderRadius: BorderRadius.zero,
                elevated: false,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(AppSizes.w(context, 0.028)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StaffTokens.memberNamePlaceholder(context),
                  SizedBox(height: StaffTokens.gapXs(context)),
                  StaffTokens.memberRolePlaceholder(context),
                  if (member.shortBio != null) ...[
                    SizedBox(height: StaffTokens.gapXs(context)),
                    StaffTokens.memberBioPlaceholder(
                      context,
                      lines: 1,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
