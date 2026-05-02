import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class VisaCard extends StatelessWidget {
  const VisaCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 240,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            bottom: 18,
            child: Container(
              height: 180,
              width: MediaQuery.of(context).size.width * 0.65,
              decoration: BoxDecoration(
                color: AppColors.primaryPurple,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),

          Positioned(
            bottom: 28,
            child: Container(
              height: 150,
              width: MediaQuery.of(context).size.width * 0.75,
              decoration: BoxDecoration(
                color: const Color(0xFFFF5E7E),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            height: 200,
            width: double.infinity,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: const Color(0xFF1A3BB2),
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 15,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                  left: -MediaQuery.of(context).size.width * 0.25,
                  top: -30,
                  bottom: -50,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: const BoxDecoration(
                      color: Color(0xFF0D1B6E),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),

                Positioned(
                  right: -60,
                  top: -70,
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF439CFF).withValues(),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "John Smith",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        "Amazon Platinum",
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      const Spacer(),
                      const Text(
                        "4756  ••••  ••••  9018",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "\$3,469.52",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            "VISA",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
