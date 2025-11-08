import 'package:digital_logic_playground/domain/entities/gate_type.dart';
import 'package:digital_logic_playground/domain/usecases/calculate_gate_output.dart';
import 'package:digital_logic_playground/domain/usecases/get_truth_table.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late GetTruthTable getTruthTable;
  late CalculateGateOutput calculateGateOutput;

  setUp(() {
    calculateGateOutput = CalculateGateOutput();
    getTruthTable = GetTruthTable(calculateGateOutput);
  });

  group('GetTruthTable', () {
    test('should return 4 rows for any gate type', () {
      for (final gateType in GateType.values) {
        final result = getTruthTable(gateType);
        expect(result.length, 4);
      }
    });

    test('should generate correct truth table for AND gate', () {
      // Act
      final result = getTruthTable(GateType.and);

      // Assert
      expect(result, [
        {'A': false, 'B': false, 'OUT': false},
        {'A': false, 'B': true, 'OUT': false},
        {'A': true, 'B': false, 'OUT': false},
        {'A': true, 'B': true, 'OUT': true},
      ]);
    });

    test('should generate correct truth table for OR gate', () {
      final result = getTruthTable(GateType.or);

      expect(result, [
        {'A': false, 'B': false, 'OUT': false},
        {'A': false, 'B': true, 'OUT': true},
        {'A': true, 'B': false, 'OUT': true},
        {'A': true, 'B': true, 'OUT': true},
      ]);
    });

    test('should generate correct truth table for NOT gate', () {
      final result = getTruthTable(GateType.not);

      expect(result, [
        {'A': false, 'B': false, 'OUT': true},
        {'A': false, 'B': true, 'OUT': true},
        {'A': true, 'B': false, 'OUT': false},
        {'A': true, 'B': true, 'OUT': false},
      ]);
    });

    test('should generate correct truth table for NAND gate', () {
      final result = getTruthTable(GateType.nand);

      expect(result, [
        {'A': false, 'B': false, 'OUT': true},
        {'A': false, 'B': true, 'OUT': true},
        {'A': true, 'B': false, 'OUT': true},
        {'A': true, 'B': true, 'OUT': false},
      ]);
    });

    test('should generate correct truth table for NOR gate', () {
      final result = getTruthTable(GateType.nor);

      expect(result, [
        {'A': false, 'B': false, 'OUT': true},
        {'A': false, 'B': true, 'OUT': false},
        {'A': true, 'B': false, 'OUT': false},
        {'A': true, 'B': true, 'OUT': false},
      ]);
    });

    test('should generate correct truth table for XOR gate', () {
      final result = getTruthTable(GateType.xor);

      expect(result, [
        {'A': false, 'B': false, 'OUT': false},
        {'A': false, 'B': true, 'OUT': true},
        {'A': true, 'B': false, 'OUT': true},
        {'A': true, 'B': true, 'OUT': false},
      ]);
    });

    test('should generate correct truth table for XNOR gate', () {
      final result = getTruthTable(GateType.xnor);

      expect(result, [
        {'A': false, 'B': false, 'OUT': true},
        {'A': false, 'B': true, 'OUT': false},
        {'A': true, 'B': false, 'OUT': false},
        {'A': true, 'B': true, 'OUT': true},
      ]);
    });

    test('each row should have A, B, and OUT keys', () {
      final result = getTruthTable(GateType.and);

      for (final row in result) {
        expect(row.keys, containsAll(['A', 'B', 'OUT']));
        expect(row.keys.length, 3);
      }
    });

    test('should cover all possible input combinations', () {
      final result = getTruthTable(GateType.and);

      // Extract input combinations
      final combinations = result.map((row) => [row['A'], row['B']]).toList();

      expect(combinations, containsAll([
        [false, false],
        [false, true],
        [true, false],
        [true, true],
      ]));
    });
  });
}
