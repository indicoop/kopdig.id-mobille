import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const String poppins = 'Poppins';

class KopdigTheme {

  static const Color primaryColor = Color(0xFF95AE36);
  static const Color primaryColorLighter = Color(0xFFCBE565);
  static const Color primaryColorDarker = Color(0xFF5B7207);
  static const Color fieldColor = Color(0xFFF3F2F2);

  static TextStyle get title => GoogleFonts.getFont(
    poppins,
    color: KopdigTheme.primaryColorDarker,
    fontWeight: FontWeight.w600,
    fontSize: 24,
  );

  static TextStyle get subTitle => GoogleFonts.getFont(
    poppins,
    color: Colors.black87,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  static TextStyle get bodyText => GoogleFonts.getFont(
    poppins,
    color: KopdigTheme.primaryColorDarker,
    fontSize: 14,
  );
}