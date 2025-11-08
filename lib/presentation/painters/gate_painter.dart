import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../domain/entities/gate_type.dart';

class GatePainter extends CustomPainter {
  final GateType gateType;
  final Color lineColor;
  final Color glowColor;
  final bool inputA;
  final bool inputB;
  final bool output;

  GatePainter({
    required this.gateType,
    this.lineColor = const Color(0xFF00C6AE), // Neon teal/cyan
    this.glowColor = const Color(0xFF00FFFF), // Electric cyan glow
    this.inputA = false,
    this.inputB = false,
    this.output = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Subtle glow effect for depth only
    final glowPaint = Paint()
      ..color = glowColor.withValues(alpha: 0.05)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3);

    // Main line paint
    final neonPaint = Paint()
      ..color = lineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    // Helper function to create connection paints based on state
    Paint getConnectionPaint(bool isActive) {
      return Paint()
        ..color = isActive ? AppTheme.primaryColor : AppTheme.inputOffColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.5
        ..strokeCap = StrokeCap.round;
    }

    Paint getDotPaint(bool isActive) {
      return Paint()
        ..color = isActive ? AppTheme.neonCyan : AppTheme.inputOffColor
        ..style = PaintingStyle.fill;
    }

    Paint getDotGlowPaint(bool isActive) {
      return Paint()
        ..color = isActive
            ? AppTheme.neonCyan.withValues(alpha: 0.4)
            : AppTheme.inputOffColor.withValues(alpha: 0.2)
        ..style = PaintingStyle.fill
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, isActive ? 6 : 3);
    }

