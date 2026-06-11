import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../staff_tokens.dart';

class AlternatingProfileListStyle extends StatelessWidget {
  const AlternatingProfileListStyle({super.key});

  static const int _memberCount = 3;

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StaffTokens.sectionHeader(context),
        SizedBox(height: StaffTokens.gapLg(context)),
        Padding(
          padding: StaffTokens.sectionPadding(context),
          child: Column(
            children: List.generate(_memberCount, (index) {
              final member = StaffTokens.members[index];
              final shape = StaffTokens.alternatingShapes[index];
              final imageOnRight = index.isEven;
              final (imgW, imgH) = StaffTokens.imageSizeForShape(
                context,
                shape,
                base: 0.30,
              );

              return Padding(
                padding: EdgeInsets.only(
                  bottom: index < _memberCount - 1
                      ? StaffTokens.gapLg(context) * 1.2
                      : 0,
                ),
                child: Container(
                  padding: EdgeInsets.all(AppSizes.w(context, 0.04)),
                  decoration: BoxDecoration(
                    color: StaffTokens.surface(context),
                    borderRadius: StaffTokens.borderLg(context),
                    border: Border.all(color: palette.border),
                    boxShadow: StaffTokens.cardShadow(context),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: imageOnRight
                        ? [
                            Expanded(child: _ProfileContent(index: index)),
                            SizedBox(width: StaffTokens.gapMd(context)),
                            StaffTokens.profileImage(
                              context,
                              width: imgW,
                              height: imgH,
                              shape: shape,
                              accentHint: member.accentHint,
                            ),
                          ]
                        : [
                            StaffTokens.profileImage(
                              context,
                              width: imgW,
                              height: imgH,
                              shape: shape,
                              accentHint: member.accentHint,
                            ),
                            SizedBox(width: StaffTokens.gapMd(context)),
                            Expanded(child: _ProfileContent(index: index)),
                          ],
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

class _ProfileContent extends StatelessWidget {
  final int index;

  const _ProfileContent({required this.index});

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StaffTokens.nameLine(context, widthFactor: 0.36),
        SizedBox(height: StaffTokens.gapSm(context)),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.w(context, 0.025),
            vertical: AppSizes.h(context, 0.005),
          ),
          decoration: BoxDecoration(
            color: palette.primarySoft(0.08),
            borderRadius: StaffTokens.borderSm(context),
          ),
          child: StaffTokens.roleLine(context, widthFactor: 0.22),
        ),
        SizedBox(height: StaffTokens.gapMd(context)),
        StaffTokens.bioBlock(context, lines: index == 0 ? 3 : 2),
      ],
    );
  }
}
