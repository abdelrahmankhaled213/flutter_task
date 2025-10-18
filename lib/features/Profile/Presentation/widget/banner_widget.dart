import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;

  const BannerWidget({
    super.key,
    required this.text,
    required this.backgroundColor ,
   required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';

    return Directionality(
     textDirection: TextDirection.rtl,
      child: ClipPath(
        clipper: DiagonalClipper(clipDepth: 20.0), // Adjust clipDepth for the size of the point
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: 16, vertical: 8),
          color: backgroundColor,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class DiagonalClipper extends CustomClipper<Path> {
  final double clipDepth;

  DiagonalClipper({this.clipDepth = 20.0});

  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0.0, 0.0);

    path.lineTo(size.width, 0.0);

    path.lineTo(size.width, size.height);

    path.lineTo(clipDepth, size.height);


    path.lineTo(0.0, size.height / 2);

    path.lineTo(clipDepth, 0.0);


    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}