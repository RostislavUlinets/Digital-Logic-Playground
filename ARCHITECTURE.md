# Logicly - Flutter Architecture Design

## Overview
This document outlines the complete architecture for **Logicly - Digital Circuit Simulator**, following the official Flutter architecture guidelines from https://docs.flutter.dev/app-architecture/guide

### Tech Stack
- **State Management**: Bloc (flutter_bloc)
- **Persistence**: shared_preferences
- **Platform**: Mobile-first (iOS/Android)
- **Scope**: 7 basic logic gates (AND, OR, NOT, NAND, NOR, XOR, XNOR)

---

## Architecture Layers

Following Flutter's official 4-layer architecture:

1. **Presentation Layer**: Widgets, screens, Blocs (UI + UI logic)
2. **Domain Layer**: Pure business logic (gate operations, business rules)
3. **Data Layer**: Repositories, data sources (shared_preferences)
4. **Core**: DI, theme, constants (cross-cutting concerns)

---

## Folder Structure

```
lib/
├── main.dart                          # App entry point
├── app.dart                           # App widget with theme & routing
│
├── core/                              # Cross-cutting concerns
│   ├── di/
│   │   └── injection.dart             # Dependency injection (get_it)
│   ├── theme/
│   │   └── app_theme.dart             # Material 3 dark theme
│   └── constants/
│       └── gate_constants.dart        # Gate formulas, descriptions
│
├── data/                              # Data Layer
│   ├── datasources/
│   │   └── preferences_local_data_source.dart  # SharedPreferences wrapper
│   ├── repositories/
│   │   └── settings_repository_impl.dart       # Concrete implementation
│   └── models/
│       └── settings_model.dart                 # Data transfer object
│
├── domain/                            # Domain Layer (Pure Logic)
│   ├── entities/
│   │   ├── logic_gate.dart            # Gate entity (freezed)
│   │   ├── gate_type.dart             # Enum: and, or, not, nand, nor, xor, xnor
│   │   └── gate_result.dart           # Output with metadata
│   ├── repositories/
│   │   └── settings_repository.dart   # Abstract repository interface
│   └── usecases/
│       ├── calculate_gate_output.dart # Pure bit operation logic
│       └── get_truth_table.dart       # Generate 4-row truth table
│
└── presentation/                      # Presentation Layer
    ├── blocs/                         # UI Logic (State Management)
    │   ├── gate_simulator/
    │   │   ├── gate_simulator_bloc.dart
    │   │   ├── gate_simulator_event.dart
    │   │   └── gate_simulator_state.dart
    │   └── settings/
    │       ├── settings_bloc.dart
    │       ├── settings_event.dart
    │       └── settings_state.dart
    │
    ├── screens/
    │   ├── home_screen.dart           # Main scaffold with bottom nav
    │   └── gate_screen.dart           # Gate display screen
    │
    ├── widgets/
    │   ├── gate_symbol.dart           # CustomPaint gate graphics
    │   ├── input_toggle.dart          # A/B input switches
    │   ├── output_indicator.dart      # Animated output with glow
    │   ├── truth_table_widget.dart    # Collapsible truth table
    │   └── bottom_nav_bar.dart        # 7-gate navigation
    │
    └── utils/
        └── gate_painter.dart          # CustomPainter for gate symbols
```

---

## Layer Responsibilities

### 1. Domain Layer (Pure Dart - No Flutter Dependencies)

**Purpose**: Contains all business logic and rules. Completely independent of UI and data sources.

#### Entities
```dart
// gate_type.dart
enum GateType {
  and,
  or,
  not,
  nand,
  nor,
  xor,
  xnor,
}

// logic_gate.dart (using freezed)
@freezed
class LogicGate with _$LogicGate {
  const factory LogicGate({
    required GateType type,
    required String name,
    required String formula,
    required String description,
  }) = _LogicGate;
}

// gate_result.dart
@freezed
class GateResult with _$GateResult {
  const factory GateResult({
    required bool output,
    required bool inputA,
    required bool inputB,
  }) = _GateResult;
}
```

