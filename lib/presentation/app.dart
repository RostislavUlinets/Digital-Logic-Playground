import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/di/injection.dart';
import '../core/theme/app_theme.dart';
import 'blocs/gate_simulator/gate_simulator_bloc.dart';
import 'blocs/gate_simulator/gate_simulator_event.dart';
import 'blocs/settings/settings_bloc.dart';
import 'blocs/settings/settings_event.dart';
import 'blocs/settings/settings_state.dart';
import 'screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GateSimulatorBloc>(
          create: (context) => getIt<GateSimulatorBloc>()
            ..add(const LoadLastGateType()),
        ),
        BlocProvider<SettingsBloc>(
          create: (context) => getIt<SettingsBloc>()
            ..add(const LoadSettings()),
        ),
      ],
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Logic Gate Simulator',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.darkTheme,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
