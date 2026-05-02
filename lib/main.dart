import 'package:flutter/material.dart';
import 'core/constants/app_colors.dart';

// SCREENS
import 'screens/auth/sign_in_screen.dart';
import 'screens/auth/sign_up_screen.dart';
import 'screens/auth/change_password_screen.dart';

import 'screens/dashboard/home_screen.dart';
import 'screens/dashboard/account_card_screen.dart';
import 'screens/dashboard/manage_card_screen.dart';
import 'screens/dashboard/transaction_report_screen.dart';

import 'screens/billing/pay_bill_menu_screen.dart';
import 'screens/billing/payment_history_screen.dart';

import 'screens/settings/language_screen.dart';
import 'screens/settings/branch_screen.dart';
import 'screens/settings/add_savings_screen.dart';
import 'screens/settings/chat_screen.dart';

import 'screens/transactions/transfer_screen.dart';
import 'screens/transactions/exchange_screen.dart';
import 'screens/transactions/withdraw_screen.dart';
import 'screens/transactions/mobile_prepaid_screen.dart';
import 'screens/transactions/beneficiary_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iBank Skylight',
      debugShowCheckedModeBanner: false,

      // Theme Configuration
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: AppColors.primaryPurple,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryPurple),
        fontFamily: 'satoshi',
      ),

      initialRoute: '/sign_in',

      // Routes
      routes: {
        // Auth Flow
        '/sign_in': (context) => const SignInScreen(),
        '/sign_up': (context) => const SignUpScreen(),
        '/change_password': (context) => const PasswordSuccessScreen(),

        // Dashboard Flow
        '/home': (context) => const HomeScreen(),
        '/account_details': (context) => const AccountCardScreen(),
        '/manage_cards': (context) => const ManageCardsScreen(),
        '/reports': (context) => const TransactionReportScreen(),

        // Billing Flow
        '/bills': (context) => const PayBillMenuScreen(),
        '/payment_history': (context) => const PaymentHistoryScreen(),

        // Settings Flow
        '/language': (context) => const LanguageScreen(),
        '/branches': (context) => const BranchScreen(),
        '/add_savings': (context) => const AddSavingsScreen(),
        '/chat': (context) => const ChatScreen(),

        // Transactions Flow
        '/transfer': (context) => const TransferScreen(),
        '/exchange': (context) => const ExchangeScreen(),
        '/withdraw': (context) => const WithdrawScreen(),
        '/mobile_prepaid': (context) => const MobilePrepaidScreen(),
        '/beneficiaries': (context) => const BeneficiaryListScreen(),
      },
    );
  }
}
