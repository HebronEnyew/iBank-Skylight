import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class ExchangeScreen extends StatefulWidget {
  const ExchangeScreen({super.key});

  @override
  State<ExchangeScreen> createState() => _ExchangeScreenState();
}

class _ExchangeScreenState extends State<ExchangeScreen> {
  final TextEditingController _fromController = TextEditingController(
    text: "1000",
  );
  final TextEditingController _toController = TextEditingController();

  String _fromCurrency = "USD";
  String _toCurrency = "KRM";
  final double _exchangeRate = 1122.0; // This would come from my API

  @override
  void initState() {
    super.initState();
    _calculateExchange(_fromController.text);

    _fromController.addListener(() {
      _calculateExchange(_fromController.text);
    });
  }

  void _calculateExchange(String val) {
    if (val.isEmpty) {
      _toController.text = "";
      return;
    }
    final input = double.tryParse(val) ?? 0;
    setState(() {
      _toController.text = (input * _exchangeRate).toStringAsFixed(2);
    });
  }

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
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
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Exchange",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //  Header
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: Image.asset(
                  'assets/images/exchange_illustration.png',
                  height: 220,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildCurrencyInput(
                    label: "From",
                    controller: _fromController,
                    currency: _fromCurrency,
                    onCurrencyTap: () => _showCurrencyPicker(true),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: InkWell(
                      onTap: _swapCurrencies,
                      child: const Icon(
                        Icons.swap_vert_rounded,
                        color: AppColors.primaryPurple,
                        size: 45,
                      ),
                    ),
                  ),

                  _buildCurrencyInput(
                    label: "To",
                    controller: _toController,
                    currency: _toCurrency,
                    enabled: false,
                    onCurrencyTap: () => _showCurrencyPicker(false),
                  ),

                  const SizedBox(height: 25),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Currency rate",
                        style: TextStyle(
                          color: AppColors.primaryPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "1 $_fromCurrency = $_exchangeRate $_toCurrency",
                        style: const TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 35),

                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        // Trigger my Post API call here
                        print(
                          "Exchanging ${_fromController.text} $_fromCurrency to $_toCurrency",
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        "Exchange",
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
          ],
        ),
      ),
    );
  }

  void _swapCurrencies() {
    setState(() {
      String temp = _fromCurrency;
      _fromCurrency = _toCurrency;
      _toCurrency = temp;
      // i'd fetch a new exchange rate from the API here
    });
    _calculateExchange(_fromController.text);
  }

  void _showCurrencyPicker(bool isFrom) {
    // This is where i would show a bottom sheet with a list of currencies from my API
  }

  Widget _buildCurrencyInput({
    required String label,
    required TextEditingController controller,
    required String currency,
    required VoidCallback onCurrencyTap,
    bool enabled = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  enabled: enabled,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(border: InputBorder.none),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const VerticalDivider(),
              InkWell(
                onTap: onCurrencyTap,
                child: Row(
                  children: [
                    Text(
                      currency,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
