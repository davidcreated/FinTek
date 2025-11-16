/// App Routes
/// Define all route names as constants
class AppRoutes {
  // Prevent instantiation
  AppRoutes._();

  // Splash & Intro
  static const String initial = '/';
  static const String splash = '/splash';
  static const String intro = '/intro';
  
  // Onboarding
  static const String onboarding = '/onboarding';
  
  // Auth
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  
  // Main App
  static const String home = '/home';
  static const String dashboard = '/dashboard';
  
  // Transactions
  static const String transactions = '/transactions';
  static const String transactionDetail = '/transaction-detail';
  
  // Transfer
  static const String transfer = '/transfer';
  static const String confirmTransfer = '/confirm-transfer';
  static const String beneficiaries = '/beneficiaries';
  
  // Profile & Settings
  static const String profile = '/profile';
  static const String editProfile = '/edit-profile';
  static const String settings = '/settings';
  
  // Others
  static const String notifications = '/notifications';
  static const String help = '/help';
}
