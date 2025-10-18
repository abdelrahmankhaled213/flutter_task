import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/utils/app_color.dart';
import 'package:flutter_task/core/utils/app_style.dart';

import 'package:flutter/material.dart';

class GaugeWidget extends StatelessWidget {
  final double value;
  final double progress;
  final String labelText;
  final double size;

  const GaugeWidget({

    Key? key,
    required this.value,
    required this.progress,
    this.labelText = 'ضعف عدد\nالمشاهدات',
    this.size = 120.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(

      textDirection: TextDirection.rtl,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          SizedBox(
            width: size,
            height: size / 2,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: Size(size, size / 2),
                  painter: SemiCirclePainter(
                    percentage: progress.clamp(0.0, 1.0),
                  ),
                ),

                                Positioned(

                  bottom: 10,
                  child: Text(
                    value.round().toString(),
                    style: TextStyle(
                      fontSize: size * 0.25,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF4CAF50),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),
          Text(
            labelText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade700,
              decoration: TextDecoration.underline,
              decorationColor: Colors.grey.shade700,
              decorationThickness: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}


class SemiCirclePainter extends CustomPainter {
  final double percentage;
  final Color baseColor;
  final Color progressColor;
  final double strokeWidth;

  SemiCirclePainter({
    required this.percentage,
    this.baseColor = const Color(0xFFE8F5E9),
    this.progressColor = const Color(0xFF4CAF50),
    this.strokeWidth = 6.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Define the center of the semi-circle
    final center = Offset(size.width / 2, size.height);
    // Define the radius (it's half the width)
    final radius = size.width / 2;
    // Define the bounding rectangle for the arc
    final rect = Rect.fromCircle(center: center, radius: radius);

    // 1. Draw the Base Arc (The full semi-circle outline)
    final basePaint = Paint()
      ..color = baseColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round; // Optional: round ends for a softer look

    // Start angle is 180 degrees (pi) and sweep is 180 degrees (pi)
    const startAngle = 3.14159; // M_PI (180 degrees)
    const sweepAngle = 3.14159; // M_PI (180 degrees)

    canvas.drawArc(rect, startAngle, sweepAngle, false, basePaint);

    // 2. Draw the Progress Arc
    final progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // Calculate the actual sweep angle based on the percentage
    final progressSweepAngle = sweepAngle * percentage;

    // The progress starts at the left side (180 degrees)
    canvas.drawArc(rect, startAngle, progressSweepAngle, false, progressPaint);

    // 3. (Optional) Draw the solid fill color underneath the arc
    final fillPaint = Paint()
      ..color = baseColor.withOpacity(0.5) // Slightly darker fill than base
      ..style = PaintingStyle.fill;

    // The fill shape must be a closed path to fill correctly
    final path = Path()
      ..arcTo(rect, startAngle, sweepAngle, false)
      ..lineTo(center.dx, center.dy) // Closes the path to the center
      ..close();

    canvas.drawPath(path, fillPaint);
  }

  @override
  bool shouldRepaint(covariant SemiCirclePainter oldDelegate) {
    return oldDelegate.percentage != percentage;
  }
}







