import '../entities/gate_type.dart';

abstract class SettingsRepository {
  Future<GateType?> getLastGateType();
  Future<void> saveLastGateType(GateType gateType);
  Future<bool> getDarkMode();
  Future<void> setDarkMode(bool enabled);
}
