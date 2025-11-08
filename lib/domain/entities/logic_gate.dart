import 'package:freezed_annotation/freezed_annotation.dart';
import 'gate_type.dart';
import '../../core/constants/gate_constants.dart';

part 'logic_gate.freezed.dart';

/// Represents a logic gate with its properties
@freezed
abstract class LogicGate with _$LogicGate {
  const factory LogicGate({
    required GateType type,
    required String name,
    required String formula,
    required String description,
  }) = _LogicGate;

  /// Create a LogicGate from a GateType
  factory LogicGate.fromType(GateType type) {
    return GateConstants.getGate(type);
  }
}
