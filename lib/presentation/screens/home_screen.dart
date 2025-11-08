import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/gate_type.dart';
import '../blocs/gate_simulator/gate_simulator_bloc.dart';
import '../blocs/gate_simulator/gate_simulator_event.dart';
import '../blocs/gate_simulator/gate_simulator_state.dart';
import '../widgets/gate_bottom_nav_bar.dart';
import '../widgets/gate_symbol.dart';
import '../widgets/input_toggle.dart';
import '../widgets/output_indicator.dart';
import '../widgets/truth_table_widget.dart';

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
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Gate name and formula
                  Text(
                    state.currentGate.name,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    state.currentGate.formula,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Gate symbol
                  GateSymbol(gateType: state.currentGateType),
                  const SizedBox(height: 32),

                  // Input toggles
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: InputToggle(
                          label: 'Input A',
                          value: state.inputA,
                          onTap: () {
                            context.read<GateSimulatorBloc>().add(
                              const ToggleInputA(),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Only show Input B for gates that use it (NOT gate uses only A)
                      if (state.currentGateType != GateType.not)
                        Expanded(
                          child: InputToggle(
                            label: 'Input B',
                            value: state.inputB,
                            onTap: () {
                              context.read<GateSimulatorBloc>().add(
                                const ToggleInputB(),
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 48),

                  // Output indicator
                  OutputIndicator(value: state.output),
                  const SizedBox(height: 32),

                  // Truth Table
                  if (state.truthTable.isNotEmpty)
                    TruthTableWidget(
                      truthTable: state.truthTable,
                      inputA: state.inputA,
                      inputB: state.inputB,
                    ),
                  const SizedBox(height: 16),

                  // Description
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        state.currentGate.description,
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                    ),
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
