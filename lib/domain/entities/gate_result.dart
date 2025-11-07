import 'package:freezed_annotation/freezed_annotation.dart';

part 'gate_result.freezed.dart';

/// Represents the result of a gate calculation with input values
@freezed
class GateResult with _$GateResult {
  const factory GateResult({
    required bool output,
    required bool inputA,
    required bool inputB,
  }) = _GateResult;
}
