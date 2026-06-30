import 'package:flutter/material.dart';

import '../theme/home_colors.dart';
import '../theme/home_typography.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String? actionLabel;
  final VoidCallback? onAction;

  const SectionHeader({
    super.key,
    required this.title,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width * 0.045),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: HomeTypography.sectionTitle(context),
            ),
          ),
          if (actionLabel != null && onAction != null)
            GestureDetector(
              onTap: onAction,
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      actionLabel!,
                      style: HomeTypography.sectionAction(context),
                    ),
                    Icon(
                      Directionality.of(context) == TextDirection.rtl
                          ? Icons.chevron_left_rounded
                          : Icons.chevron_right_rounded,
                      size: 14,
                      color: HomeColors.primary,
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
