class BeneficiaryModel {
  final String name;
  final String accountNumber;
  final String? profileImage;

  BeneficiaryModel({
    required this.name,
    required this.accountNumber,
    this.profileImage,
  });
}
