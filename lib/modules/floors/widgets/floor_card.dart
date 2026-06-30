import 'dart:ui';

import 'package:flutter/material.dart';

import '../../marketplace_home/theme/home_colors.dart';
import '../models/floor_model.dart';
import 'floor_header.dart';
import 'zone_card.dart';

class FloorCard extends StatelessWidget {
  final FloorModel floor;

  const FloorCard({super.key, required this.floor});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final horizontalPad = width * 0.045;
    final innerPad = width * 0.028;
    final floorCardWidth = width - horizontalPad * 2;
    final contentWidth = floorCardWidth - innerPad * 2;
    final zoneWidth = contentWidth * 0.75;
    final zoneHeight = zoneWidth * 0.50;
    final glassInset = width * 0.024;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPad),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: -width * 0.016,
            right: -width * 0.016,
            top: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        HomeColors.surfaceWhite.withValues(alpha: 0.4),
                        HomeColors.primary.withValues(alpha: 0.42),

                        HomeColors.primary.withValues(alpha: 0.88),
                      ],
                    ),
                    border: Border.all(
                      color: HomeColors.primary.withValues(alpha: 0.16),
                      width: 0.6,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: glassInset),
            child: Container(
              decoration: BoxDecoration(
                color: HomeColors.surfaceIvory,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: HomeColors.bannerBorder.withValues(alpha: 0.45),
                  width: 0.5,
                ),
                boxShadow: HomeColors.softElevation(blur: 8, y: 2),
              ),
              padding: EdgeInsets.fromLTRB(
                innerPad,
                width * 0.014,
                innerPad,
                width * 0.014,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FloorHeader(
                    titleEn: floor.titleEn,
                    titleAr: floor.titleAr,
                  ),
                  SizedBox(height: width * 0.01),
                  SizedBox(
                    height: zoneHeight,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: floor.zones.length,
                      separatorBuilder: (_, __) =>
                          SizedBox(width: width * 0.02),
                      itemBuilder: (context, index) {
                        return ZoneCard(
                          zone: floor.zones[index],
                          cardWidth: zoneWidth,
                          cardHeight: zoneHeight,
                        );
                      },
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
