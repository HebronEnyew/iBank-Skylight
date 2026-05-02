import 'package:flutter/material.dart';
import '../../widgets/cards/visa_card.dart';
import '../../core/models/transaction.dart';

class TransactionReportScreen extends StatelessWidget {
  const TransactionReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double cardHeight = 240;

    final List<ChartData> monthlyData = [
      ChartData(label: "Jan", heightFactor: 0.4),
      ChartData(label: "Feb", heightFactor: 0.6),
      ChartData(label: "Mar", heightFactor: 0.9),
      ChartData(label: "Apr", heightFactor: 0.5, isSelected: true),
      ChartData(label: "May", heightFactor: 0.4),
      ChartData(label: "Jun", heightFactor: 0.7),
    ];

    final List<Transaction> todayTransactions = [
      Transaction(
        title: "Water Bill",
        subtitle: "Unsuccessfully",
        amount: "- \$280",
        icon: Icons.opacity,
        iconColor: const Color(0xFF3D30A2),
        isNegative: true,
      ),
    ];

    final List<Transaction> yesterdayTransactions = [
      Transaction(
        title: "Income: Salary Oct",
        subtitle: "Successfully",
        amount: "+ \$1200",
        icon: Icons.card_giftcard,
        iconColor: const Color(0xFFFF5E7E),
        isNegative: false,
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF3D30A2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Transaction report",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: cardHeight / 2),
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
                    padding: const EdgeInsets.only(
                      top: cardHeight / 2 + 20,
                      left: 24,
                      right: 24,
                      bottom: 24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Balance",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              "1000",
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF3D30A2),
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              "USD",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        //  CHART
                        SizedBox(
                          height: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: monthlyData
                                .map(
                                  (data) => ChartBar(
                                    label: data.label,
                                    heightFactor: data.heightFactor,
                                    isSelected: data.isSelected,
                                  ),
                                )
                                .toList(),
                          ),
                        ),

                        const SizedBox(height: 30),

                        // TODAY SECTION
                        if (todayTransactions.isNotEmpty) ...[
                          const Text(
                            "Today",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ...todayTransactions.map(
                            (tx) => TransactionItem(transaction: tx),
                          ),
                        ],

                        const SizedBox(height: 20),

                        // YESTERDAY SECTION
                        if (yesterdayTransactions.isNotEmpty) ...[
                          const Text(
                            "Yesterday",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ...yesterdayTransactions.map(
                            (tx) => TransactionItem(transaction: tx),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(top: 0, left: 0, right: 0, child: const VisaCard()),
        ],
      ),
    );
  }
}

// Helper Widgets
class ChartBar extends StatelessWidget {
  final String label;
  final double heightFactor;
  final bool isSelected;

  const ChartBar({
    super.key,
    required this.label,
    required this.heightFactor,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 12,
          height: 120 * heightFactor,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF3D30A2),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(6),
                    ),
                  ),
                ),
              ),
              Expanded(child: Container(color: const Color(0xFFFFB8E0))),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFFF5E7E),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(6),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isSelected ? const Color(0xFF3D30A2) : Colors.grey,
          ),
        ),
      ],
    );
  }
}

class TransactionItem extends StatelessWidget {
  final Transaction transaction;

  const TransactionItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: transaction.iconColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(transaction.icon, color: transaction.iconColor),
      ),
      title: Text(
        transaction.title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        transaction.subtitle,
        style: const TextStyle(color: Colors.grey, fontSize: 12),
      ),
      trailing: Text(
        transaction.amount,
        style: TextStyle(
          color: transaction.isNegative
              ? Colors.redAccent
              : const Color(0xFF3D30A2),
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
