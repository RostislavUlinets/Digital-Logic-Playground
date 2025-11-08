import 'package:equatable/equatable.dart';

class SettingsState extends Equatable {
  final bool isDarkMode;
  final bool isLoading;

  const SettingsState({required this.isDarkMode, this.isLoading = false});

  factory SettingsState.initial() {
    return const SettingsState(
      isDarkMode: true, // Default to dark mode
      isLoading: true,
    );
  }

  SettingsState copyWith({bool? isDarkMode, bool? isLoading}) {
    return SettingsState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [isDarkMode, isLoading];
}
