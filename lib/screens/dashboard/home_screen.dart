import 'package:flutter/material.dart';
import '../../widgets/cards/visa_card.dart';
import '../../widgets/cards/service_item.dart';
import '../../core/constants/app_colors.dart';
import '../billing/pay_bill_menu_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryPurple,
      body: Column(
        children: [
          // Header Section
          Container(
            padding: const EdgeInsets.only(
              top: 60,
              left: 24,
              right: 24,
              bottom: 20,
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/images/user_avatar.webp'),
                ),
                const SizedBox(width: 15),
                const Text(
                  "Hi, Push Puttichai",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Stack(
                  children: [
                    const Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 30,
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: const Text(
                          "3",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Main Content Area
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const VisaCard(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 10,
                      ),
                      child: GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 3,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(
                              context,
                              '/account_details',
                            ),
                            child: const ServiceItem(
                              title: "Account and Card",
                              icon: Icons.account_balance_wallet,
                              color: Colors.indigo,
                            ),
                          ),

                          GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, '/transfer'),
                            child: const ServiceItem(
                              title: "Transfer",
                              icon: Icons.swap_horiz,
                              color: Colors.redAccent,
                            ),
                          ),

                          GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, '/withdraw'),
                            child: const ServiceItem(
                              title: "Withdraw",
                              icon: Icons.atm,
                              color: Colors.blue,
                            ),
                          ),

                          GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, '/mobile_prepaid'),
                            child: const ServiceItem(
                              title: "Mobile prepaid",
                              icon: Icons.phone_android,
                              color: Colors.orange,
                            ),
                          ),

                          GestureDetector(
                            onTap: () => Navigator.pushNamed(context, '/bills'),
                            child: const ServiceItem(
                              title: "Pay the bill",
                              icon: Icons.receipt_long,
                              color: Colors.teal,
                            ),
                          ),

                          GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, '/add_savings'),
                            child: const ServiceItem(
                              title: "Save online",
                              icon: Icons.savings,
                              color: Colors.purple,
                            ),
                          ),

                          GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, '/manage_cards'),
                            child: const ServiceItem(
                              title: "Credit card",
                              icon: Icons.credit_card,
                              color: Colors.deepOrange,
                            ),
                          ),

                          GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, '/reports'),
                            child: const ServiceItem(
                              title: "Transaction report",
                              icon: Icons.assessment,
                              color: Colors.indigo,
                            ),
                          ),

                          GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, '/beneficiaries'),
                            child: const ServiceItem(
                              title: "Beneficiary",
                              icon: Icons.contact_page,
                              color: Colors.pink,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: const Color(0xFF3D30A2),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.primaryPurple,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.home, color: AppColors.white),
                  SizedBox(width: 8),
                  Text(
                    "Home",
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            label: "",
          ),
          const BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          const BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline),
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: "",
          ),
        ],
      ),
    );
  }
}
