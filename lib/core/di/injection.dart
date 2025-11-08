import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/datasources/preferences_local_datasource.dart';
import '../../data/repositories/settings_repository_impl.dart';
import '../../domain/repositories/settings_repository.dart';
import '../../domain/usecases/calculate_gate_output.dart';
import '../../domain/usecases/get_truth_table.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  // Data sources
  getIt.registerSingleton<PreferencesLocalDataSource>(
    PreferencesLocalDataSource(getIt()),
  );

  // Repositories
  getIt.registerSingleton<SettingsRepository>(SettingsRepositoryImpl(getIt()));

  // Use cases
  getIt.registerSingleton<CalculateGateOutput>(CalculateGateOutput());

  getIt.registerSingleton<GetTruthTable>(GetTruthTable(getIt()));
}
