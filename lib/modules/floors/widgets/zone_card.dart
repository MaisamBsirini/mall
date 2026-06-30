import 'dart:ui';

import 'package:flutter/material.dart';

import '../../marketplace_home/theme/home_colors.dart';
import '../../marketplace_home/theme/home_typography.dart';
import '../l10n/floors_strings.dart';
import '../models/zone_model.dart';

class ZoneCard extends StatelessWidget {
  final ZoneModel zone;
  final double cardWidth;
  final double cardHeight;

  const ZoneCard({
    super.key,
    required this.zone,
    required this.cardWidth,
    required this.cardHeight,
  });

  @override
  Widget build(BuildContext context) {
    final rtl = FloorsStrings.isRtl(context);
    final name = rtl ? zone.nameAr : zone.nameEn;
    final overlayHeight = cardHeight * 0.38;

    return SizedBox(
      width: cardWidth,
      height: cardHeight,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          boxShadow: HomeColors.softElevation(blur: 10, y: 3),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Stack(
            fit: StackFit.expand,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: zone.imageGradient,
                  ),
                ),
                child: Icon(
                  zone.placeholderIcon,
                  size: cardWidth * 0.2,
                  color: HomeColors.primary.withValues(alpha: 0.18),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                height: overlayHeight,
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            HomeColors.surfaceWhite.withValues(alpha: 0.4),
                            HomeColors.surfaceWhite.withValues(alpha: 0.78),
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: cardWidth * 0.06,
                          vertical: cardHeight * 0.028,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: HomeTypography.productTitle(context).copyWith(
                                fontSize: 10.5,
                                fontWeight: FontWeight.w600,
                                height: 1.2,
                              ),
                            ),
                            SizedBox(height: cardHeight * 0.016),
                            Text(
                              FloorsStrings.zoneTypeLabel(context, zone.type),
                              style: HomeTypography.productRating(context).copyWith(
                                fontSize: 9,
                                fontWeight: FontWeight.w500,
                                color: HomeColors.primary,
                                height: 1.1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
