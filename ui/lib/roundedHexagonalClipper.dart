import 'dart:math';

import 'package:flutter/material.dart';

class RoundedHexagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var oneQuarterWidth = size.width / 4;

    final path = Path()
      ..moveTo(size.width / 40, (size.height / 5) * 3)
      ..lineTo((size.width / 40) * 8, (size.height / 40) * 36)
      ..quadraticBezierTo((size.width / 40) * 11, size.height, (size.width / 40) * 15, size.height)
      ..lineTo((size.width / 40) * 25, size.height)
      ..quadraticBezierTo((size.width / 40) * 29, size.height, (size.width / 40) * 32, (size.height / 40) * 36)
      ..lineTo((size.width / 40) * 39, (size.height / 5) * 3)
      ..quadraticBezierTo((size.width / 40) * 41, size.height / 2, (size.width / 40) * 39, (size.height / 5) * 2)
      ..lineTo((size.width / 40) * 32, (size.height / 40) * 4)
      ..quadraticBezierTo((size.width / 40) * 29, 0, (size.width / 40) * 25, 0)
      ..lineTo((size.width / 40) * 15, 0)
      ..quadraticBezierTo((size.width / 40) * 11, 0, (size.width / 40) * 8, (size.height / 40) * 4)
      ..lineTo(size.width / 40, (size.height / 5) * 2)
      ..quadraticBezierTo(-size.width / 40, size.height / 2, size.width / 40, (size.height / 5) * 3)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}


// var radius = size.width / 2;

//     final path = Path();
//     var angle = (pi * 2) / 6;
//     Offset firstPoint = Offset(radius * cos(0.0), radius * sin(0.0));
//     path.moveTo(firstPoint.dx + radius, firstPoint.dy + radius);
//     for (int i = 1; i <= 6; i++) {
//       double x = radius * cos(angle * i) + radius;
//       double y = radius * sin(angle * i) + radius;
//       path.lineTo(x, y);
//     }
//     path.close();
//     return path;



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