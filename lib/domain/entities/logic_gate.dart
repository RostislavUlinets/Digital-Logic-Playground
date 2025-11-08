import 'package:freezed_annotation/freezed_annotation.dart';
import 'gate_type.dart';

part 'logic_gate.freezed.dart';

/// Represents a logic gate with its properties
@freezed
class LogicGate with _$LogicGate {
  const factory LogicGate({
    required GateType type,
    required String name,
    required String formula,
    required String description,
  }) = _LogicGate;
}
