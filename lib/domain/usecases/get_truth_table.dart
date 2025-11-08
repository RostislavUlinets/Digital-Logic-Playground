import '../entities/gate_type.dart';
import 'calculate_gate_output.dart';

/// Use case for generating a complete truth table for a logic gate
class GetTruthTable {
  final CalculateGateOutput _calculateOutput;

  GetTruthTable(this._calculateOutput);

  /// Generates a truth table for the given gate type
  ///
  /// Returns a list of 4 rows, each containing input A, input B, and output values
  /// Format: [{'A': bool, 'B': bool, 'OUT': bool}, ...]
  List<Map<String, bool>> call(GateType type) {
    return [
      {
        'A': false,
        'B': false,
        'OUT': _calculateOutput(type, false, false),
      },
      {
        'A': false,
        'B': true,
        'OUT': _calculateOutput(type, false, true),
      },
      {
        'A': true,
        'B': false,
        'OUT': _calculateOutput(type, true, false),
      },
      {
        'A': true,
        'B': true,
        'OUT': _calculateOutput(type, true, true),
      },
    ];
  }
}
