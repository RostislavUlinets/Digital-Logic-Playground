import '../entities/gate_type.dart';

/// Use case for calculating the output of a logic gate
/// This is pure business logic with no external dependencies
class CalculateGateOutput {
  /// Calculates the output of a gate given its type and inputs
  ///
  /// [type] - The type of logic gate
  /// [inputA] - First input value
  /// [inputB] - Second input value (not used for NOT gate)
  ///
  /// Returns the boolean output based on the gate logic
  bool call(GateType type, bool inputA, bool inputB) {
    switch (type) {
      case GateType.and:
        return inputA && inputB;

      case GateType.or:
        return inputA || inputB;

      case GateType.not:
        return !inputA;

      case GateType.nand:
        return !(inputA && inputB);

      case GateType.nor:
        return !(inputA || inputB);

      case GateType.xor:
        return inputA ^ inputB;

      case GateType.xnor:
        return !(inputA ^ inputB);
    }
  }
}
