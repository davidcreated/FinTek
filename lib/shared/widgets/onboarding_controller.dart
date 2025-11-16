import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class OnboardingController extends GetxController with GetTickerProviderStateMixin {
  late PageController pageController;
  var currentPage = 0.obs;
  late AnimationController floatingCoinsController;
  late AnimationController fadeController;
  final int totalPages = 2;
  
  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    
    floatingCoinsController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);
    
    fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..forward();
  }
  
  @override
  void onClose() {
    pageController.dispose();
    floatingCoinsController.dispose();
    fadeController.dispose();
    super.onClose();
  }
  
  void nextPage() {
    if (currentPage.value < totalPages - 1) {
      currentPage.value++;
      pageController.animateToPage(
        currentPage.value,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      fadeController.reset();
      fadeController.forward();
    } else {
      completeOnboarding();
    }
  }
  
  void previousPage() {
    if (currentPage.value > 0) {
      currentPage.value--;
      pageController.animateToPage(
        currentPage.value,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      fadeController.reset();
      fadeController.forward();
    }
  }
  
  void skip() {
    completeOnboarding();
  }
  
  void completeOnboarding() {
    // Save onboarding completion to local storage
    // TODO: Uncomment when you have SharedPreferences or GetStorage setup
    // final storage = Get.find<StorageService>();
    // storage.setOnboardingComplete(true);
    
    // Navigate to login screen
    // TODO: Update this route when you create the login screen
    Get.snackbar(
      'Welcome to Fintek! 🎉',
      'Ready to manage your finances',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF00D09E),
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
    );
    
    // Uncomment this when you have a login screen
    // Get.offAllNamed(AppRoutes.login);
    
    // For now, just restart the onboarding (for demo purposes)
    Future.delayed(const Duration(seconds: 2), () {
      currentPage.value = 0;
      pageController.jumpToPage(0);
      fadeController.reset();
      fadeController.forward();
    });
  }
  
  void onPageChanged(int index) {
    currentPage.value = index;
    fadeController.reset();
    fadeController.forward();
  }
}
