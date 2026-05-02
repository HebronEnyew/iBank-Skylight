import 'package:flutter/material.dart';
import '../../core/models/beneficiary_model.dart';
import '../../core/constants/app_colors.dart';

class BeneficiaryDetailScreen extends StatefulWidget {
  final BeneficiaryModel beneficiary;

  const BeneficiaryDetailScreen({super.key, required this.beneficiary});

  @override
  State<BeneficiaryDetailScreen> createState() =>
      _BeneficiaryDetailScreenState();
}

class _BeneficiaryDetailScreenState extends State<BeneficiaryDetailScreen> {
  late TextEditingController _nameController;
  late TextEditingController _accountController;

  String selectedBank = 'Citibank';
  String selectedBranch = 'New York';

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.beneficiary.name);
    _accountController = TextEditingController(
      text: widget.beneficiary.accountNumber,
    );
  }

  void _showSelector(String title, List<String> options, bool isBank) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            ...options.map(
              (option) => ListTile(
                title: Text(option),
                onTap: () {
                  setState(() {
                    if (isBank) {
                      selectedBank = option;
                    } else {
                      selectedBranch = option;
                    }
                  });
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryPurple,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Beneficiary",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            top: 60,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(24, 100, 24, 24),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInputField(
                      "Choose bank",
                      selectedBank,
                      isDropdown: true,
                      onTap: () => _showSelector("Choose Bank", [
                        "Citibank",
                        "Bank of America",
                        "Chase",
                      ], true),
                    ),
                    const SizedBox(height: 20),
                    _buildInputField(
                      "Choose branch",
                      selectedBranch,
                      isDropdown: true,
                      onTap: () => _showSelector("Choose Branch", [
                        "New York",
                        "Los Angeles",
                        "Chicago",
                      ], false),
                    ),
                    const SizedBox(height: 20),
                    _buildInputField(
                      "Transaction name",
                      _nameController.text,
                      controller: _nameController,
                    ),
                    const SizedBox(height: 20),
                    _buildInputField(
                      "Card number",
                      _accountController.text,
                      controller: _accountController,
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {
                          // Logic for API call
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
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
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[300],
                    child: const Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.beneficiary.name,
                  style: TextStyle(
                    color: AppColors.primaryPurple,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(
    String label,
    String initialValue, {
    bool isDropdown = false,
    TextEditingController? controller,
    VoidCallback? onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey.shade300),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller:
                  controller ?? TextEditingController(text: initialValue),
              readOnly: isDropdown,
              enabled: !isDropdown,
              decoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: isDropdown
                    ? const Icon(Icons.keyboard_arrow_down)
                    : null,
              ),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
