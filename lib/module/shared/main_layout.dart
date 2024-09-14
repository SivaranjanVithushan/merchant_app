import 'package:flutter/material.dart';

import 'package:merchant_app/core/theme_data/colour_scheme.dart';

import 'side_navigation/side_nav_bar.dart';

class MainLayout extends StatefulWidget {
  final String? appbarTitle;
  final Widget body;
  const MainLayout({super.key, this.appbarTitle, required this.body});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        // title: widget.appbarTitle != null
        //     ? Text(
        //         widget.appbarTitle!,
        //         style: const TextStyle(fontWeight: FontWeight.bold),
        //       )
        //     : null,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
        elevation: 0.0,
      ),
      drawer: const SideNavigation(),
      body: widget.body,
    );
  }
}
