import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../staff_tokens.dart';

class ExpertCardsGridStyle extends StatelessWidget {
  const ExpertCardsGridStyle({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    const crossAxisCount = 2;
    const itemCount = 4;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: StaffTokens.sectionPadding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StaffTokens.nameLine(context, widthFactor: 0.30),
              SizedBox(height: StaffTokens.gapXs(context)),
              StaffTokens.roleLine(context, widthFactor: 0.22),
            ],
          ),
        ),
        SizedBox(height: StaffTokens.gapMd(context)),
        Padding(
          padding: StaffTokens.sectionPadding(context),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: StaffTokens.gapMd(context),
              crossAxisSpacing: StaffTokens.gapMd(context),
              childAspectRatio: 0.72,
            ),
            itemCount: itemCount,
            itemBuilder: (context, index) {
              final member = StaffTokens.members[index];
              return _ExpertCard(member: member);
            },
          ),
        ),
        SizedBox(height: StaffTokens.gapSm(context)),
        Padding(
          padding: StaffTokens.sectionPadding(context),
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.w(context, 0.06),
                vertical: AppSizes.h(context, 0.010),
              ),
              decoration: BoxDecoration(
                border: Border.all(color: palette.border),
                borderRadius: StaffTokens.borderSm(context),
              ),
              child: StaffTokens.textLine(
                context,
                widthFactor: 0.18,
                heightFactor: 0.007,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ExpertCard extends StatelessWidget {
  final StaffMemberSlot member;

  const _ExpertCard({
    required this.member,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: StaffTokens.surface(context),
        borderRadius: StaffTokens.borderLg(context),
        border: Border.all(color: member.accentHint.withOpacity(0.12)),
        boxShadow: StaffTokens.elevatedShadow(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(context.ds.tokens.radiusLg),
              ),
              child: StaffTokens.shimmerBox(
                context,
                width: double.infinity,
                height: double.infinity,
                borderRadius: BorderRadius.zero,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.all(AppSizes.w(context, 0.035)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StaffTokens.nameLine(context, widthFactor: 0.28),
                  SizedBox(height: StaffTokens.gapXs(context)),
                  StaffTokens.roleLine(context, widthFactor: 0.20),
                  SizedBox(height: StaffTokens.gapSm(context)),
                  Expanded(
                    child: StaffTokens.bioBlock(
                      context,
                      lines: 2,
                      widthFactor: 0.30,
                    ),
                  ),
                  Container(
                    width: AppSizes.w(context, 0.10),
                    height: 2,
                    decoration: BoxDecoration(
                      color: member.accentHint.withOpacity(0.45),
                      borderRadius: StaffTokens.borderSm(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
