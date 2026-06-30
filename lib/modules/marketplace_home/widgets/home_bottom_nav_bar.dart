import 'package:flutter/material.dart';

import '../l10n/home_strings.dart';
import '../theme/home_colors.dart';
import '../theme/home_typography.dart';

class HomeBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const HomeBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  static const _icons = [
    Icons.home_rounded,
    Icons.layers_outlined,
    Icons.location_on_outlined,
    Icons.storefront_outlined,
    Icons.room_service_outlined,
  ];

  static double computeBottomLift(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final inset = MediaQuery.paddingOf(context).bottom;
    return (width * 0.048).clamp(16.0, 24.0) + inset * 0.55;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final barHeight = (width * 0.172).clamp(66.0, 76.0);
    final iconSize = (width * 0.058).clamp(22.0, 26.0);
    final bottomLift = computeBottomLift(context);

    return Padding(
      padding: EdgeInsets.fromLTRB(
        width * 0.042,
        0,
        width * 0.042,
        bottomLift,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            left: -width * 0.02,
            right: -width * 0.02,
            bottom: barHeight * 0.42,
            child: _NavBarBurgundyDecor(width: width),
          ),
          Container(
            height: barHeight,
            decoration: BoxDecoration(
              color: HomeColors.navBackground,
              borderRadius: BorderRadius.circular(26),
              border: Border.all(
                color: HomeColors.accentGold.withValues(alpha: 0.14),
                width: 0.6,
              ),
              boxShadow: HomeColors.glassElevation(blur: 22, y: 6),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(_icons.length, (index) {
                return _NavItem(
                  icon: _icons[index],
                  label: HomeStrings.navLabel(context, index),
                  selected: currentIndex == index,
                  iconSize: iconSize,
                  onTap: () => onTap(index),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

/// Curved burgundy accent peeking from behind the floating nav bar.
class _NavBarBurgundyDecor extends StatelessWidget {
  final double width;

  const _NavBarBurgundyDecor({required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: width * 0.14,
      child: CustomPaint(
        size: Size(width * 1.04, width * 0.14),
        painter: _NavCurvePainter(),
      ),
    );
  }
}

class _NavCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final primary = HomeColors.primary;

    final wavePath = Path()
      ..moveTo(0, size.height * 0.92)
      ..quadraticBezierTo(
        size.width * 0.28,
        size.height * 0.18,
        size.width * 0.5,
        size.height * 0.38,
      )
      ..quadraticBezierTo(
        size.width * 0.72,
        size.height * 0.58,
        size.width,
        size.height * 0.88,
      );

    canvas.drawPath(
      wavePath,
      Paint()
        ..color = primary.withValues(alpha: 0.22)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.8
        ..strokeCap = StrokeCap.round,
    );

    final glowPath = Path()
      ..moveTo(size.width * 0.06, size.height)
      ..quadraticBezierTo(
        size.width * 0.5,
        size.height * 0.08,
        size.width * 0.94,
        size.height,
      )
      ..close();

    canvas.drawPath(
      glowPath,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            primary.withValues(alpha: 0.14),
            primary.withValues(alpha: 0.04),
          ],
        ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    canvas.drawCircle(
      Offset(size.width * 0.18, size.height * 0.62),
      size.width * 0.018,
      Paint()..color = primary.withValues(alpha: 0.28),
    );
    canvas.drawCircle(
      Offset(size.width * 0.82, size.height * 0.55),
      size.width * 0.014,
      Paint()..color = primary.withValues(alpha: 0.22),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final double iconSize;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.iconSize,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 60,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedScale(
              scale: selected ? 1.06 : 1,
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOutCubic,
              child: Icon(
                icon,
                size: iconSize,
                color: selected ? HomeColors.primary : HomeColors.navInactive,
              ),
            ),
            SizedBox(height: iconSize * 0.16),
            SizedBox(
              height: 5,
              child: Center(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  width: selected ? 5 : 0,
                  height: selected ? 5 : 0,
                  decoration: const BoxDecoration(
                    color: HomeColors.primary,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            SizedBox(height: iconSize * 0.1),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: HomeTypography.navLabel(context, selected: selected),
            ),
          ],
        ),
      ),
    );
  }
}
