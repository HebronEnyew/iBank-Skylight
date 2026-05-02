class TransferModel {
  final String account;
  final String beneficiaryName;
  final String cardNumber;
  final double amount;
  final String content;
  final bool saveToDirectory;

  TransferModel({
    required this.account,
    required this.beneficiaryName,
    required this.cardNumber,
    required this.amount,
    required this.content,
    required this.saveToDirectory,
  });

  Map<String, dynamic> toJson() {
    return {
      'account': account,
      'beneficiary_name': beneficiaryName,
      'card_number': cardNumber,
      'amount': amount,
      'content': content,
      'save_to_directory': saveToDirectory,
    };
  }
}
