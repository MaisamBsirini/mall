import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../data/models/store_model.dart';
import 'store_rating.dart';
import 'store_status_badge.dart';

class ActiveStoreCard extends StatelessWidget {
  final StoreModel store;

  const ActiveStoreCard({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),

      margin: EdgeInsets.symmetric(
        horizontal: AppSizes.w(context, 0.055),
        vertical: AppSizes.h(context, 0.045),
      ),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),

        border: Border.all(
          color: AppColors.primary.withOpacity(0.65),
          width: 1.4,
        ),

        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.18),
            blurRadius: 35,
            offset: const Offset(0, 22),
          ),
        ],
      ),

      child: Padding(
        padding: const EdgeInsets.all(2.2),

        child: Transform(
          alignment: Alignment.center,

          transform:
              Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateX(0.02),

          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),

            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    store.image,
                    fit: BoxFit.cover,

                    errorBuilder: (_, __, ___) {
                      return Container(color: Colors.grey.shade200);
                    },
                  ),
                ),

                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,

                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.15),
                          Colors.black.withOpacity(0.68),
                        ],
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: AppSizes.h(context, 0.02),
                  right: AppSizes.w(context, 0.04),

                  child: Container(
                    width: AppSizes.w(context, 0.1),
                    height: AppSizes.w(context, 0.1),

                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.22),

                      borderRadius: BorderRadius.circular(18),

                      border: Border.all(color: Colors.white.withOpacity(0.35)),
                    ),

                    child: const Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                  ),
                ),

                Positioned(
                  left: 7,
                  right: 7,
                  bottom: 7,

                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(28)),

                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),

                      child: Container(
                        padding: EdgeInsets.all(AppSizes.w(context, 0.05)),

                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.10),

                          border: Border.all(
                            color: Colors.white.withOpacity(0.10),
                          ),
                        ),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          mainAxisSize: MainAxisSize.min,

                          children: [
                            Text(
                              store.name,

                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,

                              style: TextStyle(
                                color: Colors.white,

                                fontWeight: FontWeight.w700,

                                fontSize: AppSizes.sp(context, 0.040),
                              ),
                            ),

                            SizedBox(height: AppSizes.h(context, 0.006)),

                            Row(
                              children: [
                                StoreRating(rating: store.rating),

                                SizedBox(width: AppSizes.w(context, 0.02)),

                                StoreStatusBadge(isOpen: store.isOpen),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
