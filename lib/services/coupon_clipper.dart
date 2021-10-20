import 'package:flutter/material.dart';


class DottedLinePainter extends CustomPainter {
  late Color color;
  DottedLinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Colors.grey.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    var max = (0.8750000 - 0.125)*size.height;
    var dashWidth = 11;
    var dashSpace = 11;
    double startY = 0.14*size.height;
    while (max >= 0) {
      canvas.drawLine(Offset(size.width*0.6250000,startY), Offset(size.width*0.6250000,startY + dashWidth), paint_0);
      final space = (dashSpace + dashWidth);
      startY += space;
      max -= space;
    }


    Path p1 = Path();
    p1.moveTo(size.width*0.82,size.height/2-35);
    p1.addOval(Rect.fromCenter(center: Offset(size.width*0.82,size.height/2 -35), width: 50, height: 50));
    p1.close();
    canvas.drawShadow(p1, color.withOpacity(0.6), 50, false);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}


class BoxShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
    ..color = Color.fromARGB(255, 33, 150, 243)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1;


    Path path_0 = Path();
    path_0.moveTo(size.width*0.0500000,0);
    path_0.lineTo(size.width*0.5875000,0);
    path_0.quadraticBezierTo(size.width*0.5875000,size.height*0.0842857,size.width*0.6250000,size.height*0.0857143);
    path_0.quadraticBezierTo(size.width*0.6625000,size.height*0.0842857,size.width*0.6625000,0);
    path_0.quadraticBezierTo(size.width*0.8625000,0,size.width*0.9500000,0);
    path_0.quadraticBezierTo(size.width*1.0006250,0,size.width,size.height*0.1142857);
    path_0.lineTo(size.width,size.height*0.8857143);
    path_0.quadraticBezierTo(size.width*1.0006250,size.height,size.width*0.9500000,size.height);
    path_0.quadraticBezierTo(size.width*0.8625000,size.height,size.width*0.6625000,size.height);
    path_0.quadraticBezierTo(size.width*0.6616375,size.height*0.9145429,size.width*0.6250000,size.height*0.9142857);
    path_0.quadraticBezierTo(size.width*0.5872625,size.height*0.9155429,size.width*0.5875000,size.height);
    path_0.quadraticBezierTo(size.width*0.1687500,size.height,size.width*0.0500000,size.height);
    path_0.quadraticBezierTo(0,size.height,0,size.height*0.8857143);
    path_0.quadraticBezierTo(0,size.height*0.3071429,0,size.height*0.1142857);
    path_0.quadraticBezierTo(0,0,size.width*0.0500000,0);
    path_0.close();



    canvas.drawShadow(path_0, Colors.black, 8, false);


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class CouponClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint_0 = new Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(size.width*0.0500000,0);
    path_0.lineTo(size.width*0.5875000,0);
    path_0.quadraticBezierTo(size.width*0.5875000,size.height*0.0842857,size.width*0.6250000,size.height*0.0857143);
    path_0.quadraticBezierTo(size.width*0.6625000,size.height*0.0842857,size.width*0.6625000,0);
    path_0.quadraticBezierTo(size.width*0.8625000,0,size.width*0.9500000,0);
    path_0.quadraticBezierTo(size.width*1.0006250,0,size.width,size.height*0.1142857);
    path_0.lineTo(size.width,size.height*0.8857143);
    path_0.quadraticBezierTo(size.width*1.0006250,size.height,size.width*0.9500000,size.height);
    path_0.quadraticBezierTo(size.width*0.8625000,size.height,size.width*0.6625000,size.height);
    path_0.quadraticBezierTo(size.width*0.6616375,size.height*0.9145429,size.width*0.6250000,size.height*0.9142857);
    path_0.quadraticBezierTo(size.width*0.5872625,size.height*0.9155429,size.width*0.5875000,size.height);
    path_0.quadraticBezierTo(size.width*0.1687500,size.height,size.width*0.0500000,size.height);
    path_0.quadraticBezierTo(0,size.height,0,size.height*0.8857143);
    path_0.quadraticBezierTo(0,size.height*0.3071429,0,size.height*0.1142857);
    path_0.quadraticBezierTo(0,0,size.width*0.0500000,0);
    path_0.close();

    // canvas.drawPath(path_0, paint_0);
    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}