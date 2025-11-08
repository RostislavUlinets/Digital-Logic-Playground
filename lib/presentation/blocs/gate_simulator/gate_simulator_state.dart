import 'package:equatable/equatable.dart';

import '../../../domain/entities/gate_type.dart';
import '../../../domain/entities/logic_gate.dart';

class GateSimulatorState extends Equatable {
  final GateType currentGateType;
  final LogicGate currentGate;
  final bool inputA;
  final bool inputB;
  final bool output;

  const GateSimulatorState({
    required this.currentGateType,
    required this.currentGate,
    required this.inputA,
    required this.inputB,
    required this.output,
  });

  factory GateSimulatorState.initial() {
    return GateSimulatorState(
      currentGateType: GateType.and,
      currentGate: LogicGate.fromType(GateType.and),
      inputA: false,
      inputB: false,
      output: false,
    );
  }

  GateSimulatorState copyWith({
    GateType? currentGateType,
    LogicGate? currentGate,
    bool? inputA,
    bool? inputB,
    bool? output,
  }) {
    return GateSimulatorState(
      currentGateType: currentGateType ?? this.currentGateType,
      currentGate: currentGate ?? this.currentGate,
      inputA: inputA ?? this.inputA,
      inputB: inputB ?? this.inputB,
      output: output ?? this.output,
    );
  }

  @override
  List<Object?> get props => [
    currentGateType,
    currentGate,
    inputA,
    inputB,
    output,
  ];
}
