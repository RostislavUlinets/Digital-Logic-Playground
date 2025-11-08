import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';

class OutputIndicator extends StatelessWidget {
  final bool value;

  const OutputIndicator({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: value
              ? AppTheme.neonCyan.withValues(alpha: 0.5)
              : AppTheme.surfaceVariant,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'OUTPUT',
            style: TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 12),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: value
                    ? [AppTheme.neonCyan, AppTheme.primaryColor]
                    : [AppTheme.outputOffColor, AppTheme.outputOffColor],
              ),
              border: Border.all(
                color: value
                    ? AppTheme.neonCyan.withValues(alpha: 0.8)
                    : AppTheme.textSecondary.withValues(alpha: 0.3),
                width: 2,
              ),
            ),
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              style: TextStyle(
                fontSize: 36,
                color: value
                    ? AppTheme.backgroundColor
                    : AppTheme.textSecondary,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
              child: Text(value ? '1' : '0'),
            ),
          ),
        ],
      ),
    );
  }
}
