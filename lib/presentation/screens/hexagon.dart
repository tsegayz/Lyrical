// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'dart:math';

class HexagonColumn extends StatelessWidget {
  final int count;
  final List<String> imagePaths;

  HexagonColumn({required this.count, required this.imagePaths});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        count,
        (index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: SizedBox(
              // width: 150,
              height: 75,
              child: ClipPath(
                clipper: HexagonClipper(),
                child: Image.asset(
                  imagePaths[index % imagePaths.length],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final double sideLength = size.width / 2;
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    for (int i = 0; i < 6; i++) {
      double angle = (2 * pi / 6) * (i + 0.5);
      double x = centerX + sideLength * sin(angle);
      double y = centerY + sideLength * cos(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}