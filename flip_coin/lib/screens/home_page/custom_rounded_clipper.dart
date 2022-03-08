import 'package:flutter/material.dart';

/// Curva que copia um círculo (moeda amarela) na tela principal
class CustomRoundedClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = Path();
    
    // Path start: P0
    path.lineTo(0, size.height - 60); 
    // First point of the bezier curve: P1
    var firstStart = Offset(size.width / 5 , size.height);
    // Second point of the bezier curve: P2
    var firstEnd = Offset(size.width / 2, size.height);

    // First bezier curve
    path.quadraticBezierTo(firstStart.dx, firstStart.dy,
      firstEnd.dx, firstEnd.dy);
    
    // Third point of the bezier curve: P3
    var secondStart = Offset(size.width - (size.width / 5), size.height);
    // Fourth point of the bezier curve: P
    var secondEnd = Offset(size.width, size.height - 60);

    // Second bezier curve
    path.quadraticBezierTo(secondStart.dx, secondStart.dy,
     secondEnd.dx, secondEnd.dy);
    path.lineTo(size.width, 0);
    path.close;
    return path;    
  }

  @override
  bool shouldReclip(oldClipper) => false;
}