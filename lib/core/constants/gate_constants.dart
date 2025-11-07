import '../../domain/entities/gate_type.dart';
import '../../domain/entities/logic_gate.dart';

/// Constants and metadata for all logic gates
class GateConstants {
  GateConstants._();

  /// Map of gate types to their metadata
  static final Map<GateType, LogicGate> gates = {
    GateType.and: const LogicGate(
      type: GateType.and,
      name: 'AND Gate',
      formula: 'A · B',
      description: 'Output is 1 only when both inputs are 1',
    ),
    GateType.or: const LogicGate(
      type: GateType.or,
      name: 'OR Gate',
      formula: 'A + B',
      description: 'Output is 1 when at least one input is 1',
    ),
    GateType.not: const LogicGate(
      type: GateType.not,
      name: 'NOT Gate',
      formula: 'A̅',
      description: 'Output is the inverse of input A',
    ),
    GateType.nand: const LogicGate(
      type: GateType.nand,
      name: 'NAND Gate',
      formula: '(A · B)̅',
      description: 'Output is 0 only when both inputs are 1',
    ),
    GateType.nor: const LogicGate(
      type: GateType.nor,
      name: 'NOR Gate',
      formula: '(A + B)̅',
      description: 'Output is 1 only when both inputs are 0',
    ),
    GateType.xor: const LogicGate(
      type: GateType.xor,
      name: 'XOR Gate',
      formula: 'A ⊕ B',
      description: 'Output is 1 when inputs are different',
    ),
    GateType.xnor: const LogicGate(
      type: GateType.xnor,
      name: 'XNOR Gate',
      formula: '(A ⊕ B)̅',
      description: 'Output is 1 when inputs are the same',
    ),
  };

  /// Get gate metadata by type
  static LogicGate getGate(GateType type) {
    return gates[type]!;
  }

  /// Get all available gate types
  static List<GateType> getAllGateTypes() {
    return GateType.values;
  }
}
