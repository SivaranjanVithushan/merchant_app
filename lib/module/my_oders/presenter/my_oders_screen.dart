import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:merchant_app/module/shared/main_layout.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appbarTitle: 'My Oders',
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
            ),
            children: [
              _buildOrderCard('money-bag.png', '3.1k', 'All Orders',
                  vertical: true, onTap: () {
                Navigator.pushNamed(context, '/all-oders');
              }),
              _buildOrderCard('money-exchange.png', '3.1k', 'Draft',
                  vertical: true),
              _buildOrderCard('tax.png', '234.1k', 'Confirmed'),
              _buildOrderCard('analytics.png', '122.3k', 'Cancelled'),
              _buildOrderCard('coins.png', '678.7k', 'Delivered'),
              _buildOrderCard('approval.png', '101.1k', 'Partially Delivered'),
              _buildOrderCard('coins.png', '678.7k', 'Rescheduled'),
              _buildOrderCard('approval.png', '101.1k', 'Failed To Deliver'),
            ],
          ),
        ),
      ),
    );
  }

// Helper method to build the cards
  Widget _buildOrderCard(String icon, String count, String label,
      {bool vertical = false, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (vertical) ...[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/icons/$icon',
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      count,
                      style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ],
              if (!vertical) ...[
                Image.asset(
                  'assets/icons/$icon',
                  width: 54,
                  height: 54,
                ),
                const SizedBox(height: 8),
                Text(
                  count,
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
              const SizedBox(height: 4),
              Text(
                label,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff7C7070)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
