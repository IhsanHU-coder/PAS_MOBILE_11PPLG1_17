import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData myTheme = ThemeData(
  scaffoldBackgroundColor: const Color(0xFFF5F8FF),
  primaryColor: const Color(0xFF2B6ED5),
  colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2B6ED5)),
  useMaterial3: true,
  fontFamily: GoogleFonts.poppins().fontFamily,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    foregroundColor: Colors.black87,
    centerTitle: true,
  ),

  // 🔥 FIX: CardThemeData (bukan CardTheme)
  cardTheme: CardThemeData(
    color: Colors.white,
    elevation: 6,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  ),
);
