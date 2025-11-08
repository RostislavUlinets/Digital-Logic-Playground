import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repositories/settings_repository.dart';
import 'settings_event.dart';
import 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SettingsRepository _settingsRepository;

  SettingsBloc({required SettingsRepository settingsRepository})
    : _settingsRepository = settingsRepository,
      super(SettingsState.initial()) {
    on<LoadSettings>(_onLoadSettings);
    on<ToggleDarkMode>(_onToggleDarkMode);
    on<SetDarkMode>(_onSetDarkMode);
  }

  Future<void> _onLoadSettings(
    LoadSettings event,
    Emitter<SettingsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final isDarkMode = await _settingsRepository.getDarkMode();

    emit(state.copyWith(isDarkMode: isDarkMode, isLoading: false));
  }

  Future<void> _onToggleDarkMode(
    ToggleDarkMode event,
    Emitter<SettingsState> emit,
  ) async {
    final newDarkMode = !state.isDarkMode;

    emit(state.copyWith(isDarkMode: newDarkMode));

    await _settingsRepository.setDarkMode(newDarkMode);
  }

  Future<void> _onSetDarkMode(
    SetDarkMode event,
    Emitter<SettingsState> emit,
  ) async {
    emit(state.copyWith(isDarkMode: event.enabled));

    await _settingsRepository.setDarkMode(event.enabled);
  }
}
