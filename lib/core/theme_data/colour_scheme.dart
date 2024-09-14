import 'package:flutter/material.dart';

// New Colour Tokens based on provided colors
Color background = const Color(0xFFF9FCFE);
Color textTitle = const Color(0xFF1A1D1F);
Color textBody = const Color(0xFF5E5E5E);
Color textSubtitle = const Color(0xFF767676);
Color textCaption = const Color(0xFF767676);

// Primary Surface Colors based on new color palette
Color primarySubtitle = const Color(0xffEAFBFC);
Color primaryLighter = const Color(0xff0598D1);
Color primaryDefault = const Color(0xff1E73BE);
Color primaryDarker = const Color(0xff033D8C);

// Primary Border Colors
Color borderColor = const Color(0xffD0D5DD);
Color primaryBorderSubtitle = const Color(0xff99EEEE);
Color primaryBorderLighter = const Color(0xff0598D1);
Color primaryBorderDefault = const Color(0xff1E73BE);
Color primaryBorderDarker = const Color(0xff033D8C);

Color primaryTextLabel = const Color(0xff1E73BE);

// Secondary Colors
Color secondarySubtitle = const Color(0xffFBF7FB);
Color secondaryLighter = const Color(0xffF6EDF6);
Color secondaryDefault = const Color(0xff8B4387);
Color secondaryDarker = const Color(0xff5B2C59);

// Text/Icon
Color secondaryTextLabel = const Color(0xff8B4387);

// Error (unchanged)
Color errorSubtitle = const Color(0xffFDECEC);
Color errorLighter = const Color(0xffF58E8E);
Color errorDefault = const Color(0xffEF4444);
Color errorDarker = const Color(0xffA90F0F);

// Text/Icon
Color errorTextLabel = const Color(0xffA90F0F);

// Success
Color successSubtitle = const Color(0xffE9FBF0);
Color successLighter = const Color(0xff6FE69B);
Color successDefault = const Color(0xff22C55E);
Color successDarker = const Color(0xff147538);

// Text Label
Color successTextLabel = const Color(0xff147538);

// Warning
Color warningSubtitle = const Color(0xffFEF0E6);
Color warningLighter = const Color(0xffFBAC74);
Color warningDefault = const Color(0xffF97316);
Color warningDarker = const Color(0xff9F4504);

// Text/Label
Color warningTextLabel = const Color(0xff9F4504);

// Alert
Color alertSubtitle = const Color(0xffFFF9DB);
Color alertLighter = const Color(0xffF2CA00);
Color alertDefault = const Color(0xffD7B300);
Color alertDarker = const Color(0xff6F5D00);

// Dark theme data
final ColorScheme darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: primaryDarker,
  onPrimary: Colors.white,
  secondary: secondaryDarker,
  onSecondary: Colors.white,
  error: errorDarker,
  onError: Colors.white,
  surface: const Color(0xff033D8C),
  onSurface: Colors.white,
  onTertiary: Colors.white,
  primaryContainer: primaryDarker,
  secondaryContainer: secondaryDarker,
  tertiary: primaryLighter,
  onTertiaryContainer: primaryLighter,
  surfaceTint: Colors.black,
);

// Light theme data
final ColorScheme lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: primaryDefault,
  onPrimary: Colors.white,
  secondary: secondaryDefault,
  onSecondary: primaryTextLabel,
  error: Colors.red,
  onError: Colors.white,
  surface: const Color(0xffF9FCFE),
  onSurface: const Color(0xff161D1C),
  onTertiary: Colors.white,
  primaryContainer: primaryLighter,
  secondaryContainer: secondaryLighter,
  tertiary: primaryLighter,
  onTertiaryContainer: primaryLighter,
  surfaceTint: primaryDefault,
);
