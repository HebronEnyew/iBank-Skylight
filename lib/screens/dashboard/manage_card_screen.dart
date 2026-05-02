import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class CardModel {
  final String name;
  final String type;
  final String number;
  final String balance;
  final bool isVisa;

  CardModel({
    required this.name,
    required this.type,
    required this.number,
    required this.balance,
    required this.isVisa,
  });
}

class ManageCardsScreen extends StatefulWidget {
  const ManageCardsScreen({super.key});

  @override
  State<ManageCardsScreen> createState() => _ManageCardsScreenState();
}

class _ManageCardsScreenState extends State<ManageCardsScreen> {
  bool isCardSelected = true;
  bool isLoading = false;

  List<CardModel> myCards = [
    CardModel(
      name: "John Smith",
      type: "Amazon Platinum",
      number: "4756  ••••  ••••  9018",
      balance: "3,469.52",
      isVisa: true,
    ),
    CardModel(
      name: "John Smith",
      type: "Amazon Platinum",
      number: "4756  ••••  ••••  9018",
      balance: "3,469.52",
      isVisa: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Account and card",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  _buildToggleSwitch(),
                  const SizedBox(height: 30),
                  Expanded(
                    child: ListView.builder(
                      itemCount: myCards.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final card = myCards[index];
                        return card.isVisa
                            ? _buildVisaCard(card)
                            : _buildMasterCard(card);
                      },
                    ),
                  ),
                  _buildAddButton(),
                ],
              ),
            ),
    );
  }

  Widget _buildToggleSwitch() {
    return Container(
      height: 55,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F0F8),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          _buildToggleItem("Account", !isCardSelected),
          _buildToggleItem("Card", isCardSelected),
        ],
      ),
    );
  }

  Widget _buildToggleItem(String text, bool selected) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => isCardSelected = (text == "Card")),
        child: Container(
          decoration: BoxDecoration(
            color: selected ? AppColors.primaryPurple : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: selected ? Colors.white : Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVisaCard(CardModel card) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: 200,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: const Color(0xFF1A3BB2),
        borderRadius: BorderRadius.circular(25),
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
          Positioned(
            right: -60,
            top: -70,
            child: Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(67, 156, 255, 0.6),
              ),
            ),
          ),
          _buildCardTextContent(card, "VISA"),
        ],
      ),
    );
  }

  Widget _buildMasterCard(CardModel card) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: 200,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: const Color(0xFFFFB84D),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Stack(
        children: [
          _buildCircleOverlay(-0.15, -0.1, 0.7),
          _buildCircleOverlay(0.15, 0.6, 0.5, isBottom: true),
          _buildCircleOverlay(0.58, 0.38, 0.1),
          _buildCardTextContent(card, "MASTER"),
        ],
      ),
    );
  }

  Widget _buildCircleOverlay(
    double x,
    double y,
    double sizeMult, {
    bool isBottom = false,
  }) {
    return Positioned(
      left: !isBottom ? MediaQuery.of(context).size.width * x : null,
      right: isBottom ? -MediaQuery.of(context).size.width * 0.2 : null,
      top: !isBottom ? MediaQuery.of(context).size.width * y : null,
      bottom: isBottom ? -MediaQuery.of(context).size.width * 0.2 : null,
      child: Container(
        width: MediaQuery.of(context).size.width * sizeMult,
        height: MediaQuery.of(context).size.width * sizeMult,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(255, 203, 122, 0.6),
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget _buildCardTextContent(CardModel card, String brand) {
    return Padding(
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
          const SizedBox(height: 15),
          Text(
            card.type,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
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
              brand == "VISA"
                  ? const Text(
                      "VISA",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                      ),
                    )
                  : _buildMasterCardLogo(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMasterCardLogo() {
    return Row(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
        Transform.translate(
          offset: const Offset(-12, 0),
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAddButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, top: 10),
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryPurple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: const Text(
            "Add card",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
