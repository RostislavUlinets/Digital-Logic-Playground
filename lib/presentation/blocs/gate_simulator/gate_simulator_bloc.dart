import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/logic_gate.dart';
import '../../../domain/repositories/settings_repository.dart';
import '../../../domain/usecases/calculate_gate_output.dart';
import '../../../domain/usecases/get_truth_table.dart';
import 'gate_simulator_event.dart';
import 'gate_simulator_state.dart';

class GateSimulatorBloc extends Bloc<GateSimulatorEvent, GateSimulatorState> {
  final CalculateGateOutput _calculateGateOutput;
  final GetTruthTable _getTruthTable;
  final SettingsRepository _settingsRepository;

  GateSimulatorBloc({
    required CalculateGateOutput calculateGateOutput,
    required GetTruthTable getTruthTable,
    required SettingsRepository settingsRepository,
  }) : _calculateGateOutput = calculateGateOutput,
       _getTruthTable = getTruthTable,
       _settingsRepository = settingsRepository,
       super(GateSimulatorState.initial()) {
    on<SelectGateType>(_onSelectGateType);
    on<ToggleInputA>(_onToggleInputA);
    on<ToggleInputB>(_onToggleInputB);
    on<SetInputA>(_onSetInputA);
    on<SetInputB>(_onSetInputB);
    on<LoadLastGateType>(_onLoadLastGateType);
  }

  Future<void> _onSelectGateType(
    SelectGateType event,
    Emitter<GateSimulatorState> emit,
  ) async {
    final newGate = LogicGate.fromType(event.gateType);
    final output = _calculateGateOutput(
      event.gateType,
      state.inputA,
      state.inputB,
    );
    final truthTable = _getTruthTable(event.gateType);

    emit(
      state.copyWith(
        currentGateType: event.gateType,
        currentGate: newGate,
        output: output,
        truthTable: truthTable,
      ),
    );

    // Save the selected gate type
    await _settingsRepository.saveLastGateType(event.gateType);
  }

  void _onToggleInputA(ToggleInputA event, Emitter<GateSimulatorState> emit) {
    final newInputA = !state.inputA;
    final output = _calculateGateOutput(
      state.currentGateType,
      newInputA,
      state.inputB,
    );

    emit(state.copyWith(inputA: newInputA, output: output));
  }

  void _onToggleInputB(ToggleInputB event, Emitter<GateSimulatorState> emit) {
    final newInputB = !state.inputB;
    final output = _calculateGateOutput(
      state.currentGateType,
      state.inputA,
      newInputB,
    );

    emit(state.copyWith(inputB: newInputB, output: output));
  }

  void _onSetInputA(SetInputA event, Emitter<GateSimulatorState> emit) {
    final output = _calculateGateOutput(
      state.currentGateType,
      event.value,
      state.inputB,
    );

    emit(state.copyWith(inputA: event.value, output: output));
  }

  void _onSetInputB(SetInputB event, Emitter<GateSimulatorState> emit) {
    final output = _calculateGateOutput(
      state.currentGateType,
      state.inputA,
      event.value,
    );

    emit(state.copyWith(inputB: event.value, output: output));
  }

  Future<void> _onLoadLastGateType(
    LoadLastGateType event,
    Emitter<GateSimulatorState> emit,
  ) async {
    final lastGateType = await _settingsRepository.getLastGateType();
    if (lastGateType != null) {
      final newGate = LogicGate.fromType(lastGateType);
      final output = _calculateGateOutput(
        lastGateType,
        state.inputA,
        state.inputB,
      );
      final truthTable = _getTruthTable(lastGateType);

      emit(
        state.copyWith(
          currentGateType: lastGateType,
          currentGate: newGate,
          output: output,
          truthTable: truthTable,
        ),
      );
    }
  }
}
