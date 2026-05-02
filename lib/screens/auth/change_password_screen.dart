import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
// import '../../core/constants/app_strings.dart';
// import '../../core/constants/app_assets.dart';
import '../../widgets/buttons/primary_button.dart';
import './sign_in_screen.dart';

class PasswordSuccessScreen extends StatelessWidget {
  const PasswordSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/change_password_successfully.png',
                height: 250,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 40),
            Text(
              "Change password successfully!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryPurple,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "You have successfully changed your password.\nPlease use the new password when signing in.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 16,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 40),

            PrimaryButton(
              text: "Ok",
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const SignInScreen()),
                  (route) => false,
                );
              },
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
