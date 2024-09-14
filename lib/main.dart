import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:merchant_app/core/theme_data/text_theme.dart';
import 'core/constants/routes.dart';
import 'core/theme_data/colour_scheme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shipping Progress',
      themeMode: ThemeMode.light,
      theme: ThemeData(
        colorScheme: lightColorScheme,
        textTheme: textTheme,
        fontFamily: GoogleFonts.inter().fontFamily,
      ),
      darkTheme: ThemeData(colorScheme: darkColorScheme),
      initialRoute: '/',
      routes: routes,
    );
  }
}
