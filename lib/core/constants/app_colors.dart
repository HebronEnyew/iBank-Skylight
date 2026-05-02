import 'package:flutter/material.dart';

class AppColors {
  //brand colors
  static const Color primaryPurple = Color(0xFF3D30A2);
  static const Color accentBlue = Color(0xFF4C86F9);

  //background & surface
  static const Color background = Color(0xFFF8F9FD);
  static const Color white = Colors.white;
  static const Color textFieldBg = Color(0xFFF5F7FA);

  //text colors
  static const Color textDark = Color(0xFF1A1A1A);
  static const Color textGray = Color.fromARGB(255, 70, 69, 69);

  //gradients
  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
