import '../../domain/entities/gate_type.dart';
import '../../domain/repositories/settings_repository.dart';
import '../datasources/preferences_local_datasource.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final PreferencesLocalDataSource _dataSource;

  SettingsRepositoryImpl(this._dataSource);

  @override
  Future<GateType?> getLastGateType() async {
    final gateTypeString = await _dataSource.getLastGateType();
    if (gateTypeString == null) return null;

    try {
      return GateType.values.firstWhere(
        (type) => type.toString().split('.').last == gateTypeString,
      );
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> saveLastGateType(GateType gateType) async {
    final gateTypeString = gateType.toString().split('.').last;
    await _dataSource.saveLastGateType(gateTypeString);
  }

  @override
  Future<bool> getDarkMode() async {
    return await _dataSource.getDarkMode();
  }

  @override
  Future<void> setDarkMode(bool enabled) async {
    await _dataSource.setDarkMode(enabled);
  }
}
