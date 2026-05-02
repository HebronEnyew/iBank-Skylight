import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class SavingsPlan {
  final String accountNumber;
  final double availableBalance;
  final int durationMonths;
  final double interestRate;
  final double defaultDeposit;

  SavingsPlan({
    required this.accountNumber,
    required this.availableBalance,
    required this.durationMonths,
    required this.interestRate,
    required this.defaultDeposit,
  });
}

class AddSavingsScreen extends StatefulWidget {
  const AddSavingsScreen({super.key});

  @override
  State<AddSavingsScreen> createState() => _AddSavingsScreenState();
}

class _AddSavingsScreenState extends State<AddSavingsScreen> {
  late SavingsPlan _currentPlan;

  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _currentPlan = SavingsPlan(
      accountNumber: "1900 8988 5456",
      availableBalance: 10000.0,
      durationMonths: 12,
      interestRate: 5.0,
      defaultDeposit: 3000.0,
    );

    _accountController.text = "Account ${_currentPlan.accountNumber}";
    _durationController.text = "${_currentPlan.durationMonths} months";
    _amountController.text = "\$ ${_currentPlan.defaultDeposit.toInt()}";
  }

  @override
  void dispose() {
    _accountController.dispose();
    _durationController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Add",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Image.asset(
                'assets/images/add_savings.png',
                height: 250,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 250,
                  width: 300,
                  color: Colors.grey[50],
                  child: const Icon(
                    Icons.savings_outlined,
                    size: 80,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            //  FORM CARD
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 25,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInputField(
                    controller: _accountController,
                    label:
                        "Available balance: ${_currentPlan.availableBalance.toInt()}\$",
                  ),
                  const SizedBox(height: 24),

                  _buildInputField(
                    controller: _durationController,
                    label:
                        "Interest rate ${_currentPlan.interestRate.toInt()}%/ ${_currentPlan.durationMonths} months",
                  ),
                  const SizedBox(height: 24),

                  _buildInputField(controller: _amountController, isLast: true),
                  const SizedBox(height: 40),

                  SizedBox(
                    width: double.infinity,
                    height: 58,
                    child: ElevatedButton(
                      onPressed: () {
                        print("Verifying Savings: ${_amountController.text}");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        "Verify",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    String? label,
    bool isLast = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 18,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: AppColors.primaryPurple,
                width: 2,
              ),
            ),
          ),
        ),
        if (label != null) ...[
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(
              label,
              style: const TextStyle(
                color: AppColors.primaryPurple,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
