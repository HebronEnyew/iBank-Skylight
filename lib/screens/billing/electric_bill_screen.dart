import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../widgets/buttons/primary_button.dart';

class ElectricBillScreen extends StatelessWidget {
  const ElectricBillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const String customerName = "Jackson Maine";
    const String customerAddress = "403 East 4th Street,\nSanta Ana";
    const String phone = "+8424599721";
    const String billCode = "#2343543";
    const String billingPeriod = "01/10/2019 - 01/11/2019";
    const String startDate = "01/10/2019";
    const String endDate = "01/11/2019";
    const int fee = 470;
    const int tax = 10;
    const int total = fee + tax;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Electric bill",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: Image.asset(
                  'assets/images/electric_header.png',
                  height: 200,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.bolt_rounded,
                    size: 100,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ),

            Text(
              billingPeriod,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),

            const SizedBox(height: 20),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFFFBFBFF),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "All the Bills",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),

                  _buildDetailRow("Name", customerName),
                  _buildDetailRow(
                    "Address",
                    customerAddress,
                    isMultiLine: true,
                  ),
                  _buildDetailRow("Phone number", phone),
                  _buildDetailRow("Code", billCode),
                  _buildDetailRow("From", startDate),
                  _buildDetailRow("To", endDate),

                  const SizedBox(height: 10),
                  Text(
                    "------------------------------------------",
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.grey.shade300,
                      letterSpacing: 2,
                    ),
                  ),

                  _buildDetailRow(
                    "Electric fee",
                    "\$$fee",
                    valueColor: AppColors.primaryPurple,
                  ),
                  _buildDetailRow(
                    "Tax",
                    "\$$tax",
                    valueColor: AppColors.primaryPurple,
                  ),

                  const SizedBox(height: 10),
                  const Divider(thickness: 1, color: Color(0xFFEEEEEE)),
                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "TOTAL",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "\$$total",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFF5A5F),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(24.0),
              child: PrimaryButton(
                text: "Pay the bill",
                onPressed: () {
                  // This is where i'll call my payment API
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(
    String label,
    String value, {
    bool isMultiLine = false,
    Color? valueColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: isMultiLine
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 14)),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: valueColor ?? Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
