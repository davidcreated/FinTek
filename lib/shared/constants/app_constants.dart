/// App Constants
/// 
/// Contains all constant values used throughout the app
class AppConstants {
  AppConstants._();

  // App Info
  static const String appName = 'Fintek';
  static const String appVersion = '1.0.0';
  static const String appTagline = 'Your Smart Finance Partner';
  
  // Spacing & Sizing
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingXLarge = 32.0;
  
  static const double marginSmall = 8.0;
  static const double marginMedium = 16.0;
  static const double marginLarge = 24.0;
  
  static const double borderRadiusSmall = 8.0;
  static const double borderRadiusMedium = 12.0;
  static const double borderRadiusLarge = 16.0;
  static const double borderRadiusXLarge = 24.0;
  
  // Icon Sizes
  static const double iconSizeSmall = 16.0;
  static const double iconSizeMedium = 24.0;
  static const double iconSizeLarge = 32.0;
  static const double iconSizeXLarge = 48.0;
  
  // Button Heights
  static const double buttonHeightSmall = 40.0;
  static const double buttonHeightMedium = 48.0;
  static const double buttonHeightLarge = 56.0;
  
  // Animation Durations
  static const int animationDurationShort = 200;
  static const int animationDurationMedium = 300;
  static const int animationDurationLong = 500;
  
  // API & Network
  static const int connectionTimeout = 30000; // 30 seconds
  static const int receiveTimeout = 30000;
  
  // Limits
  static const int maxImageSize = 5 * 1024 * 1024; // 5MB
  static const int maxTransactionAmount = 1000000;
  static const int minTransactionAmount = 1;
  
  // Pagination
  static const int defaultPageSize = 20;
  static const int transactionPageSize = 50;
  
  // Date Formats
  static const String dateFormatDisplay = 'MMM dd, yyyy';
  static const String dateFormatFull = 'MMMM dd, yyyy';
  static const String dateTimeFormat = 'MMM dd, yyyy hh:mm a';
  static const String timeFormat = 'hh:mm a';
  
  // Currency
  static const String currencySymbol = '₦';
  static const String currencyCode = 'NGN';
  
  // Validation
  static const int minPasswordLength = 8;
  static const int maxPasswordLength = 32;
  static const int pinLength = 4;
  static const int otpLength = 6;
  
  // Transaction Types
  static const String transactionTypeCredit = 'credit';
  static const String transactionTypeDebit = 'debit';
  static const String transactionTypeTransfer = 'transfer';
  
  // Transaction Status
  static const String statusPending = 'pending';
  static const String statusCompleted = 'completed';
  static const String statusFailed = 'failed';
  static const String statusCancelled = 'cancelled';
  
  // Storage Keys
  static const String keyAccessToken = 'access_token';
  static const String keyRefreshToken = 'refresh_token';
  static const String keyUserId = 'user_id';
  static const String keyUserEmail = 'user_email';
  static const String keyBiometricEnabled = 'biometric_enabled';
  static const String keyThemeMode = 'theme_mode';
  static const String keyLanguage = 'language';
  static const String keyOnboardingComplete = 'onboarding_complete';
  
  // Routes (to be used with GetX routing)
  static const String routeSplash = '/splash';
  static const String routeOnboarding = '/onboarding';
  static const String routeLogin = '/login';
  static const String routeRegister = '/register';
  static const String routeForgotPassword = '/forgot-password';
  static const String routeDashboard = '/dashboard';
  static const String routeTransactions = '/transactions';
  static const String routeTransfer = '/transfer';
  static const String routeProfile = '/profile';
  static const String routeSettings = '/settings';
  
  // Error Messages
  static const String errorNetwork = 'Network error. Please check your connection.';
  static const String errorUnknown = 'An unexpected error occurred. Please try again.';
  static const String errorInvalidCredentials = 'Invalid email or password.';
  static const String errorSessionExpired = 'Your session has expired. Please login again.';
  
  // Success Messages
  static const String successLogin = 'Login successful!';
  static const String successRegister = 'Account created successfully!';
  static const String successTransfer = 'Transfer completed successfully!';
  static const String successProfileUpdate = 'Profile updated successfully!';
  
  // URLs (Update with your actual URLs)
  static const String termsUrl = 'https://fintek.com/terms';
  static const String privacyUrl = 'https://fintek.com/privacy';
  static const String supportUrl = 'https://fintek.com/support';
  static const String supportEmail = 'support@fintek.com';
}
