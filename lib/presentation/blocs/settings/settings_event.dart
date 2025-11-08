import 'package:equatable/equatable.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object?> get props => [];
}

class LoadSettings extends SettingsEvent {
  const LoadSettings();
}

class ToggleDarkMode extends SettingsEvent {
  const ToggleDarkMode();
}

class SetDarkMode extends SettingsEvent {
  final bool enabled;

  const SetDarkMode(this.enabled);

  @override
  List<Object?> get props => [enabled];
}
