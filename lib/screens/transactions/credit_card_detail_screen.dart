import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/models/card_models.dart';
import '../../core/models/transaction_model.dart';

class CreditCardDetailScreen extends StatefulWidget {
  const CreditCardDetailScreen({super.key});

  @override
  State<CreditCardDetailScreen> createState() => _CreditCardDetailScreenState();
}

class _CreditCardDetailScreenState extends State<CreditCardDetailScreen> {
  final CardModel cardData = CardModel(
    name: "John Smith",
    type: "Amazon Platinium",
    number: "4756  ••••  ••••  9018",
    balance: "3,469.52",
    isVisa: true,
  );

  final List<TransactionModel> transactions = [
    TransactionModel(
      title: "Buy Camera",
      date: "02/11/2018",
      amount: "- \$1200",
      icon: Icons.camera_alt,
      iconBgColor: const Color(0xFF5C6AC4),
    ),
    TransactionModel(
      title: "Buy Television",
      date: "02/11/2018",
      amount: "- \$1200",
      icon: Icons.tv,
      iconBgColor: const Color(0xFFFF5C8D),
    ),
    TransactionModel(
      title: "Buy Camera",
      date: "02/11/2018",
      amount: "- \$1200",
      icon: Icons.camera_alt,
      iconBgColor: const Color(0xFF439CFF),
    ),
    TransactionModel(
      title: "Buy Television",
      date: "02/11/2018",
      amount: "- \$1200",
      icon: Icons.tv,
      iconBgColor: const Color(0xFFFFB84D),
    ),
  ];

  @override
  Widget build(BuildContext context) {
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

          SafeArea(
            child: Column(
              children: [
                // Custom App Bar
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 20,
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
                        child: Text(
                          "Credit card",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(width: 48), // Balancing space
                    ],
                  ),
                ),

                DynamicVisaCard(card: cardData),

                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        const SizedBox(height: 10),
                        ...transactions.map((tx) => _buildTxItem(tx)),

                        _buildBottomSection(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTxItem(TransactionModel tx) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: tx.iconBgColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(tx.icon, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tx.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                tx.date,
                style: const TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ],
          ),
          const Spacer(),
          Text(
            tx.amount,
            style: const TextStyle(
              color: Color(0xFFFF5C8D),
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(color: Color(0xFFF0F0F8), thickness: 1),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "TOTAL",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
            ),
            Text(
              "-\$3100",
              style: TextStyle(
                color: Color(0xFFFF5C8D),
                fontWeight: FontWeight.w900,
                fontSize: 24,
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              hint: const Text(
                "Choose account/ card",
                style: TextStyle(color: Colors.grey),
              ),
              items: const [
                DropdownMenuItem(value: "visa", child: Text("VISA **** 9018")),
              ],
              onChanged: (value) {},
            ),
          ),
        ),
        const SizedBox(height: 20),

        const Text(
          "Get OTP to verify transaction",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),

        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "OTP",
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF0F0F8),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    "Get OTP",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 30),

        SizedBox(
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFB8B8D2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 0,
            ),
            child: const Text(
              "Pay",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}

class DynamicVisaCard extends StatelessWidget {
  final CardModel card;
  const DynamicVisaCard({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 240,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            bottom: 18,
            child: Container(
              height: 180,
              width: MediaQuery.of(context).size.width * 0.65,
              decoration: BoxDecoration(
                color: AppColors.primaryPurple,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
          Positioned(
            bottom: 28,
            child: Container(
              height: 150,
              width: MediaQuery.of(context).size.width * 0.75,
              decoration: BoxDecoration(
                color: const Color(0xFFFF5E7E),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            height: 200,
            width: double.infinity,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: const Color(0xFF1A3BB2),
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 15,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                  left: -MediaQuery.of(context).size.width * 0.25,
                  top: -30,
                  bottom: -50,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: const BoxDecoration(
                      color: Color(0xFF0D1B6E),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        card.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        card.type,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        card.number,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$${card.balance}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            "VISA",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
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
}
