import 'package:flutter/material.dart';

class TransactionModel {
  final String title;
  final String date;
  final String amount;
  final IconData icon;
  final Color iconBgColor;

  TransactionModel({
    required this.title,
    required this.date,
    required this.amount,
    required this.icon,
    required this.iconBgColor,
  });
}