#### Use Cases
```dart
// calculate_gate_output.dart
class CalculateGateOutput {
  bool call(GateType type, bool inputA, bool inputB) {
    switch (type) {
      case GateType.and:
        return inputA && inputB;
      case GateType.or:
        return inputA || inputB;
      case GateType.not:
        return !inputA;
      case GateType.nand:
        return !(inputA && inputB);
      case GateType.nor:
        return !(inputA || inputB);
      case GateType.xor:
        return inputA ^ inputB;
      case GateType.xnor:
        return !(inputA ^ inputB);
    }
  }
}

// get_truth_table.dart
class GetTruthTable {
  List<Map<String, bool>> call(GateType type) {
    final calculate = CalculateGateOutput();
    return [
      {'A': false, 'B': false, 'OUT': calculate(type, false, false)},
      {'A': false, 'B': true, 'OUT': calculate(type, false, true)},
      {'A': true, 'B': false, 'OUT': calculate(type, true, false)},
      {'A': true, 'B': true, 'OUT': calculate(type, true, true)},
    ];
  }
}
```

#### Repository Interface
```dart
// settings_repository.dart
abstract class SettingsRepository {
  Future<GateType?> getLastViewedGate();
  Future<void> saveLastViewedGate(GateType gate);
  Future<bool> isDarkMode();
  Future<void> setDarkMode(bool isDark);
}
```

---

### 2. Data Layer

**Purpose**: Implements data operations. Handles persistence and data sources.

#### Data Source
```dart
// preferences_local_data_source.dart
class PreferencesLocalDataSource {
  final SharedPreferences _prefs;

  PreferencesLocalDataSource(this._prefs);

  static const _keyLastGate = 'last_gate';
  static const _keyDarkMode = 'dark_mode';

  String? getLastGateType() => _prefs.getString(_keyLastGate);

  Future<bool> saveLastGateType(String gateType) =>
      _prefs.setString(_keyLastGate, gateType);

  bool getDarkMode() => _prefs.getBool(_keyDarkMode) ?? true;

  Future<bool> setDarkMode(bool isDark) =>
      _prefs.setBool(_keyDarkMode, isDark);
}
```

#### Repository Implementation
```dart
// settings_repository_impl.dart
class SettingsRepositoryImpl implements SettingsRepository {
  final PreferencesLocalDataSource _dataSource;

  SettingsRepositoryImpl(this._dataSource);

  @override
  Future<GateType?> getLastViewedGate() async {
    final gateString = _dataSource.getLastGateType();
    if (gateString == null) return null;
    return GateType.values.firstWhere(
      (e) => e.name == gateString,
      orElse: () => GateType.and,
    );
  }

  @override
  Future<void> saveLastViewedGate(GateType gate) async {
    await _dataSource.saveLastGateType(gate.name);
  }

  @override
  Future<bool> isDarkMode() async => _dataSource.getDarkMode();

  @override
  Future<void> setDarkMode(bool isDark) async {
    await _dataSource.setDarkMode(isDark);
  }
}
```

---

### 3. Presentation Layer

**Purpose**: UI components and UI logic (Blocs). Reacts to state changes and displays data.

#### Blocs (UI Logic)

