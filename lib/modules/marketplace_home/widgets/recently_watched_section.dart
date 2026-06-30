import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/home_product_model.dart';
import '../l10n/home_strings.dart';
import '../theme/home_colors.dart';
import '../theme/home_typography.dart';
import 'section_header.dart';

class RecentlyWatchedSection extends StatelessWidget {
  final List<HomeProductModel> products;
  final double cardHeight;
  final RxSet<String> favoriteIds;
  final void Function(String productId) onFavoriteToggle;
  final VoidCallback onViewAll;

  const RecentlyWatchedSection({
    super.key,
    required this.products,
    required this.cardHeight,
    required this.favoriteIds,
    required this.onFavoriteToggle,
    required this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) return const SizedBox.shrink();

    final width = MediaQuery.sizeOf(context).width;
    final cardWidth = (width * 0.278).clamp(108.0, 130.0);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(
          title: HomeStrings.recentlyWatched(context),
          actionLabel: HomeStrings.viewAll(context),
          onAction: onViewAll,
        ),
        SizedBox(height: width * 0.025),
        SizedBox(
          height: cardHeight,
          child: Obx(
            () => ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: width * 0.045),
              itemCount: products.length,
              separatorBuilder: (_, __) => SizedBox(width: width * 0.028),
              itemBuilder: (context, index) {
                final product = products[index];
                return _ProductCard(
                  product: product,
                  rtl: HomeStrings.isRtl(context),
                  width: cardWidth,
                  height: cardHeight,
                  isFavorite: favoriteIds.contains(product.id),
                  onFavoriteToggle: () => onFavoriteToggle(product.id),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _ProductCard extends StatelessWidget {
  final HomeProductModel product;
  final bool rtl;
  final double width;
  final double height;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const _ProductCard({
    required this.product,
    required this.rtl,
    required this.width,
    required this.height,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    final name = rtl ? product.nameAr : product.nameEn;
    final hPad = width * 0.08;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: HomeColors.surfaceWhite,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: HomeColors.surfaceWhite,
          width: 0.3,
        ),
        boxShadow: HomeColors.softElevation(blur: 10, y: 2),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 68,
            child: Stack(
              fit: StackFit.expand,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        HomeColors.surfaceIvory,
                        HomeColors.surfaceBeige.withValues(alpha: 0.7),
                      ],
                    ),
                  ),
                  child: Icon(
                    product.imageIcon,
                    size: width * 0.34,
                    color: HomeColors.primary.withValues(alpha: 0.22),
                  ),
                ),
                Positioned(
                  top: 7,
                  right: rtl ? null : 7,
                  left: rtl ? 7 : null,
                  child: GestureDetector(
                    onTap: onFavoriteToggle,
                    child: Container(
                      width: 26,
                      height: 26,
                      decoration: BoxDecoration(
                        color: HomeColors.surfaceIvory.withValues(alpha: 0.92),
                        shape: BoxShape.circle,
                        boxShadow: HomeColors.whisperShadow(blur: 6, y: 1),
                      ),
                      child: Icon(
                        isFavorite
                            ? Icons.favorite_rounded
                            : Icons.favorite_border_rounded,
                        size: 14,
                        color: isFavorite
                            ? HomeColors.primary
                            : HomeColors.textMuted,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 32,
            child: Padding(
              padding: EdgeInsets.fromLTRB(hPad, 7, hPad, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: HomeTypography.productTitle(context),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        product.price,
                        style: HomeTypography.productPrice(context),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.star_rounded,
                        size: 11,
                        color: HomeColors.starOrange,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        product.rating.toStringAsFixed(1),
                        style: HomeTypography.productRating(context),
                      ),
                    ],
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
