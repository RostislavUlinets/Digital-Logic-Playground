import 'package:equatable/equatable.dart';

import '../../../domain/entities/gate_type.dart';

abstract class GateSimulatorEvent extends Equatable {
  const GateSimulatorEvent();

  @override
  List<Object?> get props => [];
}

class SelectGateType extends GateSimulatorEvent {
  final GateType gateType;

  const SelectGateType(this.gateType);

  @override
  List<Object?> get props => [gateType];
}

class ToggleInputA extends GateSimulatorEvent {
  const ToggleInputA();
}

class ToggleInputB extends GateSimulatorEvent {
  const ToggleInputB();
}

class SetInputA extends GateSimulatorEvent {
  final bool value;

  const SetInputA(this.value);

  @override
  List<Object?> get props => [value];
}

class SetInputB extends GateSimulatorEvent {
  final bool value;

  const SetInputB(this.value);

  @override
  List<Object?> get props => [value];
}

class LoadLastGateType extends GateSimulatorEvent {
  const LoadLastGateType();
}
