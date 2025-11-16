import 'package:fintek/app/modules/Onboarding/views/onboarding_screen.dart';
import 'package:fintek/app/modules/Splash/views/onboarding2.dart';
import 'package:fintek/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

class Onboarding1 extends StatefulWidget {
  const Onboarding1({super.key});

  @override
  State<Onboarding1> createState() => _Onboarding1State();
}

class _Onboarding1State extends State<Onboarding1>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _logoScale;
  late Animation<double> _logoOpacity;
  late Animation<double> _titleOpacity;
  late Animation<Offset> _titleOffset;
  late Animation<double> _exitOpacity;
  late Animation<double> _exitScale;
  bool _exiting = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1800),
      vsync: this,
    );

    // Logo scales up and fades in quickly
    _logoScale = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.4, curve: Curves.easeOutBack),
      ),
    );
    _logoOpacity = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.45, curve: Curves.easeIn),
    );

    // Title fades and slides up slightly after the logo
    _titleOpacity = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.35, 0.75, curve: Curves.easeIn),
    );
    _titleOffset = Tween<Offset>(begin: const Offset(0, 0.12), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.35, 0.75, curve: Curves.easeOut),
          ),
        );

    // Exit animation: fade out and scale down
    _exitOpacity = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.82, 1.0, curve: Curves.easeIn),
      ),
    );
    _exitScale = Tween<double>(begin: 1.0, end: 0.92).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.85, 1.0, curve: Curves.easeIn),
      ),
    );

    _controller.forward();

    _controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed && mounted && !_exiting) {
        setState(() {
          _exiting = true;
        });
        // Play exit animation
        await Future.delayed(const Duration(milliseconds: 320));
        if (!mounted) return;
        // Use a crossfade transition to onboarding2
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (context, animation, secondaryAnimation) {
              return FadeTransition(
                opacity: animation,
                child: const OnboardingScreen(),
              );
            },
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              // Apply exit fade/scale if exiting
              final double exitOpacity = _exiting ? _exitOpacity.value : 1.0;
              final double exitScale = _exiting ? _exitScale.value : 1.0;
              return Opacity(
                opacity: exitOpacity,
                child: Transform.scale(
                  scale: exitScale,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Animated logo: scale + fade
                      Opacity(
                        opacity: _logoOpacity.value,
                        child: Transform.scale(
                          scale: _logoScale.value,
                          child: Image.asset(
                            "assets/vectors/finTekLogo1.png",
                            width: 160,
                            height: 160,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),

                      // Animated title: slide up + fade in
                      SlideTransition(
                        position: _titleOffset,
                        child: FadeTransition(
                          opacity: _titleOpacity,
                          child: Text(
                            "FinWise",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 52.14,
                              color: AppColors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
