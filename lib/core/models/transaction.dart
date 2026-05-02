import 'package:flutter/material.dart';

class Transaction {
  final String title;
  final String subtitle;
  final String amount;
  final IconData icon;
  final Color iconColor;
  final bool isNegative;

  Transaction({
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.icon,
    required this.iconColor,
    required this.isNegative,
  });
}

class ChartData {
  final String label;
  final double heightFactor;
  final bool isSelected;

  ChartData({
    required this.label,
    required this.heightFactor,
    this.isSelected = false,
  });
}