**GateSimulatorBloc**
```dart
// gate_simulator_event.dart
abstract class GateSimulatorEvent extends Equatable {
  const GateSimulatorEvent();
}

class ChangeGateType extends GateSimulatorEvent {
  final GateType gateType;
  const ChangeGateType(this.gateType);
  @override
  List<Object> get props => [gateType];
}

class ToggleInputA extends GateSimulatorEvent {
  @override
  List<Object> get props => [];
}

class ToggleInputB extends GateSimulatorEvent {
  @override
  List<Object> get props => [];
}

// gate_simulator_state.dart
@freezed
class GateSimulatorState with _$GateSimulatorState {
  const factory GateSimulatorState({
    required GateType currentGateType,
    required LogicGate currentGate,
    required bool inputA,
    required bool inputB,
    required bool output,
    required List<Map<String, bool>> truthTable,
  }) = _GateSimulatorState;
}

// gate_simulator_bloc.dart
class GateSimulatorBloc extends Bloc<GateSimulatorEvent, GateSimulatorState> {
  final CalculateGateOutput _calculateOutput;
  final GetTruthTable _getTruthTable;
  final SettingsRepository _settingsRepository;

  GateSimulatorBloc({
    required CalculateGateOutput calculateOutput,
    required GetTruthTable getTruthTable,
    required SettingsRepository settingsRepository,
  })  : _calculateOutput = calculateOutput,
        _getTruthTable = getTruthTable,
        _settingsRepository = settingsRepository,
        super(/* initial state */) {
    on<ChangeGateType>(_onChangeGateType);
    on<ToggleInputA>(_onToggleInputA);
    on<ToggleInputB>(_onToggleInputB);
  }

  Future<void> _onChangeGateType(
    ChangeGateType event,
    Emitter<GateSimulatorState> emit,
  ) async {
    final output = _calculateOutput(event.gateType, state.inputA, state.inputB);
    final truthTable = _getTruthTable(event.gateType);
    final gate = _getGateInfo(event.gateType);

    emit(state.copyWith(
      currentGateType: event.gateType,
      currentGate: gate,
      output: output,
      truthTable: truthTable,
    ));

    await _settingsRepository.saveLastViewedGate(event.gateType);
  }

  void _onToggleInputA(
    ToggleInputA event,
    Emitter<GateSimulatorState> emit,
  ) {
    final newInputA = !state.inputA;
    final output = _calculateOutput(
      state.currentGateType,
      newInputA,
      state.inputB,
    );
    emit(state.copyWith(inputA: newInputA, output: output));
  }

  void _onToggleInputB(
    ToggleInputB event,
    Emitter<GateSimulatorState> emit,
  ) {
    final newInputB = !state.inputB;
    final output = _calculateOutput(
      state.currentGateType,
      state.inputA,
      newInputB,
    );
    emit(state.copyWith(inputB: newInputB, output: output));
  }
}
```

**SettingsBloc**
```dart
// settings_event.dart
abstract class SettingsEvent extends Equatable {
  const SettingsEvent();
}

class LoadSettings extends SettingsEvent {
  @override
  List<Object> get props => [];
}

class ToggleTheme extends SettingsEvent {
  @override
  List<Object> get props => [];
}

// settings_state.dart
@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    required bool isDarkMode,
    required GateType? lastViewedGate,
    required bool isLoading,
  }) = _SettingsState;
}

// settings_bloc.dart
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SettingsRepository _repository;

  SettingsBloc(this._repository)
      : super(const SettingsState(
          isDarkMode: true,
          lastViewedGate: null,
          isLoading: true,
        )) {
    on<LoadSettings>(_onLoadSettings);
    on<ToggleTheme>(_onToggleTheme);
  }

  Future<void> _onLoadSettings(
    LoadSettings event,
    Emitter<SettingsState> emit,
  ) async {
    final isDark = await _repository.isDarkMode();
    final lastGate = await _repository.getLastViewedGate();
    emit(state.copyWith(
      isDarkMode: isDark,
      lastViewedGate: lastGate,
      isLoading: false,
    ));
  }

  Future<void> _onToggleTheme(
    ToggleTheme event,
    Emitter<SettingsState> emit,
  ) async {
    final newMode = !state.isDarkMode;
    await _repository.setDarkMode(newMode);
    emit(state.copyWith(isDarkMode: newMode));
  }
}
```

#### Screens

```dart
// home_screen.dart
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GateSimulatorBloc, GateSimulatorState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Logicly'),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () => context.read<SettingsBloc>().add(ToggleTheme()),
              ),
            ],
          ),
          body: GateScreen(),
          bottomNavigationBar: BottomNavBar(
            currentGateType: state.currentGateType,
            onGateSelected: (gateType) {
              context.read<GateSimulatorBloc>().add(ChangeGateType(gateType));
            },
          ),
        );
      },
    );
  }
}

// gate_screen.dart
class GateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GateSimulatorBloc, GateSimulatorState>(
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Gate name and formula
              Text(state.currentGate.name, style: Theme.of(context).textTheme.headlineLarge),
              Text(state.currentGate.formula, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 24),

              // Gate symbol
              GateSymbol(gateType: state.currentGateType),
              const SizedBox(height: 32),

              // Input toggles
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InputToggle(
                    label: 'A',
                    value: state.inputA,
                    onChanged: (_) => context.read<GateSimulatorBloc>().add(ToggleInputA()),
                  ),
                  InputToggle(
                    label: 'B',
                    value: state.inputB,
                    onChanged: (_) => context.read<GateSimulatorBloc>().add(ToggleInputB()),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Output indicator
              OutputIndicator(value: state.output),
              const SizedBox(height: 32),

              // Truth table
              TruthTableWidget(truthTable: state.truthTable),
            ],
          ),
        );
      },
    );
  }
}
```

