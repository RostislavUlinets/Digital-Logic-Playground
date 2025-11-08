import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';

class OutputIndicator extends StatelessWidget {
  final bool value;

  const OutputIndicator({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: value ? AppTheme.outputOnColor : AppTheme.outputOffColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: value ? AppTheme.outputOnColor : Colors.grey.shade700,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: value
                ? AppTheme.outputOnColor.withValues(alpha: 0.4)
                : Colors.transparent,
            blurRadius: 12,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'OUTPUT',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            value ? '1' : '0',
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 48,
            ),
          ),
        ],
      ),
    );
  }
}
