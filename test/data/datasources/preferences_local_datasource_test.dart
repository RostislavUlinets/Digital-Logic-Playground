import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:digital_logic_playground/data/datasources/preferences_local_datasource.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late PreferencesLocalDataSource dataSource;
  late MockSharedPreferences mockPrefs;

  setUp(() {
    mockPrefs = MockSharedPreferences();
    dataSource = PreferencesLocalDataSource(mockPrefs);
  });

  group('PreferencesLocalDataSource', () {
    group('getLastGateType', () {
      test('should return gate type string when it exists', () async {
        // Arrange
        const testGateType = 'and';
        when(() => mockPrefs.getString(any())).thenReturn(testGateType);

        // Act
        final result = await dataSource.getLastGateType();

        // Assert
        expect(result, testGateType);
        verify(() => mockPrefs.getString('last_gate_type')).called(1);
      });

      test('should return null when gate type does not exist', () async {
        // Arrange
        when(() => mockPrefs.getString(any())).thenReturn(null);

        // Act
        final result = await dataSource.getLastGateType();

        // Assert
        expect(result, null);
        verify(() => mockPrefs.getString('last_gate_type')).called(1);
      });
    });

    group('saveLastGateType', () {
      test('should save gate type string to SharedPreferences', () async {
        // Arrange
        const testGateType = 'or';
        when(
          () => mockPrefs.setString(any(), any()),
        ).thenAnswer((_) async => true);

        // Act
        await dataSource.saveLastGateType(testGateType);

        // Assert
        verify(
          () => mockPrefs.setString('last_gate_type', testGateType),
        ).called(1);
      });
    });

    group('getDarkMode', () {
      test('should return true when dark mode is enabled', () async {
        // Arrange
        when(() => mockPrefs.getBool(any())).thenReturn(true);

        // Act
        final result = await dataSource.getDarkMode();

        // Assert
        expect(result, true);
        verify(() => mockPrefs.getBool('dark_mode')).called(1);
      });

      test('should return false when dark mode is disabled', () async {
        // Arrange
        when(() => mockPrefs.getBool(any())).thenReturn(false);

        // Act
        final result = await dataSource.getDarkMode();

        // Assert
        expect(result, false);
        verify(() => mockPrefs.getBool('dark_mode')).called(1);
      });

      test('should return true as default when dark mode is not set', () async {
        // Arrange
        when(() => mockPrefs.getBool(any())).thenReturn(null);

        // Act
        final result = await dataSource.getDarkMode();

        // Assert
        expect(result, true); // Default is dark mode
        verify(() => mockPrefs.getBool('dark_mode')).called(1);
      });
    });

    group('setDarkMode', () {
      test('should save dark mode enabled to SharedPreferences', () async {
        // Arrange
        when(
          () => mockPrefs.setBool(any(), any()),
        ).thenAnswer((_) async => true);

        // Act
        await dataSource.setDarkMode(true);

        // Assert
        verify(() => mockPrefs.setBool('dark_mode', true)).called(1);
      });

      test('should save dark mode disabled to SharedPreferences', () async {
        // Arrange
        when(
          () => mockPrefs.setBool(any(), any()),
        ).thenAnswer((_) async => true);

        // Act
        await dataSource.setDarkMode(false);

        // Assert
        verify(() => mockPrefs.setBool('dark_mode', false)).called(1);
      });
    });
  });
}
