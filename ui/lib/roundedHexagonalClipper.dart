import 'dart:math';

import 'package:flutter/material.dart';

/// [HexagonalClipper], can be used with [ClipPath] widget, and clips the widget in Hexagon shape
class RoundedHexagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // var oneQuarterWidth = size.width / 4.0;

    final path = Path();
    path.lineTo(size.width * 1.4, size.height * 0.94);
    path.cubicTo(size.width * 1.35, size.height * 0.96, size.width * 1.32,
        size.height, size.width * 1.32, size.height * 1.06);
    path.cubicTo(size.width * 1.32, size.height * 1.15, size.width * 1.32,
        size.height * 1.33, size.width * 1.32, size.height * 1.42);
    path.cubicTo(size.width * 1.32, size.height * 1.47, size.width * 1.35,
        size.height * 1.51, size.width * 1.4, size.height * 1.54);
    path.cubicTo(size.width * 1.49, size.height * 1.58, size.width * 1.66,
        size.height * 1.68, size.width * 1.75, size.height * 1.72);
    path.cubicTo(size.width * 1.8, size.height * 1.74, size.width * 1.85,
        size.height * 1.74, size.width * 1.9, size.height * 1.72);
    path.cubicTo(size.width * 1.99, size.height * 1.68, size.width * 2.17,
        size.height * 1.58, size.width * 2.26, size.height * 1.53);
    path.cubicTo(size.width * 2.3, size.height * 1.51, size.width * 2.32,
        size.height * 1.47, size.width * 2.32, size.height * 1.43);
    path.cubicTo(size.width * 2.32, size.height * 1.34, size.width * 2.32,
        size.height * 1.14, size.width * 2.32, size.height * 1.05);
    path.cubicTo(size.width * 2.32, size.height, size.width * 2.3,
        size.height * 0.96, size.width * 2.25, size.height * 0.94);
    path.cubicTo(size.width * 2.17, size.height * 0.9, size.width * 1.99,
        size.height * 0.8, size.width * 1.9, size.height * 0.76);
    path.cubicTo(size.width * 1.85, size.height * 0.73, size.width * 1.8,
        size.height * 0.73, size.width * 1.75, size.height * 0.76);
    path.cubicTo(size.width * 1.66, size.height * 0.8, size.width * 1.49,
        size.height * 0.89, size.width * 1.4, size.height * 0.94);
    path.cubicTo(size.width * 1.4, size.height * 0.94, size.width * 1.4,
        size.height * 0.94, size.width * 1.4, size.height * 0.94);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
// class MyPainter extends CustomPainter {
//     @override
//     void paint(Canvas canvas, Size size) {
//       Paint paint = Paint();
//       Path path = Path();


//       // Path number 1


//       paint.color = Color(0xffffffff).withOpacity(0);
//       path = Path();
//       path.lineTo(0, 0);
//       canvas.drawPath(path, paint);


//       // Path number 2


//       paint.color = Color(0xffffffff).withOpacity(0);
//       path = Path();
//       path.lineTo(size.width * 1.4, size.height * 0.94);
//       path.cubicTo(size.width * 1.35, size.height * 0.96, size.width * 1.32, size.height, size.width * 1.32, size.height * 1.06);
//       path.cubicTo(size.width * 1.32, size.height * 1.15, size.width * 1.32, size.height * 1.33, size.width * 1.32, size.height * 1.42);
//       path.cubicTo(size.width * 1.32, size.height * 1.47, size.width * 1.35, size.height * 1.51, size.width * 1.4, size.height * 1.54);
//       path.cubicTo(size.width * 1.49, size.height * 1.58, size.width * 1.66, size.height * 1.68, size.width * 1.75, size.height * 1.72);
//       path.cubicTo(size.width * 1.8, size.height * 1.74, size.width * 1.85, size.height * 1.74, size.width * 1.9, size.height * 1.72);
//       path.cubicTo(size.width * 1.99, size.height * 1.68, size.width * 2.17, size.height * 1.58, size.width * 2.26, size.height * 1.53);
//       path.cubicTo(size.width * 2.3, size.height * 1.51, size.width * 2.32, size.height * 1.47, size.width * 2.32, size.height * 1.43);
//       path.cubicTo(size.width * 2.32, size.height * 1.34, size.width * 2.32, size.height * 1.14, size.width * 2.32, size.height * 1.05);
//       path.cubicTo(size.width * 2.32, size.height, size.width * 2.3, size.height * 0.96, size.width * 2.25, size.height * 0.94);
//       path.cubicTo(size.width * 2.17, size.height * 0.9, size.width * 1.99, size.height * 0.8, size.width * 1.9, size.height * 0.76);
//       path.cubicTo(size.width * 1.85, size.height * 0.73, size.width * 1.8, size.height * 0.73, size.width * 1.75, size.height * 0.76);
//       path.cubicTo(size.width * 1.66, size.height * 0.8, size.width * 1.49, size.height * 0.89, size.width * 1.4, size.height * 0.94);
//       path.cubicTo(size.width * 1.4, size.height * 0.94, size.width * 1.4, size.height * 0.94, size.width * 1.4, size.height * 0.94);
//       canvas.drawPath(path, paint);
//     }
//     @override
//     bool shouldRepaint(CustomPainter oldDelegate) {
//       return true;
//     }
//   }