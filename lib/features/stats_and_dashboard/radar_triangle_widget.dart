import 'package:flutter/material.dart';
import 'radar_triangle_painter.dart';

class RadarTriangleWidget extends StatelessWidget {
  final double progress;
  final double rank;
  final double achievements;

  const RadarTriangleWidget({
    super.key,
    required this.progress,
    required this.rank,
    required this.achievements,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(250, 216),
      painter: RadarTrianglePainter(
        progress: progress,
        rank: rank,
        achievements: achievements,
      ),
    );
  }
}
