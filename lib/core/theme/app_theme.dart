import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  // Futuristic color palette - cyberpunk inspired
  // Base colors
  static const Color backgroundColor = Color(0xFF0D1117); // Ultra-dark navy
  static const Color surfaceColor = Color(0xFF1A1A1E); // Charcoal gray
  static const Color surfaceVariant = Color(
    0xFF1E1E25,
  ); // Subtle surface variation

  // Accent colors
  static const Color primaryColor = Color(0xFF00C6AE); // Vivid teal/cyan
  static const Color secondaryColor = Color(0xFFFF3CAC); // Soft magenta glow
  static const Color accentOrange = Color(0xFFFF7A00); // Neon orange
  static const Color neonCyan = Color(0xFF00FFFF); // Electric cyan
  static const Color highlightGreen = Color(0xFF00FF85); // Bright highlight

  // Text colors
  static const Color textPrimary = Color(0xFFE6E6E6); // Main text
  static const Color textSecondary = Color(0xFF8B949E); // Secondary text

  // Status colors
  static const Color errorColor = Color(0xFFFF3366);

  // Logic gate colors - neon glow theme
  static const Color inputOffColor = Color(0xFF4A5568); // Muted gray
  static const Color inputOnColor = Color(0xFF00C6AE); // Teal glow
  static const Color outputOffColor = Color(0xFF2D3748); // Dark gray
  static const Color outputOnColor = Color(0xFF00FFFF); // Cyan glow

  // Interactive elements
  static const Color glassBackground = Color(
    0x1AFFFFFF,
  ); // Glass-like blur effect
  static const Color buttonActive = primaryColor;
  static const Color buttonInactive = Color(0xFF2A2A32);

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: primaryColor,
        secondary: secondaryColor,
        surface: surfaceColor,
        error: errorColor,
        onPrimary: textPrimary,
        onSecondary: backgroundColor,
        onSurface: textPrimary,
        onError: backgroundColor,
      ),
      scaffoldBackgroundColor: backgroundColor,
      fontFamily: 'SF Pro Text', // Rounded sans-serif for futuristic feel
      // AppBar theme
      appBarTheme: AppBarTheme(
        backgroundColor: surfaceColor,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textPrimary,
          letterSpacing: 0.5, // Slight letter spacing for readability
        ),
      ),

      // Card theme with glass-like effect
      cardTheme: CardThemeData(
        color: surfaceColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          side: BorderSide(
            color: primaryColor.withValues(alpha: 0.1),
            width: 1,
          ),
        ),
      ),

      // Bottom Navigation Bar theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: surfaceColor,
        selectedItemColor: primaryColor,
        unselectedItemColor: textSecondary,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          letterSpacing: 0.3,
        ),
      ),

      // Button themes with glow effect
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          elevation: 0,
          shadowColor: primaryColor.withValues(alpha: 0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),

      // Text theme with new palette
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textPrimary,
          letterSpacing: 0.5,
        ),
        displayMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textPrimary,
          letterSpacing: 0.5,
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textPrimary,
          letterSpacing: 0.3,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: textPrimary,
          letterSpacing: 0.2,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: textSecondary,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}
