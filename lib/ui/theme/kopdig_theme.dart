import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const String poppins = 'Poppins';

class KopdigTheme {
  static const Color primaryColor = Color(0xFF95AE36);
  static const Color primaryColorDarker = Color(0xFF5B7207);

  static TextStyle get title => GoogleFonts.getFont(
    poppins,
    color: KopdigTheme.primaryColorDarker,
    fontWeight: FontWeight.w600,
    fontSize: 24,
  );
}