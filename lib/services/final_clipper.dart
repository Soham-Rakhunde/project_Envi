import 'package:flutter/material.dart';


class DottedLineHorizontal extends CustomPainter {
  late Color color;
  DottedLineHorizontal({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Colors.grey.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    var max = (0.79)*size.width;
    var dashWidth = 13;
    var dashSpace = 8;
    double startX = 0.11*size.width;
    while (max >= 0) {
      canvas.drawLine(Offset(startX,size.width*0.965), Offset(startX + dashWidth,size.width*0.965), paint_0);
      final space = (dashSpace + dashWidth);
      startX += space;
      max -= space;
    }


    // Path p1 = Path();
    // p1.moveTo(size.width*0.5,size.height*0.85);
    // p1.addRect(Rect.fromCenter(center: Offset(size.width*0.5,size.height*0.9), width: size.width, height: size.height*0.2));
    // p1.close();
    // canvas.drawShadow(p1, color.withOpacity(0.4), 60, false);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}


class BoxShadowTicketPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0;


    Path path_0 = Path();
    path_0.moveTo(size.width*0.1666667,0);
    path_0.cubicTo(size.width*0.6666667,0,size.width*0.6666667,0,size.width*0.8333333,0);
    path_0.quadraticBezierTo(size.width*0.9950000,size.height*-0.0007143,size.width,size.height*0.0714286);
    path_0.lineTo(size.width,size.height*0.4000000);
    path_0.quadraticBezierTo(size.width*0.9326667,size.height*0.4002857,size.width*0.9333333,size.height*0.4285714);
    path_0.quadraticBezierTo(size.width*0.9366667,size.height*0.4574286,size.width,size.height*0.4571429);
    path_0.quadraticBezierTo(size.width,size.height*0.8107143,size.width,size.height*0.9285714);
    path_0.quadraticBezierTo(size.width*1.0036667,size.height*1.0012857,size.width*0.8333333,size.height);
    path_0.lineTo(size.width*0.1666667,size.height);
    path_0.quadraticBezierTo(size.width*0.0016667,size.height*1.0001429,0,size.height*0.9285714);
    path_0.quadraticBezierTo(0,size.height*0.8107143,0,size.height*0.4571429);
    path_0.quadraticBezierTo(size.width*0.0660000,size.height*0.4562857,size.width*0.0666667,size.height*0.4285714);
    path_0.quadraticBezierTo(size.width*0.0646667,size.height*0.4002857,0,size.height*0.4000000);
    path_0.lineTo(0,size.height*0.0714286);
    path_0.lineTo(0,size.height*0.0714286);
    path_0.quadraticBezierTo(size.width*-0.0016667,size.height*0.0007143,size.width*0.1666667,0);
    path_0.close();

    canvas.drawPath(path_0, paint_0);


    canvas.drawShadow(path_0, Colors.black, 8, false);


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;


    Path path_0 = Path();
    path_0.moveTo(size.width*0.1666667,0);
    path_0.cubicTo(size.width*0.6666667,0,size.width*0.6666667,0,size.width*0.8333333,0);
    path_0.quadraticBezierTo(size.width*0.9950000,size.height*-0.0007143,size.width,size.height*0.0714286);
    path_0.lineTo(size.width,size.height*0.4000000);
    path_0.quadraticBezierTo(size.width*0.9326667,size.height*0.4002857,size.width*0.9333333,size.height*0.4285714);
    path_0.quadraticBezierTo(size.width*0.9366667,size.height*0.4574286,size.width,size.height*0.4571429);
    path_0.quadraticBezierTo(size.width,size.height*0.8107143,size.width,size.height*0.9285714);
    path_0.quadraticBezierTo(size.width*1.0036667,size.height*1.0012857,size.width*0.8333333,size.height);
    path_0.lineTo(size.width*0.1666667,size.height);
    path_0.quadraticBezierTo(size.width*0.0016667,size.height*1.0001429,0,size.height*0.9285714);
    path_0.quadraticBezierTo(0,size.height*0.8107143,0,size.height*0.4571429);
    path_0.quadraticBezierTo(size.width*0.0660000,size.height*0.4562857,size.width*0.0666667,size.height*0.4285714);
    path_0.quadraticBezierTo(size.width*0.0646667,size.height*0.4002857,0,size.height*0.4000000);
    path_0.lineTo(0,size.height*0.0714286);
    path_0.lineTo(0,size.height*0.0714286);
    path_0.quadraticBezierTo(size.width*-0.0016667,size.height*0.0007143,size.width*0.1666667,0);


    // canvas.drawPath(path_0, paint_0);
    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
