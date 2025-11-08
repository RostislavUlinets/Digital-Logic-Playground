import 'package:flutter/material.dart';
import '../../domain/entities/gate_type.dart';
import '../painters/gate_painter.dart';

class GateSymbol extends StatelessWidget {
  final GateType gateType;
  final double? width;
  final double? height;

  const GateSymbol({
    super.key,
    required this.gateType,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    // Make it responsive for mobile - use screen width
    final screenWidth = MediaQuery.of(context).size.width;
    final symbolWidth = width ?? (screenWidth * 0.7).clamp(200.0, 300.0);
    final symbolHeight = height ?? (symbolWidth * 0.6);

    return SizedBox(
      width: symbolWidth,
      height: symbolHeight,
      child: CustomPaint(
        painter: GatePainter(
          gateType: gateType,
          lineColor: const Color(0xFFFF0000),
        ),
      ),
    );
  }
}
