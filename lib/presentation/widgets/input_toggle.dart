import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputToggle extends StatelessWidget {
  final String label;
  final bool value;
  final VoidCallback onTap;

  const InputToggle({
    super.key,
    required this.label,
    required this.value,
    required this.onTap,
  });

  void _handleTap(bool newValue) {
    HapticFeedback.lightImpact();
    onTap();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Switch(
          value: value,
          onChanged: _handleTap,
          activeColor: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(height: 8),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
          child: Text(
            value ? '1' : '0',
            key: ValueKey<bool>(value),
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
