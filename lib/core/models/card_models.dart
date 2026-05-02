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

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      number: json['number'] ?? '',
      balance: json['balance'] ?? '0.00',
      isVisa: json['isVisa'] ?? true,
    );
  }
}
