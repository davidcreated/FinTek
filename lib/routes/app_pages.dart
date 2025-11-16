import 'package:get/get.dart';
import 'app_routes.dart';

// Splash screens
import '../app/modules/Splash/views/onboarding1.dart';
import '../app/modules/Splash/views/onboarding2.dart';

// Onboarding
import '../app/modules/Onboarding/views/onboarding_screen.dart';
import '../app/modules/Onboarding/controllers/onboarding_controller.dart';

// Auth
import '../features/auth/presentation/pages/signup_screen.dart';
import '../features/auth/presentation/controllers/signup_controller.dart';

/// App Pages
/// Define all GetX pages and their bindings
class AppPages {
  // Prevent instantiation
  AppPages._();

  // Initial route - starts with splash screen
  static const initial = AppRoutes.splash;

  // All app pages
  static final routes = [
    // Splash Screen 1 (Animated Logo)
    GetPage(
      name: AppRoutes.splash,
      page: () => const Onboarding1(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    // Splash Screen 2 (Welcome/Login/Signup)
    GetPage(
      name: AppRoutes.intro,
      page: () => const Onboarding2(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    // Onboarding Screens (2-page swipeable tutorial)
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<OnboardingController>(() => OnboardingController());
      }),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    // Sign Up Screen
    GetPage(
      name: AppRoutes.register,
      page: () => const SignUpScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SignUpController>(() => SignUpController());
      }),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
  ];
}
