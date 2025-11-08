import 'package:digital_logic_playground/domain/entities/gate_type.dart';
import 'package:digital_logic_playground/domain/usecases/calculate_gate_output.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CalculateGateOutput calculateGateOutput;

  setUp(() {
    calculateGateOutput = CalculateGateOutput();
  });

  group('CalculateGateOutput - AND Gate', () {
    test('should return false when both inputs are false', () {
      // Arrange
      const type = GateType.and;
      const inputA = false;
      const inputB = false;

      // Act
      final result = calculateGateOutput(type, inputA, inputB);

      // Assert
      expect(result, false);
    });

    test('should return false when A is false and B is true', () {
      final result = calculateGateOutput(GateType.and, false, true);
      expect(result, false);
    });

    test('should return false when A is true and B is false', () {
      final result = calculateGateOutput(GateType.and, true, false);
      expect(result, false);
    });

    test('should return true when both inputs are true', () {
      final result = calculateGateOutput(GateType.and, true, true);
      expect(result, true);
    });
  });

  group('CalculateGateOutput - OR Gate', () {
    test('should return false when both inputs are false', () {
      final result = calculateGateOutput(GateType.or, false, false);
      expect(result, false);
    });

    test('should return true when A is false and B is true', () {
      final result = calculateGateOutput(GateType.or, false, true);
      expect(result, true);
    });

    test('should return true when A is true and B is false', () {
      final result = calculateGateOutput(GateType.or, true, false);
      expect(result, true);
    });

    test('should return true when both inputs are true', () {
      final result = calculateGateOutput(GateType.or, true, true);
      expect(result, true);
    });
  });

  group('CalculateGateOutput - NOT Gate', () {
    test('should return true when A is false', () {
      final result = calculateGateOutput(GateType.not, false, false);
      expect(result, true);
    });

    test('should return false when A is true', () {
      final result = calculateGateOutput(GateType.not, true, false);
      expect(result, false);
    });

    test('should ignore input B', () {
      final resultWithBFalse = calculateGateOutput(GateType.not, false, false);
      final resultWithBTrue = calculateGateOutput(GateType.not, false, true);
      expect(resultWithBFalse, resultWithBTrue);
    });
  });

  group('CalculateGateOutput - NAND Gate', () {
    test('should return true when both inputs are false', () {
      final result = calculateGateOutput(GateType.nand, false, false);
      expect(result, true);
    });

    test('should return true when A is false and B is true', () {
      final result = calculateGateOutput(GateType.nand, false, true);
      expect(result, true);
    });

    test('should return true when A is true and B is false', () {
      final result = calculateGateOutput(GateType.nand, true, false);
      expect(result, true);
    });

    test('should return false when both inputs are true', () {
      final result = calculateGateOutput(GateType.nand, true, true);
      expect(result, false);
    });
  });

  group('CalculateGateOutput - NOR Gate', () {
    test('should return true when both inputs are false', () {
      final result = calculateGateOutput(GateType.nor, false, false);
      expect(result, true);
    });

    test('should return false when A is false and B is true', () {
      final result = calculateGateOutput(GateType.nor, false, true);
      expect(result, false);
    });

    test('should return false when A is true and B is false', () {
      final result = calculateGateOutput(GateType.nor, true, false);
      expect(result, false);
    });

    test('should return false when both inputs are true', () {
      final result = calculateGateOutput(GateType.nor, true, true);
      expect(result, false);
    });
  });

  group('CalculateGateOutput - XOR Gate', () {
    test('should return false when both inputs are false', () {
      final result = calculateGateOutput(GateType.xor, false, false);
      expect(result, false);
    });

    test('should return true when A is false and B is true', () {
      final result = calculateGateOutput(GateType.xor, false, true);
      expect(result, true);
    });

    test('should return true when A is true and B is false', () {
      final result = calculateGateOutput(GateType.xor, true, false);
      expect(result, true);
    });

    test('should return false when both inputs are true', () {
      final result = calculateGateOutput(GateType.xor, true, true);
      expect(result, false);
    });
  });

  group('CalculateGateOutput - XNOR Gate', () {
    test('should return true when both inputs are false', () {
      final result = calculateGateOutput(GateType.xnor, false, false);
      expect(result, true);
    });

    test('should return false when A is false and B is true', () {
      final result = calculateGateOutput(GateType.xnor, false, true);
      expect(result, false);
    });

    test('should return false when A is true and B is false', () {
      final result = calculateGateOutput(GateType.xnor, true, false);
      expect(result, false);
    });

    test('should return true when both inputs are true', () {
      final result = calculateGateOutput(GateType.xnor, true, true);
      expect(result, true);
    });
  });
}
