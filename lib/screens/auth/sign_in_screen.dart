import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
// import '../../core/constants/app_assets.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/inputs/custom_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // Controllers to capture text
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  //  API Logic
  Future<void> _handleSignIn() async {
    if (_phoneController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter your credentials")),
      );
      return;
    }

    setState(() => _isLoading = true);

    // Simulate API delay
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      setState(() => _isLoading = false);
      debugPrint("Logged in with: ${_phoneController.text}");
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
                    "Sign in",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
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
                    const Text(
                      AppStrings.signInTitle,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryPurple,
                      ),
                    ),
                    const Text(
                      AppStrings.signInSubtitle,
                      style: TextStyle(color: Color(0xFF464545), fontSize: 16),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Image.asset(
                          'assets/images/signin_hero.png',
                          height: 180,
                        ),
                      ),
                    ),

                    CustomTextField(
                      hint: "Phone Number",
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                    ),
                    CustomTextField(
                      hint: "Password",
                      suffixIcon: Icons.keyboard_arrow_down,
                      isPassword: true,
                      controller: _passwordController,
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // TODO: Navigate to Forgot Password
                        },
                        child: const Text(
                          "Forgot your password ?",
                          style: TextStyle(color: Color(0xFF464545)),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    _isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : PrimaryButton(
                            text: "Sign in",
                            // onPressed: () => _handleSignIn(),
                            onPressed: () => Navigator.pushReplacementNamed(
                              context,
                              '/home',
                            ),
                          ),

                    const SizedBox(height: 30),
                    Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.fingerprint,
                            size: 80,
                            color: AppColors.primaryPurple,
                          ),
                          const SizedBox(height: 30),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const Text.rich(
                              TextSpan(
                                text: "Don't have an account?  ",
                                style: TextStyle(color: Color(0xFF464545)),
                                children: [
                                  TextSpan(
                                    text: "Sign Up",
                                    style: TextStyle(
                                      color: AppColors.primaryPurple,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
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
