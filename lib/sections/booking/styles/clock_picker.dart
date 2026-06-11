import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/models/app_palette.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../booking_tokens.dart';

class ClockPickerStyle extends StatelessWidget {
  const ClockPickerStyle({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final clockSize = AppSizes.w(context, 0.62);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BookingTokens.sectionHeader(context),
        SizedBox(height: BookingTokens.gapMd(context)),
        SizedBox(
          height: AppSizes.h(context, 0.09),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: BookingTokens.sectionPadding(context),
            itemCount: 6,
            separatorBuilder: (_, __) =>
                SizedBox(width: BookingTokens.gapSm(context)),
            itemBuilder: (context, index) {
              return BookingTokens.dateChip(
                context,
                selected: index == BookingTokens.mockSelectedDateIndex,
              );
            },
          ),
        ),
        SizedBox(height: BookingTokens.gapLg(context)),
        Padding(
          padding: BookingTokens.sectionPadding(context),
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  width: clockSize,
                  height: clockSize,
                  child: CustomPaint(
                    painter: _AnalogClockPainter(
                      palette: palette,
                      selectedHour: 2,
                      selectedMinute: 30,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          BookingTokens.textLine(
                            context,
                            widthFactor: 0.16,
                            heightFactor: 0.012,
                          ),
                          SizedBox(height: BookingTokens.gapXs(context)),
                          BookingTokens.textLine(
                            context,
                            widthFactor: 0.10,
                            heightFactor: 0.006,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: BookingTokens.gapLg(context)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  final selected = index == 1;
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: BookingTokens.gapXs(context),
                    ),
                    child: BookingTokens.timeSlotPill(
                      context,
                      selected: selected,
                      widthFactor: 0.12,
                    ),
                  );
                }),
              ),
              SizedBox(height: BookingTokens.gapLg(context)),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(AppSizes.w(context, 0.045)),
                decoration: BoxDecoration(
                  color: BookingTokens.surface(context),
                  borderRadius: BookingTokens.borderLg(context),
                  border: Border.all(color: palette.primarySoft(0.18)),
                  boxShadow: BookingTokens.elevatedShadow(context),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        BookingTokens.specialistAvatar(
                          context,
                          specialist: BookingTokens.specialists.first,
                          size: AppSizes.w(context, 0.12),
                          selected: true,
                        ),
                        SizedBox(width: BookingTokens.gapMd(context)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BookingTokens.textLine(
                                context,
                                widthFactor: 0.24,
                                heightFactor: 0.009,
                              ),
                              SizedBox(height: BookingTokens.gapXs(context)),
                              BookingTokens.textLine(
                                context,
                                widthFactor: 0.18,
                                heightFactor: 0.006,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: BookingTokens.gapMd(context)),
                    Container(
                      height: 1,
                      color: palette.border,
                    ),
                    SizedBox(height: BookingTokens.gapMd(context)),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BookingTokens.textLine(
                                context,
                                widthFactor: 0.14,
                                heightFactor: 0.007,
                              ),
                              SizedBox(height: BookingTokens.gapXs(context)),
                              BookingTokens.textLine(
                                context,
                                widthFactor: 0.10,
                                heightFactor: 0.006,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BookingTokens.textLine(
                                context,
                                widthFactor: 0.14,
                                heightFactor: 0.007,
                              ),
                              SizedBox(height: BookingTokens.gapXs(context)),
                              BookingTokens.textLine(
                                context,
                                widthFactor: 0.10,
                                heightFactor: 0.006,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: BookingTokens.gapMd(context)),
                    BookingTokens.bookCta(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _AnalogClockPainter extends CustomPainter {
  final AppPalette palette;
  final int selectedHour;
  final int selectedMinute;

  _AnalogClockPainter({
    required this.palette,
    required this.selectedHour,
    required this.selectedMinute,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = palette.surface
        ..style = PaintingStyle.fill,
    );
    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = palette.primary.withOpacity(0.25)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );

    for (var i = 0; i < 12; i++) {
      final angle = (i * 30 - 90) * math.pi / 180;
      final inner = center +
          Offset(
            (radius - 14) * math.cos(angle),
            (radius - 14) * math.sin(angle),
          );
      final outer = center +
          Offset(
            (radius - 6) * math.cos(angle),
            (radius - 6) * math.sin(angle),
          );
      canvas.drawLine(
        inner,
        outer,
        Paint()
          ..color = palette.textSecondary.withOpacity(0.40)
          ..strokeWidth = i % 3 == 0 ? 2.5 : 1.2,
      );
    }

    final hourAngle =
        ((selectedHour % 12) + selectedMinute / 60) * 30 - 90;
    final minuteAngle = selectedMinute * 6 - 90;

    _drawHand(
      canvas,
      center,
      hourAngle * math.pi / 180,
      radius * 0.45,
      palette.primary,
      4,
    );
    _drawHand(
      canvas,
      center,
      minuteAngle * math.pi / 180,
      radius * 0.65,
      palette.accent,
      2.5,
    );

    canvas.drawCircle(center, 6, Paint()..color = palette.primary);
  }

  void _drawHand(
    Canvas canvas,
    Offset center,
    double angleRad,
    double length,
    Color color,
    double width,
  ) {
    final end = center +
        Offset(length * math.cos(angleRad), length * math.sin(angleRad));
    canvas.drawLine(
      center,
      end,
      Paint()
        ..color = color
        ..strokeWidth = width
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(covariant _AnalogClockPainter oldDelegate) => false;
}
