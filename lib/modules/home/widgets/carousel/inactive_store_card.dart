import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../../../data/models/store_model.dart';
import 'store_rating.dart';

class InactiveStoreCard extends StatelessWidget {
  final StoreModel store;

  const InactiveStoreCard({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.82,

      child: Transform.translate(
        offset: Offset(
          0,
          AppSizes.h(context, 0.025),
        ),

        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: AppSizes.w(context, 0.02),
            vertical: AppSizes.h(context, 0.03),
          ),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),

            boxShadow: [
              BoxShadow(
                color:
                    Colors.black.withOpacity(0.08),

                blurRadius: 18,
                offset: const Offset(0, 10),
              ),
            ],
          ),

          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),

            child: Stack(
              children: [
                Positioned.fill(
                  child: ColorFiltered(
                    colorFilter:
                        ColorFilter.mode(
                      Colors.black.withOpacity(
                        0.18,
                      ),
                      BlendMode.darken,
                    ),

                    child: Image.network(
                      store.image,
                      fit: BoxFit.cover,

                      errorBuilder:
                          (_, __, ___) {
                        return Container(
                          color:
                              Colors.grey.shade300,
                        );
                      },
                    ),
                  ),
                ),

                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,

                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),

                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 10,
                        sigmaY: 10,
                      ),

                      child: Container(
                        padding: EdgeInsets.all(
                          AppSizes.w(context, 0.04),
                        ),

                        color:
                            Colors.white.withOpacity(
                          0.10,
                        ),

                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,

                          mainAxisSize:
                              MainAxisSize.min,

                          children: [
                            Text(
                              store.name,

                              maxLines: 1,
                              overflow:
                                  TextOverflow
                                      .ellipsis,

                              style: TextStyle(
                                color: Colors.white,

                                fontWeight:
                                    FontWeight.w600,

                                fontSize:
                                    AppSizes.sp(
                                  context,
                                  0.036,
                                ),
                              ),
                            ),

                            SizedBox(
                              height:
                                  AppSizes.h(
                                context,
                                0.004,
                              ),
                            ),

                            StoreRating(
                              rating:
                                  store.rating,
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