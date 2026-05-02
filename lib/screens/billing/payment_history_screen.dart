import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class PaymentHistoryScreen extends StatefulWidget {
  const PaymentHistoryScreen({super.key});

  @override
  State<PaymentHistoryScreen> createState() => _PaymentHistoryScreenState();
}

class _PaymentHistoryScreenState extends State<PaymentHistoryScreen> {
  String selectedCategory = "Electric";

  final List<Map<String, dynamic>> historyData = [
    {
      "month": "October",
      "date": "30/10/2019",
      "status": "Unsuccessfully",
      "internetAmt": "\$50",
      "electricAmt": "\$480",
      "internetCompany": "Capi Telecom",
      "electricCompany": "Electric Co.",
    },
    {
      "month": "September",
      "date": "30/09/2019",
      "status": "Successfully",
      "internetAmt": "\$50",
      "electricAmt": "\$480",
      "internetCompany": "Capi Telecom",
      "electricCompany": "Electric Co.",
    },
    {
      "month": "August",
      "date": "30/08/2019",
      "status": "Successfully",
      "internetAmt": "\$50",
      "electricAmt": "\$480",
      "internetCompany": "Capi Telecom",
      "electricCompany": "Electric Co.",
    },
    {
      "month": "July",
      "date": "30/07/2019",
      "status": "Successfully",
      "internetAmt": "\$50",
      "electricAmt": "\$480",
      "internetCompany": "Capi Telecom",
      "electricCompany": "Electric Co.",
    },
    {
      "month": "June",
      "date": "30/06/2019",
      "status": "Successfully",
      "internetAmt": "\$50",
      "electricAmt": "\$480",
      "internetCompany": "Capi Telecom",
      "electricCompany": "Electric Co.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FE),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Payment history",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              children: ["Electric", "Mobile", "Water", "Internet"].map((cat) {
                bool isSelected = selectedCategory == cat;
                return GestureDetector(
                  onTap: () => setState(() => selectedCategory = cat),
                  child: Container(
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF3D30A2)
                          : const Color(0xFFF0F0F8),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      cat,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: historyData.length,
              itemBuilder: (context, index) {
                final item = historyData[index];

                String displayAmt = selectedCategory == "Electric"
                    ? item['electricAmt']
                    : item['internetAmt'];
                String displayCompany = selectedCategory == "Electric"
                    ? item['electricCompany']
                    : item['internetCompany'];
                bool isFailed = item['status'] == "Unsuccessfully";

                return Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item['month'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            item['date'],
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _buildLeftInfo(
                            "Status",
                            item['status'],
                            isFailed ? Colors.redAccent : Colors.blueAccent,
                          ),
                          _buildRightInfo(
                            "Amount",
                            displayAmt,
                            AppColors.primaryPurple,
                            isBold: true,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      _buildLeftInfo(
                        "Company",
                        displayCompany,
                        AppColors.primaryPurple,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeftInfo(String label, String value, Color valColor) {
    return Row(
      children: [
        SizedBox(
          width: 70,
          child: Text(
            label,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: valColor,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildRightInfo(
    String label,
    String value,
    Color valColor, {
    bool isBold = false,
  }) {
    return Row(
      children: [
        Text(
          "$label  ",
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        ),
        Text(
          value,
          style: TextStyle(
            color: valColor,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
            fontSize: isBold ? 16 : 14,
          ),
        ),
      ],
    );
  }
}
