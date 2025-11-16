import 'package:fintek/features/auth/presentation/controllers/signup_controller.dart';
import 'package:fintek/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:fintek/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: AppColors.primary),
        child: SafeArea(
          child: Column(
            children: [
              // Header with title
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: const Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                    letterSpacing: -0.5,
                  ),
                ),
              ),

              // Form content
              Expanded(
                child: Container(
                  width: double.infinity,

                  decoration: const BoxDecoration(
                    color: Color(0xFFF1FFF3),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(30),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          // Full Name
                          CustomTextField(
                            label: 'Full Name',
                            hintText: 'example@example.com',
                            controller: controller.fullNameController,
                            keyboardType: TextInputType.name,
                            validator: controller.validateFullName,
                          ),

                          const SizedBox(height: 20),

                          // Email
                          CustomTextField(
                            label: 'Email',
                            hintText: 'example@example.com',
                            controller: controller.emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: controller.validateEmail,
                          ),

                          const SizedBox(height: 20),

                          // Mobile Number
                          CustomTextField(
                            label: 'Mobile Number',
                            hintText: '+ 123 456 789',
                            controller: controller.mobileController,
                            keyboardType: TextInputType.phone,
                            validator: controller.validateMobile,
                          ),

                          const SizedBox(height: 20),

                          // Date of Birth
                          CustomTextField(
                            label: 'Date Of Birth',
                            hintText: 'DD / MM / YYY',
                            controller: controller.dobController,
                            readOnly: true,
                            onTap: () => controller.selectDate(context),
                            validator: controller.validateDOB,
                            suffixIcon: const Icon(
                              Icons.calendar_today_outlined,
                              color: AppColors.textSecondary,
                              size: 20,
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Password
                          Obx(
                            () => CustomTextField(
                              label: 'Password',
                              hintText: '••••••••',
                              controller: controller.passwordController,
                              obscureText: !controller.isPasswordVisible.value,
                              validator: controller.validatePassword,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  controller.isPasswordVisible.value
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: AppColors.textSecondary,
                                  size: 20,
                                ),
                                onPressed: controller.togglePasswordVisibility,
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Confirm Password
                          Obx(
                            () => CustomTextField(
                              label: 'Confirm Password',
                              hintText: '••••••••',
                              controller: controller.confirmPasswordController,
                              obscureText:
                                  !controller.isConfirmPasswordVisible.value,
                              validator: controller.validateConfirmPassword,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  controller.isConfirmPasswordVisible.value
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: AppColors.textSecondary,
                                  size: 20,
                                ),
                                onPressed:
                                    controller.toggleConfirmPasswordVisibility,
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Terms and conditions
                          Row(
                            children: [
                              Obx(
                                () => Checkbox(
                                  value: controller.agreedToTerms.value,
                                  onChanged: (value) {
                                    controller.agreedToTerms.value =
                                        value ?? false;
                                  },
                                  activeColor: AppColors.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: AppColors.textSecondary,
                                    ),
                                    children: [
                                      const TextSpan(
                                        text: 'By continuing, you agree to ',
                                      ),
                                      TextSpan(
                                        text: 'Terms of Use',
                                        style: const TextStyle(
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const TextSpan(text: ' and '),
                                      TextSpan(
                                        text: 'Privacy Policy',
                                        style: const TextStyle(
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const TextSpan(text: '.'),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 30),

                          // Sign Up Button
                          Obx(
                            () => SizedBox(
                              width: 207,
                              height: 45,
                              child: ElevatedButton(
                                onPressed: controller.isLoading.value
                                    ? null
                                    : controller.signUp,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  disabledBackgroundColor: AppColors.primary
                                      .withOpacity(0.6),
                                ),
                                child: controller.isLoading.value
                                    ? const SizedBox(
                                        width: 24,
                                        height: 24,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2.5,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                Colors.white,
                                              ),
                                        ),
                                      )
                                    : const Text(
                                        'Sign Up',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 0,
                                        ),
                                      ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Already have account
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already have an account?  ',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                              GestureDetector(
                                onTap: controller.navigateToLogin,
                                child: const Text(
                                  'Log In',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
