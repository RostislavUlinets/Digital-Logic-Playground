import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/gate_simulator/gate_simulator_bloc.dart';
import '../blocs/gate_simulator/gate_simulator_state.dart';
import '../widgets/gate_bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GateSimulatorBloc, GateSimulatorState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(state.currentGate.name),
            actions: [
              IconButton(
                icon: const Icon(Icons.info_outline),
                onPressed: () {
                  _showGateInfo(context, state);
                },
              ),
            ],
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.currentGate.name,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    state.currentGate.formula,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Placeholder for gate visualization',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Inputs and outputs will be added in Stage 5',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: const GateBottomNavBar(),
        );
      },
    );
  }

  void _showGateInfo(BuildContext context, GateSimulatorState state) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(state.currentGate.name),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Formula: ${state.currentGate.formula}'),
            const SizedBox(height: 8),
            Text('Description: ${state.currentGate.description}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
