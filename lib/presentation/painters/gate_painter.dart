import 'package:flutter/material.dart';
import '../../domain/entities/gate_type.dart';

class GatePainter extends CustomPainter {
  final GateType gateType;
  final Color lineColor;

  GatePainter({
    required this.gateType,
    this.lineColor = const Color(0xFFFF0000), // Red color as specified
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = lineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;

    final fillPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    switch (gateType) {
      case GateType.and:
        _drawAndGate(canvas, size, paint, fillPaint);
        break;
      case GateType.or:
        _drawOrGate(canvas, size, paint, fillPaint);
        break;
      case GateType.not:
        _drawNotGate(canvas, size, paint, fillPaint);
        break;
      case GateType.nand:
        _drawNandGate(canvas, size, paint, fillPaint);
        break;
      case GateType.nor:
        _drawNorGate(canvas, size, paint, fillPaint);
        break;
      case GateType.xor:
        _drawXorGate(canvas, size, paint, fillPaint);
        break;
      case GateType.xnor:
        _drawXnorGate(canvas, size, paint, fillPaint);
        break;
    }
  }

  void _drawAndGate(Canvas canvas, Size size, Paint paint, Paint fillPaint) {
    final width = size.width;
    final height = size.height;
    final centerY = height / 2;

    // Input lines
    final inputAY = centerY - 20;
    final inputBY = centerY + 20;
    canvas.drawLine(Offset(0, inputAY), Offset(width * 0.3, inputAY), paint);
    canvas.drawLine(Offset(0, inputBY), Offset(width * 0.3, inputBY), paint);

    // Gate body
    final path = Path();
    path.moveTo(width * 0.3, centerY - 30);
    path.lineTo(width * 0.55, centerY - 30);
    path.arcToPoint(
      Offset(width * 0.55, centerY + 30),
      radius: Radius.circular(30),
      clockwise: true,
    );
    path.lineTo(width * 0.3, centerY + 30);
    path.close();

    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, paint);

    // Output line
    canvas.drawLine(
      Offset(width * 0.55, centerY),
      Offset(width, centerY),
      paint,
    );
  }

  void _drawOrGate(Canvas canvas, Size size, Paint paint, Paint fillPaint) {
    final width = size.width;
    final height = size.height;
    final centerY = height / 2;

    // Input lines
    final inputAY = centerY - 20;
    final inputBY = centerY + 20;
    canvas.drawLine(Offset(0, inputAY), Offset(width * 0.25, inputAY), paint);
    canvas.drawLine(Offset(0, inputBY), Offset(width * 0.25, inputBY), paint);

    // Gate body
    final path = Path();
    // Back curve
    path.moveTo(width * 0.25, centerY - 30);
    path.quadraticBezierTo(width * 0.35, centerY, width * 0.25, centerY + 30);
    // Front curve
    path.quadraticBezierTo(width * 0.4, centerY + 30, width * 0.6, centerY);
    path.quadraticBezierTo(
      width * 0.4,
      centerY - 30,
      width * 0.25,
      centerY - 30,
    );
    path.close();

    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, paint);

