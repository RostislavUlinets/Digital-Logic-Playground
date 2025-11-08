import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:digital_logic_playground/data/datasources/preferences_local_datasource.dart';
import 'package:digital_logic_playground/data/repositories/settings_repository_impl.dart';
import 'package:digital_logic_playground/domain/entities/gate_type.dart';

class MockPreferencesLocalDataSource extends Mock
    implements PreferencesLocalDataSource {}

void main() {
  late SettingsRepositoryImpl repository;
  late MockPreferencesLocalDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockPreferencesLocalDataSource();
    repository = SettingsRepositoryImpl(mockDataSource);
  });

  group('SettingsRepositoryImpl', () {
    group('getLastGateType', () {
      test('should return AND gate type when stored value is "and"', () async {
        // Arrange
        when(
          () => mockDataSource.getLastGateType(),
        ).thenAnswer((_) async => 'and');

        // Act
        final result = await repository.getLastGateType();

        // Assert
        expect(result, GateType.and);
        verify(() => mockDataSource.getLastGateType()).called(1);
      });

      test('should return OR gate type when stored value is "or"', () async {
        // Arrange
        when(
          () => mockDataSource.getLastGateType(),
        ).thenAnswer((_) async => 'or');

        // Act
        final result = await repository.getLastGateType();

        // Assert
        expect(result, GateType.or);
        verify(() => mockDataSource.getLastGateType()).called(1);
      });

      test('should return NOT gate type when stored value is "not"', () async {
        // Arrange
        when(
          () => mockDataSource.getLastGateType(),
        ).thenAnswer((_) async => 'not');

        // Act
        final result = await repository.getLastGateType();

        // Assert
        expect(result, GateType.not);
        verify(() => mockDataSource.getLastGateType()).called(1);
      });

      test(
        'should return NAND gate type when stored value is "nand"',
        () async {
          // Arrange
          when(
            () => mockDataSource.getLastGateType(),
          ).thenAnswer((_) async => 'nand');

          // Act
          final result = await repository.getLastGateType();

          // Assert
          expect(result, GateType.nand);
          verify(() => mockDataSource.getLastGateType()).called(1);
        },
      );

      test('should return NOR gate type when stored value is "nor"', () async {
        // Arrange
        when(
          () => mockDataSource.getLastGateType(),
        ).thenAnswer((_) async => 'nor');

        // Act
        final result = await repository.getLastGateType();

        // Assert
        expect(result, GateType.nor);
        verify(() => mockDataSource.getLastGateType()).called(1);
      });

      test('should return XOR gate type when stored value is "xor"', () async {
        // Arrange
        when(
          () => mockDataSource.getLastGateType(),
        ).thenAnswer((_) async => 'xor');

        // Act
        final result = await repository.getLastGateType();

        // Assert
        expect(result, GateType.xor);
        verify(() => mockDataSource.getLastGateType()).called(1);
      });

      test(
        'should return XNOR gate type when stored value is "xnor"',
        () async {
          // Arrange
          when(
            () => mockDataSource.getLastGateType(),
          ).thenAnswer((_) async => 'xnor');

          // Act
          final result = await repository.getLastGateType();

          // Assert
          expect(result, GateType.xnor);
          verify(() => mockDataSource.getLastGateType()).called(1);
        },
      );

      test('should return null when no gate type is stored', () async {
        // Arrange
        when(
          () => mockDataSource.getLastGateType(),
        ).thenAnswer((_) async => null);

        // Act
        final result = await repository.getLastGateType();

        // Assert
        expect(result, null);
        verify(() => mockDataSource.getLastGateType()).called(1);
      });

      test('should return null when stored value is invalid', () async {
        // Arrange
        when(
          () => mockDataSource.getLastGateType(),
        ).thenAnswer((_) async => 'invalid_gate');

        // Act
        final result = await repository.getLastGateType();

        // Assert
        expect(result, null);
        verify(() => mockDataSource.getLastGateType()).called(1);
      });
    });

    group('saveLastGateType', () {
      test('should save AND gate type as "and"', () async {
        // Arrange
        when(
          () => mockDataSource.saveLastGateType(any()),
        ).thenAnswer((_) async => {});

        // Act
        await repository.saveLastGateType(GateType.and);

        // Assert
        verify(() => mockDataSource.saveLastGateType('and')).called(1);
      });

      test('should save OR gate type as "or"', () async {
        // Arrange
        when(
          () => mockDataSource.saveLastGateType(any()),
        ).thenAnswer((_) async => {});

        // Act
        await repository.saveLastGateType(GateType.or);

        // Assert
        verify(() => mockDataSource.saveLastGateType('or')).called(1);
      });

      test('should save NOT gate type as "not"', () async {
        // Arrange
        when(
          () => mockDataSource.saveLastGateType(any()),
        ).thenAnswer((_) async => {});

        // Act
        await repository.saveLastGateType(GateType.not);

        // Assert
        verify(() => mockDataSource.saveLastGateType('not')).called(1);
      });

      test('should save NAND gate type as "nand"', () async {
        // Arrange
        when(
          () => mockDataSource.saveLastGateType(any()),
        ).thenAnswer((_) async => {});

        // Act
        await repository.saveLastGateType(GateType.nand);

        // Assert
        verify(() => mockDataSource.saveLastGateType('nand')).called(1);
      });

      test('should save NOR gate type as "nor"', () async {
        // Arrange
        when(
          () => mockDataSource.saveLastGateType(any()),
        ).thenAnswer((_) async => {});

        // Act
        await repository.saveLastGateType(GateType.nor);

        // Assert
        verify(() => mockDataSource.saveLastGateType('nor')).called(1);
      });

      test('should save XOR gate type as "xor"', () async {
        // Arrange
        when(
          () => mockDataSource.saveLastGateType(any()),
        ).thenAnswer((_) async => {});

        // Act
        await repository.saveLastGateType(GateType.xor);

        // Assert
        verify(() => mockDataSource.saveLastGateType('xor')).called(1);
      });

      test('should save XNOR gate type as "xnor"', () async {
        // Arrange
        when(
          () => mockDataSource.saveLastGateType(any()),
        ).thenAnswer((_) async => {});

        // Act
        await repository.saveLastGateType(GateType.xnor);

        // Assert
        verify(() => mockDataSource.saveLastGateType('xnor')).called(1);
      });
    });

    group('getDarkMode', () {
      test('should return true when dark mode is enabled', () async {
        // Arrange
        when(() => mockDataSource.getDarkMode()).thenAnswer((_) async => true);

        // Act
        final result = await repository.getDarkMode();

        // Assert
        expect(result, true);
        verify(() => mockDataSource.getDarkMode()).called(1);
      });

      test('should return false when dark mode is disabled', () async {
        // Arrange
        when(() => mockDataSource.getDarkMode()).thenAnswer((_) async => false);

        // Act
        final result = await repository.getDarkMode();

        // Assert
        expect(result, false);
        verify(() => mockDataSource.getDarkMode()).called(1);
      });
    });

    group('setDarkMode', () {
      test('should enable dark mode', () async {
        // Arrange
        when(
          () => mockDataSource.setDarkMode(any()),
        ).thenAnswer((_) async => {});

        // Act
        await repository.setDarkMode(true);

        // Assert
        verify(() => mockDataSource.setDarkMode(true)).called(1);
      });

      test('should disable dark mode', () async {
        // Arrange
        when(
          () => mockDataSource.setDarkMode(any()),
        ).thenAnswer((_) async => {});

        // Act
        await repository.setDarkMode(false);

        // Assert
        verify(() => mockDataSource.setDarkMode(false)).called(1);
      });
    });
  });
}
