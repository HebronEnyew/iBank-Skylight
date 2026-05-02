import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/models/card_models.dart';
import '../../widgets/cards/dynamic_visa_card.dart';

class TransactionResultScreen extends StatelessWidget {
  const TransactionResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CardModel cardData = CardModel(
      name: "John Smith",
      type: "Amazon Platinium",
      number: "4756  ••••  ••••  9018",
      balance: "3,469.52",
      isVisa: true,
    );

    return Scaffold(
      backgroundColor: AppColors.primaryPurple,
      body: Stack(
        children: [
          Positioned.fill(
            top: 100,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
            ),
          ),

          // CONTENT
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 8,
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
                      const Expanded(
                        child: SizedBox(
                          child: Text(
                            "Transaction report",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 48),
                    ],
                  ),
                ),

                DynamicVisaCard(card: cardData),

                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    physics: const BouncingScrollPhysics(),
                    children: [
                      _buildSectionHeader("Today"),
                      _buildReportItem(
                        title: "Water Bill",
                        subtitle: "Unsuccessfully",
                        amount: "- \$280",
                        icon: Icons.opacity,
                        iconColor: const Color(0xFF3F46AD),
                        isIncome: false,
                      ),
                      const SizedBox(height: 10),
                      _buildSectionHeader("Yesterday"),
                      _buildReportItem(
                        title: "Income: Salary Oct",
                        subtitle: "",
                        amount: "+ \$1200",
                        icon: Icons.card_giftcard,
                        iconColor: const Color(0xFFFF5E7E),
                        isIncome: true,
                      ),
                      _buildReportItem(
                        title: "Electric Bill",
                        subtitle: "Successfully",
                        amount: "- \$480",
                        icon: Icons.bolt,
                        iconColor: const Color(0xFF439CFF),
                        isIncome: false,
                      ),
                      _buildReportItem(
                        title: "Income: Jane transfers",
                        subtitle: "",
                        amount: "+ \$500",
                        icon: Icons.list_alt,
                        iconColor: const Color(0xFFFFB84D),
                        isIncome: true,
                      ),
                      _buildReportItem(
                        title: "Internet Bill",
                        subtitle: "Successfully",
                        amount: "- \$100",
                        icon: Icons.receipt_long,
                        iconColor: const Color(0xFF53D0B4),
                        isIncome: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildReportItem({
    required String title,
    required String subtitle,
    required String amount,
    required IconData icon,
    required Color iconColor,
    required bool isIncome,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                if (subtitle.isNotEmpty)
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              color: isIncome
                  ? const Color(0xFF3F46AD)
                  : const Color(0xFFFF5E7E),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
