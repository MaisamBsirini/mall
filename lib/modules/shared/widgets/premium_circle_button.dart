import 'package:flutter/material.dart';

import '../../marketplace_home/theme/home_colors.dart';

/// Circular premium action button — shared across main tabs.
class PremiumCircleButton extends StatelessWidget {
  final double size;
  final IconData icon;
  final VoidCallback onTap;
  final int badgeCount;
  final Color? borderColor;
  final double borderWidth;

  const PremiumCircleButton({
    super.key,
    required this.size,
    required this.icon,
    required this.onTap,
    this.badgeCount = 0,
    this.borderColor,
    this.borderWidth = 0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: HomeColors.iconButtonGlass,
          shape: BoxShape.circle,
          border: borderWidth > 0
              ? Border.all(
                  color: borderColor ?? HomeColors.primary.withValues(alpha: 0.35),
                  width: borderWidth,
                )
              : null,
          boxShadow: HomeColors.glassElevation(blur: 16, y: 4),
        ),
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Icon(
              icon,
              color: HomeColors.primary,
              size: size * 0.48,
            ),
            if (badgeCount > 0)
              Positioned(
                top: size * 0.1,
                right: size * 0.08,
                child: Container(
                  padding: EdgeInsets.all(size * 0.06),
                  decoration: const BoxDecoration(
                    color: HomeColors.badgeRed,
                    shape: BoxShape.circle,
                  ),
                  constraints: BoxConstraints(
                    minWidth: size * 0.42,
                    minHeight: size * 0.42,
                  ),
                  child: Text(
                    '$badgeCount',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size * 0.24,
                      fontWeight: FontWeight.w700,
                      height: 1,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
