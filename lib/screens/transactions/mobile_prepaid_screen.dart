import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class MobilePrepaidScreen extends StatefulWidget {
  const MobilePrepaidScreen({super.key});

  @override
  State<MobilePrepaidScreen> createState() => _MobilePrepaidScreenState();
}

class _MobilePrepaidScreenState extends State<MobilePrepaidScreen> {
  String selectedBeneficiary = "Emma";
  String selectedAmount = "\$10";

  final List<Map<String, String>> directory = [
    {"name": "Emma", "image": "assets/images/emma.webp"},
    {"name": "Justin", "image": "assets/images/justin.webp"},
  ];

  final List<String> amounts = ["\$10", "\$20", "\$30"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Mobile prepaid",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Choose account/ card",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            _buildDropdownField("VISA **** **** **** 1234"),
            const Padding(
              padding: EdgeInsets.only(top: 8, bottom: 25),
              child: Text(
                "Available balance : 10,000\$",
                style: TextStyle(
                  color: AppColors.primaryPurple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Directory",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Find beneficiary",
                    style: TextStyle(
                      color: AppColors.primaryPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 130,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildAddButton(),
                  ...directory.map((person) => _buildContactItem(person)),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Phone number",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            _buildTextField("+8564757899"),

            const SizedBox(height: 30),

            const Text(
              "Choose amount",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: amounts.map((amt) => _buildAmountChip(amt)).toList(),
            ),

            const SizedBox(height: 60),

            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  "Confirm",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownField(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildTextField(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: TextEditingController(text: text),
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        decoration: const InputDecoration(border: InputBorder.none),
      ),
    );
  }

  Widget _buildAddButton() {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8FF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Icon(Icons.add, color: Colors.grey, size: 35),
    );
  }

  Widget _buildContactItem(Map<String, String> person) {
    bool isSelected = selectedBeneficiary == person['name'];
    return GestureDetector(
      onTap: () => setState(() => selectedBeneficiary = person['name']!),
      child: Container(
        width: 100,
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF3B3DBF) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: isSelected ? null : Border.all(color: Colors.grey.shade100),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(person['image']!),
            ),
            const SizedBox(height: 10),
            Text(
              person['name']!,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAmountChip(String amount) {
    bool isSelected = selectedAmount == amount;
    return GestureDetector(
      onTap: () => setState(() => selectedAmount = amount),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.26,
        height: 70,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF3B3DBF) : const Color(0xFFFDFDFD),
          borderRadius: BorderRadius.circular(15),
          boxShadow: isSelected
              ? []
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 10,
                  ),
                ],
        ),
        alignment: Alignment.center,
        child: Text(
          amount,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
