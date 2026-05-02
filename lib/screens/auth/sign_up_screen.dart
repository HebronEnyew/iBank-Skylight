import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../../core/constants/app_assets.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/inputs/custom_text_field.dart';
import './sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;
  bool _agreeToTerms = true;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleSignUp() async {
    if (_nameController.text.isEmpty || _phoneController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields")),
      );
      return;
    }

    setState(() => _isLoading = true);

    // Simulate API delay
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      setState(() => _isLoading = false);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignInScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryPurple,
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 10,
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Text(
                    AppStrings.signUpHeader,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.signUpTitle,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryPurple,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const Text(
                      AppStrings.signUpSubtitle,
                      style: TextStyle(
                        color: Color.fromARGB(255, 76, 75, 75),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Image.asset(AppAssets.authHero, height: 180),
                      ),
                    ),
                    CustomTextField(
                      hint: AppStrings.labelFullName,
                      controller: _nameController,
                    ),
                    CustomTextField(
                      hint: "(+84) 332249402",
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                    ),
                    CustomTextField(
                      hint: "**********",
                      suffixIcon: Icons.keyboard_arrow_down,
                      isPassword: true,
                      controller: _passwordController,
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () =>
                          setState(() => _agreeToTerms = !_agreeToTerms),
                      child: Row(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.primaryPurple,
                              ),
                              borderRadius: BorderRadius.circular(4),
                              color: _agreeToTerms
                                  ? AppColors.primaryPurple
                                  : Colors.transparent,
                            ),
                            child: _agreeToTerms
                                ? const Icon(
                                    Icons.check,
                                    size: 18,
                                    color: Colors.white,
                                  )
                                : null,
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Text.rich(
                              TextSpan(
                                text:
                                    "By creating an account your agree to our ",
                                children: [
                                  TextSpan(
                                    text: "Terms and Conditions",
                                    style: TextStyle(
                                      color: AppColors.primaryPurple,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    _isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : PrimaryButton(
                            text: "Sign up",
                            onPressed: _agreeToTerms ? _handleSignUp : null,
                          ),
                    const SizedBox(height: 20),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignInScreen(),
                            ),
                          );
                        },
                        child: Text.rich(
                          TextSpan(
                            text: "Have an account?  ",
                            style: const TextStyle(
                              color: Color.fromARGB(255, 108, 108, 108),
                            ),
                            children: [
                              TextSpan(
                                text: "Sign In",
                                style: TextStyle(
                                  color: AppColors.primaryPurple,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
