import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

class AltitudeBar extends StatelessWidget {
  final double altitudeKm;

  const AltitudeBar({super.key, required this.altitudeKm});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Expanded(child: _ZoneLabel(text: 'LEO')),
            Expanded(child: _ZoneLabel(text: 'MEO')),
            Expanded(child: _ZoneLabel(text: 'GEO')),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 28,
          child: CustomPaint(
            size: const Size(double.infinity, 28),
            painter: _AltitudePainter(altitudeKm: altitudeKm),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '${altitudeKm.toStringAsFixed(0)} km',
          style: AppTypography.bodyMedium().copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}

class _ZoneLabel extends StatelessWidget {
  final String text;
  const _ZoneLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: AppTypography.labelSmall().copyWith(
        color: AppColors.textTertiary,
      ),
    );
  }
}

class _AltitudePainter extends CustomPainter {
  final double altitudeKm;

  _AltitudePainter({required this.altitudeKm});

  @override
  void paint(Canvas canvas, Size size) {
    final axisY = size.height / 2;
    final axisPaint = Paint()
      ..color = AppColors.spaceBorder
      ..strokeWidth = 1;
    canvas.drawLine(
      Offset(0, axisY),
      Offset(size.width, axisY),
      axisPaint,
    );

    final tickPaint = Paint()
      ..color = AppColors.spaceBorder
      ..strokeWidth = 1;
    final third = size.width / 3;
    canvas.drawLine(
      Offset(third, axisY - 6),
      Offset(third, axisY + 6),
      tickPaint,
    );
    canvas.drawLine(
      Offset(third * 2, axisY - 6),
      Offset(third * 2, axisY + 6),
      tickPaint,
    );

    final fraction = _altitudeFraction(altitudeKm);
    final markerX = fraction * size.width;

    final markerPaint = Paint()
      ..color = AppColors.marsOrange
      ..strokeWidth = 2;
    canvas.drawLine(
      Offset(markerX, 0),
      Offset(markerX, size.height),
      markerPaint,
    );

    final dotPaint = Paint()
      ..color = AppColors.marsOrange
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(markerX, axisY), 5, dotPaint);
  }

  double _altitudeFraction(double altitude) {
    const leoMin = 200.0;
    const leoMax = 2000.0;
    const meoMax = 35786.0;
    if (altitude <= leoMin) {
      return 0.02;
    }
    if (altitude <= leoMax) {
      final ratio = (altitude - leoMin) / (leoMax - leoMin);
      return ratio * (1 / 3);
    }
    if (altitude < meoMax) {
      final ratio = (altitude - leoMax) / (meoMax - leoMax);
      return (1 / 3) + ratio * (1 / 3);
    }
    return 1.0 - 0.02;
  }

  @override
  bool shouldRepaint(covariant _AltitudePainter oldDelegate) =>
      oldDelegate.altitudeKm != altitudeKm;
}
