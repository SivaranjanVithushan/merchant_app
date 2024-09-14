import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:merchant_app/core/theme_data/colour_scheme.dart';
import 'package:merchant_app/module/my_oders/presenter/widgets/order_detail_popup.dart';
import 'package:merchant_app/module/shared/main_layout.dart';

class AllOrdersScreen extends StatefulWidget {
  const AllOrdersScreen({super.key});

  @override
  State<AllOrdersScreen> createState() => _AllOrdersScreenState();
}

class _AllOrdersScreenState extends State<AllOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appbarTitle: 'My Oders',
      body: Column(
        children: [
          AppBar(
            forceMaterialTransparency: true,
            backgroundColor: background,
            title: Text(
              'All Orders',
              style: GoogleFonts.inter(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            leading: InkWell(
              child: const Icon(Icons.arrow_back_ios),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: false,
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.file_download_outlined,
                  size: 25,
                  color: Colors.black54,
                ),
                onPressed: () {
                  // Add download functionality
                },
              ),
            ],
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                _buildOrderItem('CFC0060300', 'Confirmed', Colors.blue[100],
                    const Color(0xff1E73BE)),
                _buildOrderItem('CFC0060300', 'Cancelled', Colors.red[100],
                    const Color(0xff822E22)),
                _buildOrderItem('CFC0060300', 'Delivered', Colors.green[100],
                    const Color(0xff19813C)),
                _buildOrderItem('CFC0060300', 'Confirmed', Colors.blue[100],
                    const Color(0xff1E73BE)),
                _buildOrderItem('CFC0060300', 'Cancelled', Colors.red[100],
                    const Color(0xff822E22)),
                _buildOrderItem('CFC0060300', 'Delivered', Colors.green[100],
                    const Color(0xff19813C)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderItem(
      String orderNumber, String status, Color? bgColor, Color? textColor) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              orderNumber,
              style: GoogleFonts.montserrat(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff606060)),
            ),
          ),
          trailing: Row(mainAxisSize: MainAxisSize.min, children: [
            Container(
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(16.0),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Text(status,
                  style: GoogleFonts.inter(
                    color: textColor,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  )),
            ),
            IconButton(
              icon: const Icon(
                Icons.more_vert,
                color: Color(0xff606060),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const OrderDetailsPopup();
                  },
                );
              },
            ),
          ]),
        ));
  }
}
