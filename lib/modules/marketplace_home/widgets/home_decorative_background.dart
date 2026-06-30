import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../theme/home_colors.dart';

/// Subtle luxury accents — non-distracting background ornamentation.
class HomeDecorativeBackground extends StatelessWidget {
  const HomeDecorativeBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        fit: StackFit.expand,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  HomeColors.backgroundWarm,
                  HomeColors.background,
                  HomeColors.background.withValues(alpha: 0.98),
                ],
                stops: const [0, 0.45, 1],
              ),
            ),
          ),
          CustomPaint(
            painter: _LuxuryOrnamentPainter(
              size: MediaQuery.sizeOf(context),
            ),
          ),
        ],
      ),
    );
  }
}

class _LuxuryOrnamentPainter extends CustomPainter {
  final Size size;

  _LuxuryOrnamentPainter({required this.size});

  @override
  void paint(Canvas canvas, Size canvasSize) {
    _drawSoftBlob(
      canvas,
      center: Offset(canvasSize.width * 0.88, canvasSize.height * 0.06),
      radius: canvasSize.width * 0.28,
      color: HomeColors.decorativeBurgundy,
    );
    _drawSoftBlob(
      canvas,
      center: Offset(canvasSize.width * 0.08, canvasSize.height * 0.22),
      radius: canvasSize.width * 0.18,
      color: HomeColors.decorativeBeige,
    );
    _drawSoftBlob(
      canvas,
      center: Offset(canvasSize.width * 0.92, canvasSize.height * 0.52),
      radius: canvasSize.width * 0.14,
      color: HomeColors.decorativeBeige,
    );

    _drawFloralHint(
      canvas,
      center: Offset(canvasSize.width * 0.06, canvasSize.height * 0.68),
      scale: canvasSize.width * 0.012,
    );
    _drawFloralHint(
      canvas,
      center: Offset(canvasSize.width * 0.94, canvasSize.height * 0.78),
      scale: canvasSize.width * 0.01,
    );

    _drawCurve(
      canvas,
      start: Offset(0, canvasSize.height * 0.38),
      end: Offset(canvasSize.width * 0.35, canvasSize.height * 0.42),
    );
  }

  void _drawSoftBlob(
    Canvas canvas, {
    required Offset center,
    required double radius,
    required Color color,
  }) {
    final paint = Paint()
      ..shader = RadialGradient(
        colors: [color, color.withValues(alpha: 0)],
      ).createShader(Rect.fromCircle(center: center, radius: radius));
    canvas.drawCircle(center, radius, paint);
  }

  void _drawFloralHint(Canvas canvas, {required Offset center, required double scale}) {
    final paint = Paint()
      ..color = HomeColors.decorativeBeige.withValues(alpha: 0.55)
      ..style = PaintingStyle.stroke
      ..strokeWidth = scale * 0.35;

    for (var i = 0; i < 5; i++) {
      final angle = (i * 72 - 90) * math.pi / 180;
      final petalEnd = center + Offset(math.cos(angle), math.sin(angle)) * scale * 4;
      canvas.drawLine(center, petalEnd, paint);
      canvas.drawCircle(petalEnd, scale * 0.9, paint..style = PaintingStyle.fill);
      paint.style = PaintingStyle.stroke;
    }
    canvas.drawCircle(center, scale * 0.8, paint);
  }

  void _drawCurve(Canvas canvas, {required Offset start, required Offset end}) {
    final path = Path()
      ..moveTo(start.dx, start.dy)
      ..quadraticBezierTo(
        start.dx + (end.dx - start.dx) * 0.5,
        start.dy - 24,
        end.dx,
        end.dy,
      );
    canvas.drawPath(
      path,
      Paint()
        ..color = HomeColors.decorativeBeige.withValues(alpha: 0.35)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.2,
    );
  }

  @override
  bool shouldRepaint(covariant _LuxuryOrnamentPainter oldDelegate) =>
      oldDelegate.size != size;
}
