import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:digital_logic_playground/domain/entities/gate_type.dart';
import 'package:digital_logic_playground/domain/entities/logic_gate.dart';
import 'package:digital_logic_playground/domain/repositories/settings_repository.dart';
import 'package:digital_logic_playground/domain/usecases/calculate_gate_output.dart';
import 'package:digital_logic_playground/presentation/blocs/gate_simulator/gate_simulator_bloc.dart';
import 'package:digital_logic_playground/presentation/blocs/gate_simulator/gate_simulator_event.dart';
import 'package:digital_logic_playground/presentation/blocs/gate_simulator/gate_simulator_state.dart';

class MockSettingsRepository extends Mock implements SettingsRepository {}

void main() {
  late GateSimulatorBloc bloc;
  late CalculateGateOutput calculateGateOutput;
  late MockSettingsRepository mockSettingsRepository;

  setUpAll(() {
    registerFallbackValue(GateType.and);
  });

  setUp(() {
    calculateGateOutput = CalculateGateOutput();
    mockSettingsRepository = MockSettingsRepository();
    bloc = GateSimulatorBloc(
      calculateGateOutput: calculateGateOutput,
      settingsRepository: mockSettingsRepository,
    );
  });

  tearDown(() {
    bloc.close();
  });

  group('GateSimulatorBloc', () {
    test('initial state is GateSimulatorState.initial()', () {
      expect(bloc.state, equals(GateSimulatorState.initial()));
    });

    group('SelectGateType', () {
      blocTest<GateSimulatorBloc, GateSimulatorState>(
        'emits state with AND gate and saves to repository',
        setUp: () {
          when(
            () => mockSettingsRepository.saveLastGateType(any()),
          ).thenAnswer((_) async => {});
        },
        build: () => bloc,
        act: (bloc) => bloc.add(const SelectGateType(GateType.and)),
        expect: () => [
          GateSimulatorState(
            currentGateType: GateType.and,
            currentGate: LogicGate.fromType(GateType.and),
            inputA: false,
            inputB: false,
            output: false,
          ),
        ],
        verify: (_) {
          verify(
            () => mockSettingsRepository.saveLastGateType(GateType.and),
          ).called(1);
        },
      );

      blocTest<GateSimulatorBloc, GateSimulatorState>(
        'emits state with OR gate and calculates correct output',
        setUp: () {
          when(
            () => mockSettingsRepository.saveLastGateType(any()),
          ).thenAnswer((_) async => {});
        },
        build: () => bloc,
        seed: () => GateSimulatorState(
          currentGateType: GateType.and,
          currentGate: LogicGate.fromType(GateType.and),
          inputA: true,
          inputB: false,
          output: false,
        ),
        act: (bloc) => bloc.add(const SelectGateType(GateType.or)),
        expect: () => [
          GateSimulatorState(
            currentGateType: GateType.or,
            currentGate: LogicGate.fromType(GateType.or),
            inputA: true,
            inputB: false,
            output: true, // OR gate with A=true, B=false outputs true
          ),
        ],
      );

      blocTest<GateSimulatorBloc, GateSimulatorState>(
        'emits state with NOT gate',
        setUp: () {
          when(
            () => mockSettingsRepository.saveLastGateType(any()),
          ).thenAnswer((_) async => {});
        },
        build: () => bloc,
        act: (bloc) => bloc.add(const SelectGateType(GateType.not)),
        expect: () => [
          GateSimulatorState(
            currentGateType: GateType.not,
            currentGate: LogicGate.fromType(GateType.not),
            inputA: false,
            inputB: false,
            output: true, // NOT gate with A=false outputs true
          ),
        ],
      );
    });

    group('ToggleInputA', () {
      blocTest<GateSimulatorBloc, GateSimulatorState>(
        'toggles input A from false to true and recalculates output',
        build: () => bloc,
        act: (bloc) => bloc.add(const ToggleInputA()),
        expect: () => [
          GateSimulatorState(
            currentGateType: GateType.and,
            currentGate: LogicGate.fromType(GateType.and),
            inputA: true,
            inputB: false,
            output: false, // AND gate with A=true, B=false outputs false
          ),
        ],
      );

      blocTest<GateSimulatorBloc, GateSimulatorState>(
        'toggles input A from true to false',
        build: () => bloc,
        seed: () => GateSimulatorState(
          currentGateType: GateType.and,
          currentGate: LogicGate.fromType(GateType.and),
          inputA: true,
          inputB: true,
          output: true,
        ),
        act: (bloc) => bloc.add(const ToggleInputA()),
        expect: () => [
          GateSimulatorState(
            currentGateType: GateType.and,
            currentGate: LogicGate.fromType(GateType.and),
            inputA: false,
            inputB: true,
            output: false, // AND gate with A=false, B=true outputs false
          ),
        ],
      );
    });

    group('ToggleInputB', () {
      blocTest<GateSimulatorBloc, GateSimulatorState>(
        'toggles input B from false to true and recalculates output',
        build: () => bloc,
        act: (bloc) => bloc.add(const ToggleInputB()),
        expect: () => [
          GateSimulatorState(
            currentGateType: GateType.and,
            currentGate: LogicGate.fromType(GateType.and),
            inputA: false,
            inputB: true,
            output: false, // AND gate with A=false, B=true outputs false
          ),
        ],
      );

      blocTest<GateSimulatorBloc, GateSimulatorState>(
        'toggles input B from true to false',
        build: () => bloc,
        seed: () => GateSimulatorState(
          currentGateType: GateType.or,
          currentGate: LogicGate.fromType(GateType.or),
          inputA: false,
          inputB: true,
          output: true,
        ),
        act: (bloc) => bloc.add(const ToggleInputB()),
        expect: () => [
          GateSimulatorState(
            currentGateType: GateType.or,
            currentGate: LogicGate.fromType(GateType.or),
            inputA: false,
            inputB: false,
            output: false, // OR gate with A=false, B=false outputs false
          ),
        ],
      );
    });

    group('SetInputA', () {
      blocTest<GateSimulatorBloc, GateSimulatorState>(
        'sets input A to true and recalculates output',
        build: () => bloc,
        act: (bloc) => bloc.add(const SetInputA(true)),
        expect: () => [
          GateSimulatorState(
            currentGateType: GateType.and,
            currentGate: LogicGate.fromType(GateType.and),
            inputA: true,
            inputB: false,
            output: false,
          ),
        ],
      );

      blocTest<GateSimulatorBloc, GateSimulatorState>(
        'sets input A to false',
        build: () => bloc,
        seed: () => GateSimulatorState(
          currentGateType: GateType.not,
          currentGate: LogicGate.fromType(GateType.not),
          inputA: true,
          inputB: false,
          output: false,
        ),
        act: (bloc) => bloc.add(const SetInputA(false)),
        expect: () => [
          GateSimulatorState(
            currentGateType: GateType.not,
            currentGate: LogicGate.fromType(GateType.not),
            inputA: false,
            inputB: false,
            output: true, // NOT gate with A=false outputs true
          ),
        ],
      );
    });

    group('SetInputB', () {
      blocTest<GateSimulatorBloc, GateSimulatorState>(
        'sets input B to true and recalculates output',
        build: () => bloc,
        act: (bloc) => bloc.add(const SetInputB(true)),
        expect: () => [
          GateSimulatorState(
            currentGateType: GateType.and,
            currentGate: LogicGate.fromType(GateType.and),
            inputA: false,
            inputB: true,
            output: false,
          ),
        ],
      );

      blocTest<GateSimulatorBloc, GateSimulatorState>(
        'sets input B to false with XOR gate',
        build: () => bloc,
        seed: () => GateSimulatorState(
          currentGateType: GateType.xor,
          currentGate: LogicGate.fromType(GateType.xor),
          inputA: true,
          inputB: true,
          output: false,
        ),
        act: (bloc) => bloc.add(const SetInputB(false)),
        expect: () => [
          GateSimulatorState(
            currentGateType: GateType.xor,
            currentGate: LogicGate.fromType(GateType.xor),
            inputA: true,
            inputB: false,
            output: true, // XOR gate with A=true, B=false outputs true
          ),
        ],
      );
    });

    group('LoadLastGateType', () {
      blocTest<GateSimulatorBloc, GateSimulatorState>(
        'loads last gate type from repository',
        setUp: () {
          when(
            () => mockSettingsRepository.getLastGateType(),
          ).thenAnswer((_) async => GateType.or);
        },
        build: () => bloc,
        act: (bloc) => bloc.add(const LoadLastGateType()),
        expect: () => [
          GateSimulatorState(
            currentGateType: GateType.or,
            currentGate: LogicGate.fromType(GateType.or),
            inputA: false,
            inputB: false,
            output: false,
          ),
        ],
        verify: (_) {
          verify(() => mockSettingsRepository.getLastGateType()).called(1);
        },
      );

      blocTest<GateSimulatorBloc, GateSimulatorState>(
        'does not change state when repository returns null',
        setUp: () {
          when(
            () => mockSettingsRepository.getLastGateType(),
          ).thenAnswer((_) async => null);
        },
        build: () => bloc,
        act: (bloc) => bloc.add(const LoadLastGateType()),
        expect: () => [],
        verify: (_) {
          verify(() => mockSettingsRepository.getLastGateType()).called(1);
        },
      );

      blocTest<GateSimulatorBloc, GateSimulatorState>(
        'loads NAND gate and preserves current inputs',
        setUp: () {
          when(
            () => mockSettingsRepository.getLastGateType(),
          ).thenAnswer((_) async => GateType.nand);
        },
        build: () => bloc,
        seed: () => GateSimulatorState(
          currentGateType: GateType.and,
          currentGate: LogicGate.fromType(GateType.and),
          inputA: true,
          inputB: true,
          output: true,
        ),
        act: (bloc) => bloc.add(const LoadLastGateType()),
        expect: () => [
          GateSimulatorState(
            currentGateType: GateType.nand,
            currentGate: LogicGate.fromType(GateType.nand),
            inputA: true,
            inputB: true,
            output: false, // NAND gate with A=true, B=true outputs false
          ),
        ],
      );
    });
  });
}
