import 'package:fintek/shared/constants/app_colors.dart';
import 'package:fintek/shared/widgets/button.dart';
import 'package:fintek/shared/widgets/button1.dart';
import 'package:fintek/shared/widgets/textbutton.dart';
import 'package:flutter/material.dart';

class Onboarding2 extends StatefulWidget {
  const Onboarding2({super.key});

  @override
  State<Onboarding2> createState() => _Onboarding2State();
}

class _Onboarding2State extends State<Onboarding2>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _logoOpacity;
  late final Animation<Offset> _logoOffset;

  late final Animation<double> _titleOpacity;
  late final Animation<double> _titleScale;

  late final Animation<double> _subtitleOpacity;

  late final Animation<double> _loginOpacity;
  late final Animation<Offset> _loginOffset;

  late final Animation<double> _signupOpacity;
  late final Animation<Offset> _signupOffset;

  late final Animation<double> _textButtonOpacity;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1100),
      vsync: this,
    );

    // Staggered intervals
    _logoOpacity = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.22, curve: Curves.easeOut),
    );
    _logoOffset = Tween<Offset>(begin: const Offset(0, -0.12), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.0, 0.28, curve: Curves.easeOut),
          ),
        );

    _titleOpacity = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.18, 0.42, curve: Curves.easeOut),
    );
    _titleScale = Tween<double>(begin: 0.96, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.18, 0.45, curve: Curves.easeOutBack),
      ),
    );

    _subtitleOpacity = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.35, 0.55, curve: Curves.easeOut),
    );

    _loginOpacity = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.55, 0.72, curve: Curves.easeOut),
    );
    _loginOffset = Tween<Offset>(begin: const Offset(0, 0.08), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.55, 0.75, curve: Curves.easeOut),
          ),
        );

    _signupOpacity = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.68, 0.86, curve: Curves.easeOut),
    );
    _signupOffset =
        Tween<Offset>(begin: const Offset(0, 0.08), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.68, 0.9, curve: Curves.easeOut),
          ),
        );

    _textButtonOpacity = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.82, 1.0, curve: Curves.easeOut),
    );

    // Start the entrance animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: SizedBox(
                height: constraints.maxHeight,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 24),

                      // Logo with slide + fade
                      SlideTransition(
                        position: _logoOffset,
                        child: FadeTransition(
                          opacity: _logoOpacity,
                          child: Image.asset(
                            "assets/vectors/finTekLogo2.png",
                            width: 160,
                            height: 160,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Title with scale + fade
                      FadeTransition(
                        opacity: _titleOpacity,
                        child: ScaleTransition(
                          scale: _titleScale,
                          child: Text(
                            "FinWise",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 52.14,
                              color: AppColors.success,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),

                      // Subtitle
                      FadeTransition(
                        opacity: _subtitleOpacity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 36),
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur \nadipiscing elit",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Login button
                      SlideTransition(
                        position: _loginOffset,
                        child: FadeTransition(
                          opacity: _loginOpacity,
                          child: CustomButton(
                            text: 'Log In',
                            onPressed: () {},
                            width: 220,
                            height: 50,
                            textColor: Colors.black,
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Signup button
                      SlideTransition(
                        position: _signupOffset,
                        child: FadeTransition(
                          opacity: _signupOpacity,
                          child: CustomButton1(
                            text: 'Sign Up',
                            onPressed: () {},
                            width: 220,
                            height: 50,
                            backgroundColor: Colors.grey.shade300,
                            textColor: Colors.black,
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      FadeTransition(
                        opacity: _textButtonOpacity,
                        child: CustomTextButton(
                          text: 'Forgot Password?',
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
