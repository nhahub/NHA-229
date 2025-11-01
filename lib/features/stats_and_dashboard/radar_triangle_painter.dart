import 'package:flutter/material.dart';
import 'dart:math' as math;

class RadarTrianglePainter extends CustomPainter {
  final double progress;
  final double rank;
  final double achievements;

  RadarTrianglePainter({
    required this.progress,
    required this.rank,
    required this.achievements,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final Paint fillPaint = Paint()
      ..color = const Color(0xFF82C0CB)
      ..style = PaintingStyle.fill;

    final Paint axisPaint = Paint()
      ..color = const Color(0xFFECE7E3)
      ..strokeWidth = 1.5;

    final Paint yellowPaint = Paint()
      ..color = const Color(0xFFFFA62B)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final double radius = size.width * 0.45;

    final List<Offset> outerPoints = List.generate(3, (i) {
      final angle = -math.pi / 2 + (2 * math.pi / 3) * i;
      return Offset(
        center.dx + radius * math.cos(angle),
        center.dy + radius * math.sin(angle),
      );
    });

    final Path trianglePath = Path()
      ..moveTo(outerPoints[0].dx, outerPoints[0].dy)
      ..lineTo(outerPoints[1].dx, outerPoints[1].dy)
      ..lineTo(outerPoints[2].dx, outerPoints[2].dy)
      ..close();

    canvas.drawPath(trianglePath, fillPaint);
    canvas.drawPath(trianglePath, borderPaint);

    for (final p in outerPoints) {
      canvas.drawLine(center, p, axisPaint);
    }

    final values = [achievements, progress, rank];

    final List<Offset> yellowPoints = List.generate(3, (i) {
      final angle = -math.pi / 2 + (2 * math.pi / 3) * i;
      return Offset(
        center.dx + radius * math.cos(angle) * values[i],
        center.dy + radius * math.sin(angle) * values[i],
      );
    });

    final Path yellowTriangle = Path()
      ..moveTo(yellowPoints[0].dx, yellowPoints[0].dy)
      ..lineTo(yellowPoints[1].dx, yellowPoints[1].dy)
      ..lineTo(yellowPoints[2].dx, yellowPoints[2].dy)
      ..close();

    canvas.drawPath(yellowTriangle, yellowPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
