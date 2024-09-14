import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colour_scheme.dart';

var textTheme = TextTheme(
  headlineLarge: GoogleFonts.inter(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: textTitle), //Montrserrat mobile/Montrserrat 19-24

  headlineMedium: GoogleFonts.inter(
      fontSize: 19,
      fontWeight: FontWeight.w600,
      color: primarySubtitle), //Montrserrat mobile/Montrserrat 19-24

  headlineSmall: GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: primaryTextLabel), //inter mobile/inter Semi 19-24

  titleLarge: GoogleFonts.inter(
      fontSize: 22,
      fontWeight: FontWeight.w500,
      color: primarySubtitle), //Montrserrat mobile/Montrserrat SB 16-24

  titleMedium: GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  ),

  titleSmall: GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  ), //inter in my activity

  bodyLarge: GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: primarySubtitle,
  ),

  bodyMedium: GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  ),

  bodySmall: GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: textTitle,
  ),

  labelLarge: GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w600,
  ),

  labelMedium: GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  ),

  labelSmall: GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  ),

  displayMedium: GoogleFonts.inter(
    fontSize: 16,
  ),
  displaySmall: GoogleFonts.inter(
    fontWeight: FontWeight.w400,
  ),
);
