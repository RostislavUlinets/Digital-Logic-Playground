import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';

class OutputIndicator extends StatelessWidget {
  final bool value;

  const OutputIndicator({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'OUTPUT',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.all(20),
          width: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: value ? AppTheme.outputOnColor : AppTheme.outputOffColor,
            border: Border.all(
              color: value ? AppTheme.outputOnColor : Colors.grey.shade700,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: value
                    ? AppTheme.outputOnColor.withValues(alpha: 0.5)
                    : Colors.transparent,
                blurRadius: value ? 14 : 0,
                spreadRadius: value ? 3 : 0,
              ),
            ],
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(scale: animation, child: child);
            },
            child: Text(
              value ? '1' : '0',
              key: ValueKey<bool>(value),
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 48,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