    switch (gateType) {
      case GateType.and:
        _drawAndGate(
          canvas,
          size,
          glowPaint,
          neonPaint,
          getConnectionPaint,
          getDotPaint,
          getDotGlowPaint,
        );
        break;
      case GateType.or:
        _drawOrGate(
          canvas,
          size,
          glowPaint,
          neonPaint,
          getConnectionPaint,
          getDotPaint,
          getDotGlowPaint,
        );
        break;
      case GateType.not:
        _drawNotGate(
          canvas,
          size,
          glowPaint,
          neonPaint,
          getConnectionPaint,
          getDotPaint,
          getDotGlowPaint,
        );
        break;
      case GateType.nand:
        _drawNandGate(
          canvas,
          size,
          glowPaint,
          neonPaint,
          getConnectionPaint,
          getDotPaint,
          getDotGlowPaint,
        );
        break;
      case GateType.nor:
        _drawNorGate(
          canvas,
          size,
          glowPaint,
          neonPaint,
          getConnectionPaint,
          getDotPaint,
          getDotGlowPaint,
        );
        break;
      case GateType.xor:
        _drawXorGate(
          canvas,
          size,
          glowPaint,
          neonPaint,
          getConnectionPaint,
          getDotPaint,
          getDotGlowPaint,
        );
        break;
      case GateType.xnor:
        _drawXnorGate(
          canvas,
          size,
          glowPaint,
          neonPaint,
          getConnectionPaint,
          getDotPaint,
          getDotGlowPaint,
        );
        break;
    }
  }

  void _drawAndGate(
    Canvas canvas,
    Size size,
    Paint glow,
    Paint neon,
    Paint Function(bool) getConnection,
    Paint Function(bool) getDot,
    Paint Function(bool) getDotGlow,
  ) {
    final width = size.width;
    final height = size.height;
    final centerY = height / 2;

    // Input lines and dots
    final inputAY = centerY - 20;
    final inputBY = centerY + 20;

    // Draw input connection lines
    canvas.drawLine(
      Offset(0, inputAY),
      Offset(width * 0.3, inputAY),
      getConnection(inputA),
    );
    canvas.drawLine(
      Offset(0, inputBY),
      Offset(width * 0.3, inputBY),
      getConnection(inputB),
    );

    // Draw input dots with glow
    canvas.drawCircle(Offset(0, inputAY), 4, getDotGlow(inputA));
    canvas.drawCircle(Offset(0, inputAY), 3, getDot(inputA));
    canvas.drawCircle(Offset(0, inputBY), 4, getDotGlow(inputB));
    canvas.drawCircle(Offset(0, inputBY), 3, getDot(inputB));

    // Gate body path
    final path = Path();
    path.moveTo(width * 0.3, centerY - 30);
    path.lineTo(width * 0.55, centerY - 30);
    path.arcToPoint(
      Offset(width * 0.55, centerY + 30),
      radius: const Radius.circular(30),
      clockwise: true,
    );
    path.lineTo(width * 0.3, centerY + 30);
    path.lineTo(width * 0.3, centerY - 30);

    // Draw subtle glow and main path
    canvas.drawPath(path, glow);
    canvas.drawPath(path, neon);

    // Output line
    canvas.drawLine(
      Offset(width * 0.55, centerY),
      Offset(width, centerY),
      getConnection(output),
    );

    // Output dot with glow
    canvas.drawCircle(Offset(width, centerY), 4, getDotGlow(output));
    canvas.drawCircle(Offset(width, centerY), 3, getDot(output));
  }

  void _drawOrGate(
    Canvas canvas,
    Size size,
    Paint glow,
    Paint neon,
    Paint Function(bool) getConnection,
    Paint Function(bool) getDot,
    Paint Function(bool) getDotGlow,
  ) {
    final width = size.width;
    final height = size.height;
    final centerY = height / 2;

    final inputAY = centerY - 20;
    final inputBY = centerY + 20;

    canvas.drawLine(
      Offset(0, inputAY),
      Offset(width * 0.25, inputAY),
      getConnection(inputA),
    );
    canvas.drawLine(
      Offset(0, inputBY),
      Offset(width * 0.25, inputBY),
      getConnection(inputB),
    );

    canvas.drawCircle(Offset(0, inputAY), 4, getDotGlow(inputA));
    canvas.drawCircle(Offset(0, inputAY), 3, getDot(inputA));
    canvas.drawCircle(Offset(0, inputBY), 4, getDotGlow(inputB));
    canvas.drawCircle(Offset(0, inputBY), 3, getDot(inputB));

    final path = Path();
    path.moveTo(width * 0.25, centerY - 30);
    path.quadraticBezierTo(width * 0.35, centerY, width * 0.25, centerY + 30);
    path.quadraticBezierTo(width * 0.4, centerY + 30, width * 0.6, centerY);
    path.quadraticBezierTo(
      width * 0.4,
      centerY - 30,
      width * 0.25,
      centerY - 30,
    );

    canvas.drawPath(path, glow);
    canvas.drawPath(path, neon);

    canvas.drawLine(
      Offset(width * 0.6, centerY),
      Offset(width, centerY),
      getConnection(output),
    );
    canvas.drawCircle(Offset(width, centerY), 4, getDotGlow(output));
    canvas.drawCircle(Offset(width, centerY), 3, getDot(output));
  }

  void _drawNotGate(
    Canvas canvas,
    Size size,
    Paint glow,
    Paint neon,
    Paint Function(bool) getConnection,
    Paint Function(bool) getDot,
    Paint Function(bool) getDotGlow,
  ) {
    final width = size.width;
    final height = size.height;
    final centerY = height / 2;

    canvas.drawLine(
      Offset(0, centerY),
      Offset(width * 0.25, centerY),
      getConnection(inputA),
    );
    canvas.drawCircle(Offset(0, centerY), 4, getDotGlow(inputA));
    canvas.drawCircle(Offset(0, centerY), 3, getDot(inputA));

    final path = Path();
    path.moveTo(width * 0.25, centerY - 30);
    path.lineTo(width * 0.55, centerY);
    path.lineTo(width * 0.25, centerY + 30);
    path.lineTo(width * 0.25, centerY - 30);

    canvas.drawPath(path, glow);
    canvas.drawPath(path, neon);

    // Inversion circle with subtle glow
    canvas.drawCircle(Offset(width * 0.6, centerY), 6, glow);
    canvas.drawCircle(Offset(width * 0.6, centerY), 5, neon);

    canvas.drawLine(
      Offset(width * 0.65, centerY),
      Offset(width, centerY),
      getConnection(output),
    );
    canvas.drawCircle(Offset(width, centerY), 4, getDotGlow(output));
    canvas.drawCircle(Offset(width, centerY), 3, getDot(output));
  }

  void _drawNandGate(
    Canvas canvas,
    Size size,
    Paint glow,
    Paint neon,
    Paint Function(bool) getConnection,
    Paint Function(bool) getDot,
    Paint Function(bool) getDotGlow,
  ) {
    final width = size.width;
    final height = size.height;
    final centerY = height / 2;

    final inputAY = centerY - 20;
    final inputBY = centerY + 20;

    canvas.drawLine(
      Offset(0, inputAY),
      Offset(width * 0.3, inputAY),
      getConnection(inputA),
    );
    canvas.drawLine(
      Offset(0, inputBY),
      Offset(width * 0.3, inputBY),
      getConnection(inputB),
    );

    canvas.drawCircle(Offset(0, inputAY), 4, getDotGlow(inputA));
    canvas.drawCircle(Offset(0, inputAY), 3, getDot(inputA));
    canvas.drawCircle(Offset(0, inputBY), 4, getDotGlow(inputB));
    canvas.drawCircle(Offset(0, inputBY), 3, getDot(inputB));

    final path = Path();
    path.moveTo(width * 0.3, centerY - 30);
    path.lineTo(width * 0.5, centerY - 30);
    path.arcToPoint(
      Offset(width * 0.5, centerY + 30),
      radius: const Radius.circular(30),
      clockwise: true,
    );
    path.lineTo(width * 0.3, centerY + 30);
    path.lineTo(width * 0.3, centerY - 30);

    canvas.drawPath(path, glow);
    canvas.drawPath(path, neon);

    // Inversion circle with subtle glow
    canvas.drawCircle(Offset(width * 0.55, centerY), 6, glow);
    canvas.drawCircle(Offset(width * 0.55, centerY), 5, neon);

    canvas.drawLine(
      Offset(width * 0.6, centerY),
      Offset(width, centerY),
      getConnection(output),
    );
    canvas.drawCircle(Offset(width, centerY), 4, getDotGlow(output));
    canvas.drawCircle(Offset(width, centerY), 3, getDot(output));
  }

  void _drawNorGate(
    Canvas canvas,
    Size size,
    Paint glow,
    Paint neon,
    Paint Function(bool) getConnection,
    Paint Function(bool) getDot,
    Paint Function(bool) getDotGlow,
  ) {
    final width = size.width;
    final height = size.height;
    final centerY = height / 2;

    final inputAY = centerY - 20;
    final inputBY = centerY + 20;

    canvas.drawLine(
      Offset(0, inputAY),
      Offset(width * 0.25, inputAY),
      getConnection(inputA),
    );
    canvas.drawLine(
      Offset(0, inputBY),
      Offset(width * 0.25, inputBY),
      getConnection(inputB),
    );

    canvas.drawCircle(Offset(0, inputAY), 4, getDotGlow(inputA));
    canvas.drawCircle(Offset(0, inputAY), 3, getDot(inputA));
    canvas.drawCircle(Offset(0, inputBY), 4, getDotGlow(inputB));
    canvas.drawCircle(Offset(0, inputBY), 3, getDot(inputB));

    final path = Path();
    path.moveTo(width * 0.25, centerY - 30);
    path.quadraticBezierTo(width * 0.35, centerY, width * 0.25, centerY + 30);
    path.quadraticBezierTo(width * 0.35, centerY + 30, width * 0.5, centerY);
    path.quadraticBezierTo(
      width * 0.35,
      centerY - 30,
      width * 0.25,
      centerY - 30,
    );

    canvas.drawPath(path, glow);
    canvas.drawPath(path, neon);

    // Inversion circle with subtle glow
    canvas.drawCircle(Offset(width * 0.55, centerY), 6, glow);
    canvas.drawCircle(Offset(width * 0.55, centerY), 5, neon);

    canvas.drawLine(
      Offset(width * 0.6, centerY),
      Offset(width, centerY),
      getConnection(output),
    );
    canvas.drawCircle(Offset(width, centerY), 4, getDotGlow(output));
    canvas.drawCircle(Offset(width, centerY), 3, getDot(output));
  }

  void _drawXorGate(
    Canvas canvas,
    Size size,
    Paint glow,
    Paint neon,
    Paint Function(bool) getConnection,
    Paint Function(bool) getDot,
    Paint Function(bool) getDotGlow,
  ) {
    final width = size.width;
    final height = size.height;
    final centerY = height / 2;

    final inputAY = centerY - 20;
    final inputBY = centerY + 20;

    canvas.drawLine(
      Offset(0, inputAY),
      Offset(width * 0.2, inputAY),
      getConnection(inputA),
    );
    canvas.drawLine(
      Offset(0, inputBY),
      Offset(width * 0.2, inputBY),
      getConnection(inputB),
    );

    canvas.drawCircle(Offset(0, inputAY), 4, getDotGlow(inputA));
    canvas.drawCircle(Offset(0, inputAY), 3, getDot(inputA));
    canvas.drawCircle(Offset(0, inputBY), 4, getDotGlow(inputB));
    canvas.drawCircle(Offset(0, inputBY), 3, getDot(inputB));

    // Extra curved line
    final extraCurve = Path();
    extraCurve.moveTo(width * 0.2, centerY - 30);
    extraCurve.quadraticBezierTo(
      width * 0.3,
      centerY,
      width * 0.2,
      centerY + 30,
    );

    canvas.drawPath(extraCurve, glow);
    canvas.drawPath(extraCurve, neon);

    final path = Path();
    path.moveTo(width * 0.3, centerY - 30);
    path.quadraticBezierTo(width * 0.4, centerY, width * 0.3, centerY + 30);
    path.quadraticBezierTo(width * 0.45, centerY + 30, width * 0.65, centerY);
    path.quadraticBezierTo(
      width * 0.45,
      centerY - 30,
      width * 0.3,
      centerY - 30,
    );

    canvas.drawPath(path, glow);
    canvas.drawPath(path, neon);

    canvas.drawLine(
      Offset(width * 0.65, centerY),
      Offset(width, centerY),
      getConnection(output),
    );
    canvas.drawCircle(Offset(width, centerY), 4, getDotGlow(output));
    canvas.drawCircle(Offset(width, centerY), 3, getDot(output));
  }

  void _drawXnorGate(
    Canvas canvas,
    Size size,
    Paint glow,
    Paint neon,
    Paint Function(bool) getConnection,
    Paint Function(bool) getDot,
    Paint Function(bool) getDotGlow,
  ) {
    final width = size.width;
    final height = size.height;
    final centerY = height / 2;

    final inputAY = centerY - 20;
    final inputBY = centerY + 20;

    canvas.drawLine(
      Offset(0, inputAY),
      Offset(width * 0.2, inputAY),
      getConnection(inputA),
    );
    canvas.drawLine(
      Offset(0, inputBY),
      Offset(width * 0.2, inputBY),
      getConnection(inputB),
    );

    canvas.drawCircle(Offset(0, inputAY), 4, getDotGlow(inputA));
    canvas.drawCircle(Offset(0, inputAY), 3, getDot(inputA));
    canvas.drawCircle(Offset(0, inputBY), 4, getDotGlow(inputB));
    canvas.drawCircle(Offset(0, inputBY), 3, getDot(inputB));

    // Extra curved line
    final extraCurve = Path();
    extraCurve.moveTo(width * 0.2, centerY - 30);
    extraCurve.quadraticBezierTo(
      width * 0.3,
      centerY,
      width * 0.2,
      centerY + 30,
    );

    canvas.drawPath(extraCurve, glow);
    canvas.drawPath(extraCurve, neon);

    final path = Path();
    path.moveTo(width * 0.3, centerY - 30);
    path.quadraticBezierTo(width * 0.4, centerY, width * 0.3, centerY + 30);
    path.quadraticBezierTo(width * 0.4, centerY + 30, width * 0.55, centerY);
    path.quadraticBezierTo(
      width * 0.4,
      centerY - 30,
      width * 0.3,
      centerY - 30,
    );

    canvas.drawPath(path, glow);
    canvas.drawPath(path, neon);

    // Inversion circle with subtle glow
    canvas.drawCircle(Offset(width * 0.6, centerY), 6, glow);
    canvas.drawCircle(Offset(width * 0.6, centerY), 5, neon);

    canvas.drawLine(
      Offset(width * 0.65, centerY),
      Offset(width, centerY),
      getConnection(output),
    );
    canvas.drawCircle(Offset(width, centerY), 4, getDotGlow(output));
    canvas.drawCircle(Offset(width, centerY), 3, getDot(output));
  }

  @override
  bool shouldRepaint(covariant GatePainter oldDelegate) {
    return oldDelegate.gateType != gateType ||
        oldDelegate.lineColor != lineColor ||
        oldDelegate.inputA != inputA ||
        oldDelegate.inputB != inputB ||
        oldDelegate.output != output;
  }
}
