import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/models/bank_account.dart';
import '../../widgets/cards/account_detail_card.dart';

class AccountCardScreen extends StatelessWidget {
  const AccountCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<BankAccount> myAccounts = [
      BankAccount(
        label: "Account 1",
        accountNumber: "1900 8988 1234",
        balance: "\$20,000",
        branch: "New York",
      ),
      BankAccount(
        label: "Account 2",
        accountNumber: "8988 1234",
        balance: "\$12,000",
        branch: "New York",
      ),
      BankAccount(
        label: "Account 3",
        accountNumber: "1900 1234 2222",
        balance: "\$230,000",
        branch: "New York",
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Account and card",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F2F6),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: AppColors.primaryPurple,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            "Account",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          "Card",
                          style: TextStyle(
                            color: AppColors.textDark,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Profile Section
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/user_avatar.webp'),
            ),
            const SizedBox(height: 15),
            Text(
              "Push Puttichai",
              style: TextStyle(
                color: AppColors.primaryPurple,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),

            // ACCOUNT LIST
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: myAccounts.length,
                itemBuilder: (context, index) {
                  final account = myAccounts[index];
                  return AccountDetailCard(
                    label: account.label,
                    accountNumber: account.accountNumber,
                    balance: account.balance,
                    branch: account.branch,
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
