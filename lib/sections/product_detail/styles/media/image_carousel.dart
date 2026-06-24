import 'package:flutter/material.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../../../design_system/scope/design_system_scope.dart';
import '../../widgets/ui_placeholders.dart';

/// Media 4 — rounded carousel with elegant pagination.
class ImageCarouselMedia extends StatefulWidget {
  const ImageCarouselMedia({super.key});

  @override
  State<ImageCarouselMedia> createState() => _ImageCarouselMediaState();
}

class _ImageCarouselMediaState extends State<ImageCarouselMedia> {
  late final PageController _controller;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 0.88);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final count = ProductDetailUi.imageCount(context);
    final height = AppSizes.h(context, 0.26);
    final padding = ProductDetailUi.pagePadding(context);

    if (count == 0) {
      return Padding(
        padding: padding,
        child: ProductDetailUi.emptyImageBlock(
          context,
          height: height,
          borderRadius: BorderRadius.circular(24),
        ),
      );
    }

    final pages = count == 1 ? 1 : count.clamp(1, 6);

    return Padding(
      padding: padding,
      child: Column(
        children: [
          SizedBox(
            height: height,
            child: pages == 1
                ? _CarouselPage(context: context, height: height)
                : PageView.builder(
                    controller: _controller,
                    itemCount: pages,
                    onPageChanged: (p) => setState(() => _page = p),
                    itemBuilder: (_, __) => Padding(
                      padding: EdgeInsets.only(
                        right: ProductDetailUi.gapSm(context),
                      ),
                      child: _CarouselPage(context: context, height: height),
                    ),
                  ),
          ),
          if (pages > 1) ...[
            SizedBox(height: ProductDetailUi.gapMd(context)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${_page + 1}',
                  style: context.ds.typography.caption(context).copyWith(
                        color: palette.primary,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                Text(
                  ' / $pages',
                  style: context.ds.typography.caption(context).copyWith(
                        color: palette.textSecondary,
                      ),
                ),
                SizedBox(width: ProductDetailUi.gapMd(context)),
                ...List.generate(pages, (i) {
                  final active = i == _page;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    width: active ? 22 : 6,
                    height: 6,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      color: active
                          ? palette.primary
                          : palette.primarySoft(0.22),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  );
                }),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _CarouselPage extends StatelessWidget {
  final BuildContext context;
  final double height;

  const _CarouselPage({required this.context, required this.height});

  @override
  Widget build(BuildContext _) {
    final palette = context.ds.palette;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            palette.primarySoft(0.06),
            palette.surface,
          ],
        ),
        boxShadow: ProductDetailUi.softShadow(context, opacity: 0.12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: ProductDetailUi.imageBlock(
          context,
          height: height,
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }
}
