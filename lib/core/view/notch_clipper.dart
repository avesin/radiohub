import 'package:flutter/rendering.dart';

class NotchClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    final notchRadius = 50.0;
    final centerX = size.width / 2;

    path.moveTo(0, 0);

    // left side
    path.lineTo(centerX - notchRadius, 0);

    // 👇 cut-out (half circle)
    path.arcToPoint(
      Offset(centerX + notchRadius, 0),
      radius: Radius.circular(notchRadius),
      clockwise: false,
    );

    // right side
    path.lineTo(size.width, 0);

    // bottom
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(_) => false;
}
