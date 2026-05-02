import 'package:flutter/material.dart';
import '../../core/models/transfer_model.dart';
import '../../core/constants/app_colors.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  bool saveToDirectory = false;
  bool isConfirmed = false;
  String selectedAccount = "VISA **** **** **** 1234";

  final TextEditingController nameController = TextEditingController();
  final TextEditingController cardController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    cardController.dispose();
    amountController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () {
            if (isConfirmed) {
              setState(() => isConfirmed = false);
            } else {
              Navigator.pop(context);
            }
          },
        ),
        title: Text(
          isConfirmed ? "Confirm Transfer" : "Transfer",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedAccount,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const Icon(Icons.unfold_more, color: Colors.grey),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              child: Text(
                "Available balance : 10,000\$",
                style: TextStyle(
                  color: AppColors.primaryPurple,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              "Choose transaction",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 15),

            Row(
              children: [
                _buildMethodItem(
                  Icons.credit_card,
                  "Transfer via\ncard number",
                  true,
                ),
                const SizedBox(width: 10),
                _buildMethodItem(
                  Icons.person_outline,
                  "Transfer to\nthe same bank",
                  false,
                ),
                const SizedBox(width: 10),
                _buildMethodItem(
                  Icons.account_balance,
                  "Transfer to\nanother bank",
                  false,
                ),
              ],
            ),

            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Choose beneficiary",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(
                  "Find beneficiary",
                  style: TextStyle(
                    color: AppColors.primaryPurple,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),

            Row(
              children: [
                _buildAddButton(),
                const SizedBox(width: 15),
                _buildAvatar("Emma"),
                const SizedBox(width: 15),
                _buildAvatar("Justin"),
              ],
            ),

            const SizedBox(height: 30),

            if (!isConfirmed) ...[
              _buildField("Name", nameController),
              _buildField("Card number", cardController),
              _buildField("Amount", amountController, isNumber: true),
              _buildField("Content", contentController),
            ] else ...[
              _buildStaticView(nameController.text),
              _buildStaticView(cardController.text),
              _buildStaticView("\$${amountController.text}"),
              _buildStaticView("\$${amountController.text}"),
              const Padding(
                padding: EdgeInsets.only(left: 12, bottom: 15),
                child: Text(
                  "One thousand dollar",
                  style: TextStyle(
                    color: AppColors.primaryPurple,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ],

            Row(
              children: [
                Checkbox(
                  value: saveToDirectory,
                  activeColor: AppColors.primaryPurple,
                  onChanged: (val) => setState(() => saveToDirectory = val!),
                ),
                const Text(
                  "Save to directory of beneficiary",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  if (!isConfirmed) {
                    final transfer = TransferModel(
                      account: selectedAccount,
                      beneficiaryName: nameController.text,
                      cardNumber: cardController.text,
                      amount: double.tryParse(amountController.text) ?? 0.0,
                      content: contentController.text,
                      saveToDirectory: saveToDirectory,
                    );

                    debugPrint(
                      "Proceeding to confirmation for: ${transfer.beneficiaryName}",
                    );
                    setState(() => isConfirmed = true);
                  } else {
                    debugPrint("Final transaction triggered!");
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  isConfirmed ? "Confirm" : "Continue",
                  style: const TextStyle(
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

  Widget _buildStaticView(String value) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Text(
        value,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildField(
    String hint,
    TextEditingController controller, {
    bool isNumber = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.primaryPurple),
          ),
        ),
      ),
    );
  }

  Widget _buildMethodItem(IconData icon, String label, bool isSelected) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryPurple : const Color(0xFFF0F0F8),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Icon(icon, color: isSelected ? Colors.white : Colors.grey),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddButton() {
    return Container(
      width: 80,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: const Icon(Icons.add, color: Color(0xFFE0E0E0), size: 35),
    );
  }

  Widget _buildAvatar(String name) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundColor: Color(0xFFF0F0F8),
            child: Icon(Icons.person, color: Colors.grey),
          ),
          const SizedBox(height: 12),
          Text(
            name,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
