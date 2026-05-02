import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import 'payment_history_screen.dart';
import 'electric_bill_screen.dart';
import 'internet_bill_screen.dart';

class PayBillMenuScreen extends StatelessWidget {
  const PayBillMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FE),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Pay the bill",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.history, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PaymentHistoryScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildBillMenuItem(
            context,
            title: "Electric bill",
            subtitle: "Pay electric bill this month",
            imagePath: 'assets/images/electric_bill_icon.png',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ElectricBillScreen(),
              ),
            ),
          ),
          _buildBillMenuItem(
            context,
            title: "Water bill",
            subtitle: "Pay water bill this month",
            imagePath: 'assets/images/water_bill_icon.png',
            onTap: () {},
          ),
          _buildBillMenuItem(
            context,
            title: "Mobile bill",
            subtitle: "Pay mobile bill this month",
            imagePath: 'assets/images/mobile_bill_icon.png',
            onTap: () {},
          ),
          _buildBillMenuItem(
            context,
            title: "Internet bill",
            subtitle: "Pay internet bill this month",
            imagePath: 'assets/images/internet_bill_icon.png',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const InternetBillScreen(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBillMenuItem(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String imagePath,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 80,
              height: 80,
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.receipt,
                  size: 50,
                  color: AppColors.primaryPurple.withOpacity(0.2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
