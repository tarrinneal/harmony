import 'package:flutter/material.dart';

class RoundedHexagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
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
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
