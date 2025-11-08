import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/gate_type.dart';
import '../blocs/gate_simulator/gate_simulator_bloc.dart';
import '../blocs/gate_simulator/gate_simulator_event.dart';
import '../blocs/gate_simulator/gate_simulator_state.dart';

class GateBottomNavBar extends StatelessWidget {
  const GateBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GateSimulatorBloc, GateSimulatorState>(
      builder: (context, state) {
        final currentIndex = _getIndexFromGateType(state.currentGateType);

        return BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            final gateType = _getGateTypeFromIndex(index);
            context.read<GateSimulatorBloc>().add(SelectGateType(gateType));
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.keyboard_arrow_up),
              label: 'AND',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chevron_right),
              label: 'OR',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.not_interested),
              label: 'NOT',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.do_not_disturb_on),
              label: 'NAND',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.block), label: 'NOR'),
            BottomNavigationBarItem(
              icon: Icon(Icons.compare_arrows),
              label: 'XOR',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.swap_horiz),
              label: 'XNOR',
            ),
          ],
        );
      },
    );
  }

  int _getIndexFromGateType(GateType gateType) {
    switch (gateType) {
      case GateType.and:
        return 0;
      case GateType.or:
        return 1;
      case GateType.not:
        return 2;
      case GateType.nand:
        return 3;
      case GateType.nor:
        return 4;
      case GateType.xor:
        return 5;
      case GateType.xnor:
        return 6;
    }
  }

  GateType _getGateTypeFromIndex(int index) {
    switch (index) {
      case 0:
        return GateType.and;
      case 1:
        return GateType.or;
      case 2:
        return GateType.not;
      case 3:
        return GateType.nand;
      case 4:
        return GateType.nor;
      case 5:
        return GateType.xor;
      case 6:
        return GateType.xnor;
      default:
        return GateType.and;
    }
  }
}