    // Output line
    canvas.drawLine(
      Offset(width * 0.6, centerY),
      Offset(width, centerY),
      paint,
    );
  }

  void _drawNotGate(Canvas canvas, Size size, Paint paint, Paint fillPaint) {
    final width = size.width;
    final height = size.height;
    final centerY = height / 2;

    // Input line
    canvas.drawLine(Offset(0, centerY), Offset(width * 0.25, centerY), paint);

    // Triangle
    final path = Path();
    path.moveTo(width * 0.25, centerY - 30);
    path.lineTo(width * 0.55, centerY);
    path.lineTo(width * 0.25, centerY + 30);
    path.close();

    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, paint);

    // Inversion circle
    canvas.drawCircle(Offset(width * 0.6, centerY), 5, fillPaint);
    canvas.drawCircle(Offset(width * 0.6, centerY), 5, paint);

    // Output line
    canvas.drawLine(
      Offset(width * 0.65, centerY),
      Offset(width, centerY),
      paint,
    );
  }

  void _drawNandGate(Canvas canvas, Size size, Paint paint, Paint fillPaint) {
    final width = size.width;
    final height = size.height;
    final centerY = height / 2;

    // Input lines
    final inputAY = centerY - 20;
    final inputBY = centerY + 20;
    canvas.drawLine(Offset(0, inputAY), Offset(width * 0.3, inputAY), paint);
    canvas.drawLine(Offset(0, inputBY), Offset(width * 0.3, inputBY), paint);

    // Gate body (AND shape)
    final path = Path();
    path.moveTo(width * 0.3, centerY - 30);
    path.lineTo(width * 0.5, centerY - 30);
    path.arcToPoint(
      Offset(width * 0.5, centerY + 30),
      radius: Radius.circular(30),
      clockwise: true,
    );
    path.lineTo(width * 0.3, centerY + 30);
    path.close();

    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, paint);

    // Inversion circle
    canvas.drawCircle(Offset(width * 0.55, centerY), 5, fillPaint);
    canvas.drawCircle(Offset(width * 0.55, centerY), 5, paint);

    // Output line
    canvas.drawLine(
      Offset(width * 0.6, centerY),
      Offset(width, centerY),
      paint,
    );
  }

  void _drawNorGate(Canvas canvas, Size size, Paint paint, Paint fillPaint) {
    final width = size.width;
    final height = size.height;
    final centerY = height / 2;

    // Input lines
    final inputAY = centerY - 20;
    final inputBY = centerY + 20;
    canvas.drawLine(Offset(0, inputAY), Offset(width * 0.25, inputAY), paint);
    canvas.drawLine(Offset(0, inputBY), Offset(width * 0.25, inputBY), paint);

    // Gate body (OR shape)
    final path = Path();
    // Back curve
    path.moveTo(width * 0.25, centerY - 30);
    path.quadraticBezierTo(width * 0.35, centerY, width * 0.25, centerY + 30);
    // Front curve
    path.quadraticBezierTo(width * 0.35, centerY + 30, width * 0.5, centerY);
    path.quadraticBezierTo(
      width * 0.35,
      centerY - 30,
      width * 0.25,
      centerY - 30,
    );
    path.close();

    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, paint);

    // Inversion circle
    canvas.drawCircle(Offset(width * 0.55, centerY), 5, fillPaint);
    canvas.drawCircle(Offset(width * 0.55, centerY), 5, paint);

    // Output line
    canvas.drawLine(
      Offset(width * 0.6, centerY),
      Offset(width, centerY),
      paint,
    );
  }

  void _drawXorGate(Canvas canvas, Size size, Paint paint, Paint fillPaint) {
    final width = size.width;
    final height = size.height;
    final centerY = height / 2;

    // Input lines
    final inputAY = centerY - 20;
    final inputBY = centerY + 20;
    canvas.drawLine(Offset(0, inputAY), Offset(width * 0.2, inputAY), paint);
    canvas.drawLine(Offset(0, inputBY), Offset(width * 0.2, inputBY), paint);

    // Extra curved line before the gate (characteristic of XOR)
    final extraCurve = Path();
    extraCurve.moveTo(width * 0.2, centerY - 30);
    extraCurve.quadraticBezierTo(
      width * 0.3,
      centerY,
      width * 0.2,
      centerY + 30,
    );
    canvas.drawPath(extraCurve, paint);

    // Gate body (OR shape)
    final path = Path();
    // Back curve
    path.moveTo(width * 0.3, centerY - 30);
    path.quadraticBezierTo(width * 0.4, centerY, width * 0.3, centerY + 30);
    // Front curve
    path.quadraticBezierTo(width * 0.45, centerY + 30, width * 0.65, centerY);
    path.quadraticBezierTo(
      width * 0.45,
      centerY - 30,
      width * 0.3,
      centerY - 30,
    );
    path.close();

    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, paint);

    // Output line
    canvas.drawLine(
      Offset(width * 0.65, centerY),
      Offset(width, centerY),
      paint,
    );
  }

  void _drawXnorGate(Canvas canvas, Size size, Paint paint, Paint fillPaint) {
    final width = size.width;
    final height = size.height;
    final centerY = height / 2;

    // Input lines
    final inputAY = centerY - 20;
    final inputBY = centerY + 20;
    canvas.drawLine(Offset(0, inputAY), Offset(width * 0.2, inputAY), paint);
    canvas.drawLine(Offset(0, inputBY), Offset(width * 0.2, inputBY), paint);

    // Extra curved line before the gate (characteristic of XOR)
    final extraCurve = Path();
    extraCurve.moveTo(width * 0.2, centerY - 30);
    extraCurve.quadraticBezierTo(
      width * 0.3,
      centerY,
      width * 0.2,
      centerY + 30,
    );
    canvas.drawPath(extraCurve, paint);

    // Gate body (OR shape)
    final path = Path();
    // Back curve
    path.moveTo(width * 0.3, centerY - 30);
    path.quadraticBezierTo(width * 0.4, centerY, width * 0.3, centerY + 30);
    // Front curve
    path.quadraticBezierTo(width * 0.4, centerY + 30, width * 0.55, centerY);
    path.quadraticBezierTo(
      width * 0.4,
      centerY - 30,
      width * 0.3,
      centerY - 30,
    );
    path.close();

    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, paint);

    // Inversion circle
    canvas.drawCircle(Offset(width * 0.6, centerY), 5, fillPaint);
    canvas.drawCircle(Offset(width * 0.6, centerY), 5, paint);

    // Output line
    canvas.drawLine(
      Offset(width * 0.65, centerY),
      Offset(width, centerY),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant GatePainter oldDelegate) {
    return oldDelegate.gateType != gateType ||
        oldDelegate.lineColor != lineColor;
  }
}
