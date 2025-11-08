import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/theme/app_theme.dart';

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
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: value
              ? AppTheme.primaryColor.withValues(alpha: 0.5)
              : AppTheme.surfaceVariant,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () => _handleTap(!value),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              width: 56,
              height: 32,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: value
                      ? [AppTheme.primaryColor, AppTheme.neonCyan]
                      : [AppTheme.inputOffColor, AppTheme.inputOffColor],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: AnimatedAlign(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                alignment: value ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: 24,
                  height: 24,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: value
                        ? AppTheme.backgroundColor
                        : AppTheme.textSecondary,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            style: TextStyle(
              fontSize: 24,
              color: value ? AppTheme.primaryColor : AppTheme.textSecondary,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
            child: Text(value ? '1' : '0'),
          ),
        ],
      ),
    );
  }
}
