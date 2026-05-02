import 'package:flutter/material.dart';
import '../../core/models/beneficiary_model.dart';
import '../../core/constants/app_colors.dart';
import 'beneficiary_detail_screen.dart';

class BeneficiaryListScreen extends StatefulWidget {
  const BeneficiaryListScreen({super.key});

  @override
  State<BeneficiaryListScreen> createState() => _BeneficiaryListScreenState();
}

class _BeneficiaryListScreenState extends State<BeneficiaryListScreen> {
  final List<Map<String, dynamic>> beneficiaryGroups = [
    {
      "section": "Transfer via card number",
      "items": [
        BeneficiaryModel(name: "Push", accountNumber: "1234 5678 990"),
        BeneficiaryModel(name: "Olivia", accountNumber: "1245 8762 231"),
      ],
    },
    {
      "section": "Transfer to the same bank",
      "items": [
        BeneficiaryModel(name: "Alexander", accountNumber: "1278 9909 890"),
        BeneficiaryModel(name: "Harper", accountNumber: "1345 5762 231"),
      ],
    },
    {
      "section": "Transfer to another bank",
      "items": [
        BeneficiaryModel(name: "Thomas", accountNumber: "1278 9909 890"),
        BeneficiaryModel(name: "Sanmatha", accountNumber: "1345 5762 231"),
        BeneficiaryModel(name: "Justin Biber", accountNumber: "1278 9909 890"),
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Beneficiary",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.black),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        itemCount: beneficiaryGroups.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final group = beneficiaryGroups[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                group["section"],
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              ...group["items"]
                  .map<Widget>((beneficiary) => _buildUserTile(beneficiary))
                  .toList(),
              const SizedBox(height: 15),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primaryPurple,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }

  Widget _buildUserTile(BeneficiaryModel user) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BeneficiaryDetailScreen(beneficiary: user),
          ),
        );
      },

      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey[200],
              backgroundImage: const AssetImage('assets/images/emma.webp'),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  user.accountNumber,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
