import 'package:flutter/material.dart';

/// App Color Constants
///
/// Contains all the color definitions used throughout the Fintek app.
/// Usage: AppColors.primary, AppColors.secondary, etc.
class AppColors {
  // Prevent instantiation
  AppColors._();

  // Primary Colors
  static const Color primary = Color(0xFF00D09E);
  static const Color primaryDark = Color(0xFF0E3E3E);
  static const Color primaryLight = Color(0xFFDFF7E2);

  // Secondary Colors
  static const Color secondary = Color(0xFF0068FF);
  static const Color secondaryLight = Color(0xFF3299FF);

  // Basic Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  // Semantic Colors
  static const Color success = Color(0xFF00D09E);
  static const Color error = Color(0xFFFF4444);
  static const Color warning = Color(0xFFFFBB33);
  static const Color info = Color(0xFF0068FF);

  // Text Colors
  static const Color textPrimary = Color(0xFF0E3E3E);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textLight = Color(0xFF9CA3AF);
  static const Color textWhite = Color(0xFFFFFFFF);

  // Background Colors
  static const Color background = Color(0xFFF1FFF3);
  static const Color backgroundLight = Color(0xFFF9FAFB);
  static const Color backgroundDark = Color(0xFF0E3E3E);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color scaffoldBackground = Color(0xFFF5F5F5);

  // Border Colors
  static const Color border = Color(0xFFE5E7EB);
  static const Color borderLight = Color(0xFFF3F4F6);
  static const Color borderDark = Color(0xFFD1D5DB);

  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, Color(0xFF00B88A)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [secondary, secondaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient darkGradient = LinearGradient(
    colors: [primaryDark, Color(0xFF0A2F2F)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // Opacity Variants
  static Color primaryWithOpacity(double opacity) =>
      primary.withOpacity(opacity);
  static Color secondaryWithOpacity(double opacity) =>
      secondary.withOpacity(opacity);
  static Color whiteWithOpacity(double opacity) => white.withOpacity(opacity);
  static Color blackWithOpacity(double opacity) => black.withOpacity(opacity);

  // Shadow Colors
  static final Color shadowLight = black.withOpacity(0.05);
  static final Color shadowMedium = black.withOpacity(0.1);
  static final Color shadowDark = black.withOpacity(0.2);

  // Transaction Type Colors
  static const Color income = Color(0xFF00D09E);
  static const Color expense = Color(0xFFFF4444);
  static const Color transfer = Color(0xFF0068FF);

  // Category Colors (for transaction categories)
  static const Color categoryFood = Color(0xFFFF6B6B);
  static const Color categoryTransport = Color(0xFF4ECDC4);
  static const Color categoryShopping = Color(0xFFFFE66D);
  static const Color categoryBills = Color(0xFF95E1D3);
  static const Color categoryEntertainment = Color(0xFFDDA15E);
  static const Color categorySalary = Color(0xFF00D09E);
  static const Color categoryOther = Color(0xFF9CA3AF);

  // Status Colors
  static const Color statusPending = Color(0xFFFFBB33);
  static const Color statusCompleted = Color(0xFF00D09E);
  static const Color statusFailed = Color(0xFFFF4444);
  static const Color statusCancelled = Color(0xFF9CA3AF);

  // Chart Colors (for analytics)
  static const List<Color> chartColors = [
    primary,
    secondary,
    secondaryLight,
    Color(0xFFFF6B6B),
    Color(0xFF4ECDC4),
    Color(0xFFFFE66D),
    Color(0xFF95E1D3),
    Color(0xFFDDA15E),
  ];
}

/// Material Color Swatch for ThemeData
/// Used for Material Design components
class AppColorSwatch {
  static const MaterialColor primarySwatch =
      MaterialColor(0xFF00D09E, <int, Color>{
        50: Color(0xFFE0F7F2),
        100: Color(0xFFB3ECDE),
        200: Color(0xFF80E0C8),
        300: Color(0xFF4DD4B2),
        400: Color(0xFF26CAA2),
        500: Color(0xFF00D09E),
        600: Color(0xFF00BB8E),
        700: Color(0xFF00A57D),
        800: Color(0xFF008F6D),
        900: Color(0xFF006B50),
      });
}
