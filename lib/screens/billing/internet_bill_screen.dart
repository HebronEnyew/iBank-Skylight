import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../widgets/buttons/primary_button.dart';

class InternetBillScreen extends StatelessWidget {
  const InternetBillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const String userName = "Jackson Maine";
    const String address = "403 East 4th Street,\nSanta Ana";
    const String phoneNumber = "+8424599721";
    const String billCode = "#2343543";
    const String dateFrom = "01/10/2019";
    const String dateTo = "01/11/2019";
    const double internetFee = 50.0;
    const double tax = 10.0;
    const double total = internetFee + tax;

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
          "Internet bill",
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
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.wifi_tethering,
                    size: 100,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ),

            Text(
              "$dateFrom - $dateTo",
              style: const TextStyle(color: AppColors.textDark, fontSize: 14),
            ),

            const SizedBox(height: 20),

            // Billing Details Card
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
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildDetailRow("Name", userName),
                  _buildDetailRow("Address", address, isMultiLine: true),
                  _buildDetailRow("Phone number", phoneNumber),
                  _buildDetailRow("Code", billCode),
                  _buildDetailRow("From", dateFrom),
                  _buildDetailRow("To", dateTo),

                  const SizedBox(height: 10),
                  const Text(
                    "------------------------------------------",
                    maxLines: 1,
                    style: TextStyle(color: Colors.grey, letterSpacing: 2),
                  ),

                  _buildDetailRow(
                    "Internet fee",
                    "\$${internetFee.toInt()}",
                    valueColor: const Color(0xFF3D30A2),
                  ),
                  _buildDetailRow(
                    "Tax",
                    "\$${tax.toInt()}",
                    valueColor: const Color(0xFF3D30A2),
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
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "\$${total.toInt()}",
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
                  // Logic for payment processing
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
          Text(
            label,
            style: const TextStyle(color: AppColors.textDark, fontSize: 14),
          ),
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
