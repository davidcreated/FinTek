import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController
    with GetTickerProviderStateMixin {
  late PageController pageController;
  var currentPage = 0.obs;

  // Multiple animation controllers for smooth, layered animations
  late AnimationController fadeController;
  late AnimationController slideController;
  late AnimationController scaleController;
  late AnimationController floatingController;

  // Animations
  late Animation<double> fadeAnimation;
  late Animation<Offset> slideAnimation;
  late Animation<double> scaleAnimation;
  late Animation<double> floatingAnimation;

  final int totalPages = 2;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();

    // Fade animation for content transitions
    fadeController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: fadeController, curve: Curves.easeInOut));

    // Slide animation for text
    slideController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(parent: slideController, curve: Curves.easeOutCubic),
        );

    // Scale animation for illustrations
    scaleController = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );
    scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: scaleController, curve: Curves.easeOutBack),
    );

    // Continuous floating animation for coins/illustrations
    floatingController = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );
    floatingAnimation = Tween<double>(begin: -8.0, end: 8.0).animate(
      CurvedAnimation(parent: floatingController, curve: Curves.easeInOut),
    );

    // Start initial animations
    _startAnimations();

    // Start floating animation (continuous loop)
    floatingController.repeat(reverse: true);
  }

  @override
  void onClose() {
    pageController.dispose();
    fadeController.dispose();
    slideController.dispose();
    scaleController.dispose();
    floatingController.dispose();
    super.onClose();
  }

  void _startAnimations() {
    fadeController.forward();
    slideController.forward();
    scaleController.forward();
  }

  void _resetAnimations() {
    fadeController.reset();
    slideController.reset();
    scaleController.reset();
  }

  void nextPage() {
    if (currentPage.value < totalPages - 1) {
      currentPage.value++;
      pageController.animateToPage(
        currentPage.value,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
      );

      // Reset and restart animations for smooth transition
      _resetAnimations();
      Future.delayed(const Duration(milliseconds: 100), () {
        _startAnimations();
      });
    } else {
      completeOnboarding();
    }
  }

  void previousPage() {
    if (currentPage.value > 0) {
      currentPage.value--;
      pageController.animateToPage(
        currentPage.value,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
      );

      _resetAnimations();
      Future.delayed(const Duration(milliseconds: 100), () {
        _startAnimations();
      });
    }
  }

  void skip() {
    completeOnboarding();
  }

  void completeOnboarding() {
    // Navigate to signup screen (using offAllNamed to clear navigation stack)
    Get.offAllNamed('/register');
  }

  void onPageChanged(int index) {
    currentPage.value = index;
    _resetAnimations();
    Future.delayed(const Duration(milliseconds: 100), () {
      _startAnimations();
    });
  }
}
