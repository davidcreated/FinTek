import 'package:fintek/app/modules/Onboarding/views/onboarding_screen.dart';
import 'package:fintek/app/modules/Splash/views/onboarding1.dart';
import 'package:fintek/app/modules/Splash/views/onboarding2.dart';
import 'package:fintek/features/auth/presentation/pages/signup_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class AppRoutes {
  AppRoutes._();

  //Onboarding

  static const String onboarding1 = "/onboarding1";
  static const String onboarding2 = "/onboarding2";
  static const String onboardingscreen = "/onboardingscreen";
  static const String signup = "/signup";

  static final List<GetPage> pages = [
    GetPage(
      name: onboarding1,
      page: () => const Onboarding1(),
      transition: Transition.fade,
    ),
    GetPage(
      name: onboarding2,
      page: () => const Onboarding2(),
      transition: Transition.fade,
    ),
    GetPage(name: onboardingscreen, page: () => const OnboardingScreen()),
    GetPage(name: signup, page: () => const SignUpScreen()),
  ];
}
