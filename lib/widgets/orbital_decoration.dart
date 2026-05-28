import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class OrbitalDecoration extends StatelessWidget {
  final double size;

  const OrbitalDecoration({super.key, this.size = 240});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _OrbitalPainter(),
      ),
    );
  }
}

class _OrbitalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final outerRadius = size.width / 2;

    const orbitTilt = -math.pi / 8;

    _drawOrbit(
      canvas,
      center,
      outerRadius * 0.95,
      const Color(0x4DB84A0F),
      orbitTilt,
    );
    _drawOrbit(
      canvas,
      center,
      outerRadius * 0.7,
      const Color(0x80B84A0F),
      orbitTilt,
    );
    _drawOrbit(
      canvas,
      center,
      outerRadius * 0.45,
      const Color(0xB3FF6B1A),
      orbitTilt,
    );

    const dotAngle = math.pi / 3;
    final dotRadius = outerRadius * 0.7;
    final dotOffset = _pointOnTiltedEllipse(
      center: center,
      radius: dotRadius,
      angle: dotAngle,
      tilt: orbitTilt,
    );
    final dotPaint = Paint()
      ..color = AppColors.marsOrange
      ..style = PaintingStyle.fill;
    canvas.drawCircle(dotOffset, 4, dotPaint);

    final earthPaint = Paint()
      ..color = AppColors.textPrimary
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, outerRadius * 0.08, earthPaint);
  }

  void _drawOrbit(
    Canvas canvas,
    Offset center,
    double radius,
    Color color,
    double tilt,
  ) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;
    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(tilt);
    canvas.scale(1, 0.42);
    canvas.drawCircle(Offset.zero, radius, paint);
    canvas.restore();
  }

  Offset _pointOnTiltedEllipse({
    required Offset center,
    required double radius,
    required double angle,
    required double tilt,
  }) {
    final x = radius * math.cos(angle);
    final y = radius * 0.42 * math.sin(angle);
    final rotatedX = x * math.cos(tilt) - y * math.sin(tilt);
    final rotatedY = x * math.sin(tilt) + y * math.cos(tilt);
    return Offset(center.dx + rotatedX, center.dy + rotatedY);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
