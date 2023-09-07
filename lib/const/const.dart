import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme() {
  return ThemeData(
    textTheme: textTheme(),
    useMaterial3: true,
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyLarge: GoogleFonts.robotoSlab(
        fontSize: 25, fontWeight: FontWeight.w400, color: Colors.white),
  );
}

const apiKey = 'xivKd2ttDXYeSi2Jlf5hqcP1x20GRdq08gDj2en2';
