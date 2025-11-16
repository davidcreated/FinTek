import 'package:fintek/app/modules/Onboarding/controllers/onboarding_controller.dart';
import 'package:fintek/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        onPageChanged: controller.onPageChanged,
        // Re-enable swipe gesture for better UX
        children: [
          _buildPage1(controller),
          _buildPage2(controller),
        ],
      ),
    );
  }

  // Page 1: Welcome To Expense Manager
  Widget _buildPage1(OnboardingController controller) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.primary, // Teal/turquoise background
      ),
      child: Column(
        children: [
          // Top section with title
          Expanded(
            flex: 4,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: SlideTransition(
                  position: controller.slideAnimation,
                  child: FadeTransition(
                    opacity: controller.fadeAnimation,
                    child: const Text(
                      'Welcome To\nExpense Manager',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 34,
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Bottom card section
          Expanded(
            flex: 6,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFDFF7E2), // Light cream/beige color
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  
                  // Illustration with hand and coins
                  Expanded(
                    child: ScaleTransition(
                      scale: controller.scaleAnimation,
                      child: FadeTransition(
                        opacity: controller.fadeAnimation,
                        child: _buildFloatingCoinsIllustration(controller),
                      ),
                    ),
                  ),

                  // Bottom section with Next button and indicators
                  FadeTransition(
                    opacity: controller.fadeAnimation,
                    child: _buildBottomSection(controller),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Page 2: Track All Your Transactions
  Widget _buildPage2(OnboardingController controller) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.primary, // Same teal/turquoise background
      ),
      child: Column(
        children: [
          // Top section with title
          Expanded(
            flex: 4,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: SlideTransition(
                  position: controller.slideAnimation,
                  child: FadeTransition(
                    opacity: controller.fadeAnimation,
                    child: const Text(
                      'Track All Your\nTransactions',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 34,
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Bottom card section
          Expanded(
            flex: 6,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFDFF7E2), // Light cream/beige color
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  
                  // Illustration
                  Expanded(
                    child: ScaleTransition(
                      scale: controller.scaleAnimation,
                      child: FadeTransition(
                        opacity: controller.fadeAnimation,
                        child: _buildTrackingIllustration(controller),
                      ),
                    ),
                  ),

                  // Bottom section with Next button and indicators
                  FadeTransition(
                    opacity: controller.fadeAnimation,
                    child: _buildBottomSection(controller),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Floating coins illustration with hand
  Widget _buildFloatingCoinsIllustration(OnboardingController controller) {
    return AnimatedBuilder(
      animation: controller.floatingAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, controller.floatingAnimation.value),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Background circle with subtle pulsing effect
              AnimatedBuilder(
                animation: controller.floatingController,
                builder: (context, child) {
                  return Container(
                    width: 280 + (controller.floatingAnimation.value / 2).abs(),
                    height: 280 + (controller.floatingAnimation.value / 2).abs(),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFB8E6D5).withOpacity(0.3),
                    ),
                  );
                },
              ),

              // Hand with coins image
              Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset(
                  'assets/images/OnboardingA.png',
                  width: 240,
                  height: 240,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Tracking illustration for page 2
  Widget _buildTrackingIllustration(OnboardingController controller) {
    return AnimatedBuilder(
      animation: controller.floatingAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, controller.floatingAnimation.value),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Background circle with subtle pulsing effect
              AnimatedBuilder(
                animation: controller.floatingController,
                builder: (context, child) {
                  return Container(
                    width: 280 + (controller.floatingAnimation.value / 2).abs(),
                    height: 280 + (controller.floatingAnimation.value / 2).abs(),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFB8E6D5).withOpacity(0.3),
                    ),
                  );
                },
              ),

              // Tracking illustration image
              Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset(
                  'assets/images/OnboardingB.png',
                  width: 240,
                  height: 240,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Bottom section with Next text and page indicators
  Widget _buildBottomSection(OnboardingController controller) {
    return Container(
      padding: const EdgeInsets.only(
        left: 40,
        right: 40,
        bottom: 50,
        top: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Next text (clickable) with scale animation on tap
          Obx(
            () => _AnimatedButton(
              onTap: controller.nextPage,
              child: Text(
                controller.currentPage.value == controller.totalPages - 1
                    ? 'Get Started'
                    : 'Next',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                  letterSpacing: -0.3,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Page indicators (dots) with smooth animations
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                controller.totalPages,
                (index) => _AnimatedPageIndicator(
                  isActive: controller.currentPage.value == index,
                  index: index,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom animated button widget with scale effect
class _AnimatedButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;

  const _AnimatedButton({
    required this.child,
    required this.onTap,
  });

  @override
  State<_AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<_AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) {
        _controller.reverse();
        widget.onTap();
      },
      onTapCancel: () => _controller.reverse(),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: widget.child,
      ),
    );
  }
}

// Animated page indicator dot
class _AnimatedPageIndicator extends StatelessWidget {
  final bool isActive;
  final int index;

  const _AnimatedPageIndicator({
    required this.isActive,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOutCubic,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      width: isActive ? 10 : 10,
      height: isActive ? 10 : 10,
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.primary
            : AppColors.primary.withOpacity(0.2),
        shape: BoxShape.circle,
        boxShadow: isActive
            ? [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.4),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
              ]
            : null,
      ),
    );
  }
}
