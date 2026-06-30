import 'package:flutter/material.dart';

import '../models/home_category_model.dart';
import '../l10n/home_strings.dart';
import '../theme/home_colors.dart';
import '../theme/home_typography.dart';
import 'section_header.dart';

class CategoriesSection extends StatelessWidget {
  final List<HomeCategoryModel> categories;

  const CategoriesSection({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    if (categories.isEmpty) return const SizedBox.shrink();

    final width = MediaQuery.sizeOf(context).width;
    final cardSize = (width * 0.132).clamp(54.0, 62.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(title: HomeStrings.categories(context)),
        SizedBox(height: width * 0.04),
        SizedBox(
          height: cardSize + 32,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: width * 0.045),
            itemCount: categories.length,
            separatorBuilder: (_, __) => SizedBox(width: width * 0.028),
            itemBuilder: (context, index) {
              return _CategoryChip(
                category: categories[index],
                rtl: HomeStrings.isRtl(context),
                cardSize: cardSize,
              );
            },
          ),
        ),
      ],
    );
  }
}

class _CategoryChip extends StatefulWidget {
  final HomeCategoryModel category;
  final bool rtl;
  final double cardSize;

  const _CategoryChip({
    required this.category,
    required this.rtl,
    required this.cardSize,
  });

  @override
  State<_CategoryChip> createState() => _CategoryChipState();
}

class _CategoryChipState extends State<_CategoryChip> {
  double _scale = 1;

  @override
  Widget build(BuildContext context) {
    final label = widget.rtl ? widget.category.nameAr : widget.category.nameEn;
    final iconSize = widget.cardSize * 0.44;

    return GestureDetector(
      onTapDown: (_) => setState(() => _scale = 0.95),
      onTapUp: (_) => setState(() => _scale = 1),
      onTapCancel: () => setState(() => _scale = 1),
      onTap: () {},
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 130),
        curve: Curves.easeOutCubic,
        child: SizedBox(
          width: widget.cardSize + 10,
          child: Column(
            children: [
              Container(
                width: widget.cardSize,
                height: widget.cardSize,
                decoration: BoxDecoration(
                  color: HomeColors.categorySurface.withAlpha(20),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: HomeColors.categoryBorder,
                    width: 0.5,
                  ),
                  boxShadow: HomeColors.softElevation(blur: 8, y: 2),
                ),
                child: Padding(
                  padding: EdgeInsets.all(widget.cardSize * 0.16),
                  child: Icon(
                    widget.category.icon,
                    color: HomeColors.categoryIcon,
                    size: iconSize,
                  ),
                ),
              ),
              SizedBox(height: widget.cardSize * 0.16),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: HomeTypography.categoryLabel(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
