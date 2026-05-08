import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mall/modules/home/views/store_preview_view.dart';

import '../../../../data/models/area_model.dart';


import 'area_gradient.dart';
import 'favorite_button.dart';
import 'rating_badge.dart';

class FancyAreaCard extends StatelessWidget {
  final AreaModel area;

  const FancyAreaCard({
    super.key,
    required this.area,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => const StorePreviewView(),
        );
      },

      child: Container(
        width: 180,

        margin: const EdgeInsets.symmetric(
          horizontal: 10,
        ),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),

          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),

          child: Stack(
            children: [
              Image.network(
                area.image,
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              const AreaGradient(),

              const Positioned(
                top: 8,
                left: 8,
                child: RatingBadge(),
              ),

              const Positioned(
                top: 8,
                right: 8,
                child: FavoriteButton(),
              ),

              Positioned(
                bottom: 12,
                left: 12,

                child: Text(
                  area.name,

                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
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