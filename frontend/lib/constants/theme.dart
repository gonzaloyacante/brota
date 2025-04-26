import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static TextTheme textTheme = TextTheme(
    displayLarge: GoogleFonts.quicksand(
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: GoogleFonts.quicksand(
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: GoogleFonts.quicksand(
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: GoogleFonts.nunito(
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: GoogleFonts.nunito(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    bodyMedium: GoogleFonts.nunito(
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
    labelLarge: GoogleFonts.nunito(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  );

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.green,
    textTheme: textTheme,
    useMaterial3: true,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.green,
    textTheme: textTheme,
    useMaterial3: true,
  );
}