#### Widgets

```dart
// input_toggle.dart
class InputToggle extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  const InputToggle({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        Switch(
          value: value,
          onChanged: onChanged,
        ),
        Text(value ? '1' : '0', style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}

// output_indicator.dart
class OutputIndicator extends StatelessWidget {
  final bool value;

  const OutputIndicator({required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('OUT', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: value ? Colors.green : Colors.grey[800],
            boxShadow: value
                ? [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.6),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ]
                : [],
          ),
          child: Center(
            child: Text(
              value ? '1' : '0',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}

// gate_symbol.dart
class GateSymbol extends StatelessWidget {
  final GateType gateType;

  const GateSymbol({required this.gateType});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 150,
      child: CustomPaint(
        painter: GatePainter(gateType),
      ),
    );
  }
}
```

---

### 4. Core Layer

#### Dependency Injection
```dart
// injection.dart
final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // External dependencies
  final sharedPrefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPrefs);

  // Data sources
  getIt.registerLazySingleton<PreferencesLocalDataSource>(
    () => PreferencesLocalDataSource(getIt()),
  );

  // Repositories
  getIt.registerLazySingleton<SettingsRepository>(
    () => SettingsRepositoryImpl(getIt()),
  );

  // Use cases
  getIt.registerLazySingleton(() => CalculateGateOutput());
  getIt.registerLazySingleton(() => GetTruthTable());

  // Blocs
  getIt.registerFactory(() => GateSimulatorBloc(
        calculateOutput: getIt(),
        getTruthTable: getIt(),
        settingsRepository: getIt(),
      ));

  getIt.registerFactory(() => SettingsBloc(getIt()));
}
```

#### Theme
```dart
// app_theme.dart
class AppTheme {
  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: Colors.red,
        secondary: Colors.redAccent,
        surface: const Color(0xFF1A1B26),
        background: const Color(0xFF16161E),
      ),
      scaffoldBackgroundColor: const Color(0xFF16161E),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF1A1B26),
        elevation: 0,
      ),
    );
  }
}
```

---

## Data Flow Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                     PRESENTATION LAYER                       │
│  ┌─────────────┐          ┌──────────────┐                 │
│  │   Widgets   │◄─────────│    Blocs     │                 │
│  │  (UI only)  │  State   │  (UI Logic)  │                 │
│  └─────────────┘          └──────────────┘                 │
│        │                         │                           │
│        │ Events                  │                           │
│        └─────────────────────────┘                           │
└─────────────────────────────────────────────────────────────┘
                                   │
                                   │ Calls
                                   ▼
┌─────────────────────────────────────────────────────────────┐
│                      DOMAIN LAYER                            │
│  ┌──────────────┐      ┌─────────────────┐                 │
│  │  Use Cases   │      │    Entities      │                 │
│  │ (Pure Logic) │      │  (Business Data) │                 │
│  └──────────────┘      └─────────────────┘                 │
│         │                                                     │
│         │ Uses                                                │
│         ▼                                                     │
│  ┌──────────────────────┐                                    │
│  │  Repository Interface │                                   │
│  └──────────────────────┘                                    │
└─────────────────────────────────────────────────────────────┘
                   │
                   │ Implements
                   ▼
