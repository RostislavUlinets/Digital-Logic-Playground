import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:digital_logic_playground/domain/repositories/settings_repository.dart';
import 'package:digital_logic_playground/presentation/blocs/settings/settings_bloc.dart';
import 'package:digital_logic_playground/presentation/blocs/settings/settings_event.dart';
import 'package:digital_logic_playground/presentation/blocs/settings/settings_state.dart';

class MockSettingsRepository extends Mock implements SettingsRepository {}

void main() {
  late SettingsBloc bloc;
  late MockSettingsRepository mockSettingsRepository;

  setUp(() {
    mockSettingsRepository = MockSettingsRepository();
    bloc = SettingsBloc(settingsRepository: mockSettingsRepository);
  });

  tearDown(() {
    bloc.close();
  });

  group('SettingsBloc', () {
    test('initial state is SettingsState.initial()', () {
      expect(bloc.state, equals(SettingsState.initial()));
      expect(bloc.state.isDarkMode, true);
      expect(bloc.state.isLoading, true);
    });

    group('LoadSettings', () {
      blocTest<SettingsBloc, SettingsState>(
        'emits loading then loaded state with dark mode enabled',
        setUp: () {
          when(
            () => mockSettingsRepository.getDarkMode(),
          ).thenAnswer((_) async => true);
        },
        build: () => bloc,
        act: (bloc) => bloc.add(const LoadSettings()),
        expect: () => [
          const SettingsState(isDarkMode: true, isLoading: true),
          const SettingsState(isDarkMode: true, isLoading: false),
        ],
        verify: (_) {
          verify(() => mockSettingsRepository.getDarkMode()).called(1);
        },
      );

      blocTest<SettingsBloc, SettingsState>(
        'emits loading then loaded state with dark mode disabled',
        setUp: () {
          when(
            () => mockSettingsRepository.getDarkMode(),
          ).thenAnswer((_) async => false);
        },
        build: () => bloc,
        act: (bloc) => bloc.add(const LoadSettings()),
        expect: () => [
          const SettingsState(isDarkMode: true, isLoading: true),
          const SettingsState(isDarkMode: false, isLoading: false),
        ],
        verify: (_) {
          verify(() => mockSettingsRepository.getDarkMode()).called(1);
        },
      );
    });

    group('ToggleDarkMode', () {
      blocTest<SettingsBloc, SettingsState>(
        'toggles dark mode from true to false and saves to repository',
        setUp: () {
          when(
            () => mockSettingsRepository.setDarkMode(any()),
          ).thenAnswer((_) async => {});
        },
        build: () => bloc,
        seed: () => const SettingsState(isDarkMode: true, isLoading: false),
        act: (bloc) => bloc.add(const ToggleDarkMode()),
        expect: () => [
          const SettingsState(isDarkMode: false, isLoading: false),
        ],
        verify: (_) {
          verify(() => mockSettingsRepository.setDarkMode(false)).called(1);
        },
      );

      blocTest<SettingsBloc, SettingsState>(
        'toggles dark mode from false to true and saves to repository',
        setUp: () {
          when(
            () => mockSettingsRepository.setDarkMode(any()),
          ).thenAnswer((_) async => {});
        },
        build: () => bloc,
        seed: () => const SettingsState(isDarkMode: false, isLoading: false),
        act: (bloc) => bloc.add(const ToggleDarkMode()),
        expect: () => [const SettingsState(isDarkMode: true, isLoading: false)],
        verify: (_) {
          verify(() => mockSettingsRepository.setDarkMode(true)).called(1);
        },
      );
    });

    group('SetDarkMode', () {
      blocTest<SettingsBloc, SettingsState>(
        'sets dark mode to true and saves to repository',
        setUp: () {
          when(
            () => mockSettingsRepository.setDarkMode(any()),
          ).thenAnswer((_) async => {});
        },
        build: () => bloc,
        seed: () => const SettingsState(isDarkMode: false, isLoading: false),
        act: (bloc) => bloc.add(const SetDarkMode(true)),
        expect: () => [const SettingsState(isDarkMode: true, isLoading: false)],
        verify: (_) {
          verify(() => mockSettingsRepository.setDarkMode(true)).called(1);
        },
      );

      blocTest<SettingsBloc, SettingsState>(
        'sets dark mode to false and saves to repository',
        setUp: () {
          when(
            () => mockSettingsRepository.setDarkMode(any()),
          ).thenAnswer((_) async => {});
        },
        build: () => bloc,
        seed: () => const SettingsState(isDarkMode: true, isLoading: false),
        act: (bloc) => bloc.add(const SetDarkMode(false)),
        expect: () => [
          const SettingsState(isDarkMode: false, isLoading: false),
        ],
        verify: (_) {
          verify(() => mockSettingsRepository.setDarkMode(false)).called(1);
        },
      );
    });
  });
}