┌─────────────────────────────────────────────────────────────┐
│                       DATA LAYER                             │
│  ┌─────────────────────┐      ┌──────────────┐             │
│  │  Repository Impl    │──────│ Data Sources │             │
│  │                     │      │ (SharedPrefs)│             │
│  └─────────────────────┘      └──────────────┘             │
└─────────────────────────────────────────────────────────────┘
```

### Example: User Toggles Input A

1. User taps Input A toggle widget
2. Widget calls `context.read<GateSimulatorBloc>().add(ToggleInputA())`
3. Bloc receives `ToggleInputA` event
4. Bloc calls `CalculateGateOutput` use case from domain layer
5. Use case performs pure bit operation and returns new output
6. Bloc emits new `GateSimulatorState` with updated input and output
7. `BlocBuilder` rebuilds widgets
8. `OutputIndicator` animates to new value with glow effect

---

## Dependencies

```yaml
# pubspec.yaml
dependencies:
  flutter:
    sdk: flutter

  # State management
  flutter_bloc: ^8.1.6
  equatable: ^2.0.5

  # Code generation
  freezed_annotation: ^2.4.4
  json_annotation: ^4.9.0

  # Dependency injection
  get_it: ^7.7.0

  # Persistence
  shared_preferences: ^2.2.3

dev_dependencies:
  flutter_test:
    sdk: flutter

  # Code generation
  freezed: ^2.5.7
  build_runner: ^2.4.11
  json_serializable: ^6.8.0

  # Linting
  flutter_lints: ^4.0.0

  # Testing
  bloc_test: ^9.1.7
  mocktail: ^1.0.4
```

---

## Implementation Checklist

### Phase 1: Setup & Domain Layer
- [ ] Create folder structure
- [ ] Add dependencies to `pubspec.yaml`
- [ ] Define `GateType` enum
- [ ] Create `LogicGate` entity with freezed
- [ ] Implement `CalculateGateOutput` use case
- [ ] Implement `GetTruthTable` use case
- [ ] Define abstract `SettingsRepository`

### Phase 2: Data Layer
- [ ] Create `PreferencesLocalDataSource`
- [ ] Implement `SettingsRepositoryImpl`
- [ ] Create `SettingsModel` (if needed)

### Phase 3: Presentation - Blocs
- [ ] Create `GateSimulatorBloc` with events and states
- [ ] Create `SettingsBloc` with events and states
- [ ] Test blocs with bloc_test

### Phase 4: Presentation - UI
- [ ] Create `AppTheme` (Material 3 dark)
- [ ] Build `HomeScreen` with scaffold
- [ ] Build `GateScreen` with BlocBuilder
- [ ] Create `InputToggle` widget
- [ ] Create `OutputIndicator` with animation
- [ ] Create `TruthTableWidget`
- [ ] Create `GatePainter` for gate symbols
- [ ] Create `BottomNavBar` with 7 gates

### Phase 5: Core & Integration
- [ ] Set up dependency injection with get_it
- [ ] Create `gate_constants.dart` with formulas
- [ ] Wire up navigation
- [ ] Add loading states
- [ ] Test on mobile devices

### Phase 6: Polish
- [ ] Add smooth animations (AnimatedContainer, Hero)
- [ ] Implement collapsible truth table
- [ ] Add haptic feedback on toggles
- [ ] Test performance
- [ ] Add error handling

---

## Testing Strategy

### Unit Tests
- Domain layer use cases (pure functions)
- Repository implementations
- Data source operations

### Bloc Tests
- State transitions for all events
- Mock use cases and repositories
- Test initial states and edge cases

### Widget Tests
- Individual widget rendering
- User interactions (toggles, navigation)
- State-based UI changes

### Integration Tests
- Full user flows (select gate → toggle inputs → view output)
- Persistence (reopen app, last gate restored)

---

## Future Enhancements

### Web Support
- Responsive layout with adaptive UI
- Keyboard shortcuts (Space to toggle, Arrow keys to navigate)
- Mouse hover effects
- URL-based routing (`/gates/xor`)

### Additional Features
- Custom circuit builder (connect multiple gates)
- Tutorial mode with overlays
- Quiz mode to test understanding
- Export truth tables as images/CSV
- Animation speed controls
- Share circuits via deep links

### Architecture Adaptations for Scale
- If adding circuit builder: introduce `Circuit` entity and `CircuitSimulator` service
- If adding tutorials: create `Content` domain layer
- If adding user accounts: add authentication repository
- Keep following the same layered architecture principles

---

## References

- [Flutter Architecture Guide](https://docs.flutter.dev/app-architecture/guide)
- [Bloc State Management](https://bloclibrary.dev/)
- [Freezed Code Generation](https://pub.dev/packages/freezed)
- [Material 3 Design](https://m3.material.io/)
- [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)

---

**Last Updated**: 2025-11-07
