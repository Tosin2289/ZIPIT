import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyleTablet {
  static Color bgColor = Color(0xFFe2e2ff);
  static Color mainColor = Color(0xFF000633);
  static Color accentColor = Color(0xFF0065FF);
  static List<Color> cardsColorT = [
    Colors.white,
    Colors.purple.shade200,
    Colors.red.shade200,
    Colors.pink.shade200,
    Colors.orange.shade200,
    Colors.yellow.shade200,
    Colors.green.shade200,
    Colors.blue.shade200,
    Colors.blueGrey.shade200,
    Colors.cyan.shade200
  ];
  static TextStyle mainTitleTablet =
      GoogleFonts.indieFlower(fontSize: 28.0, fontWeight: FontWeight.bold);
  static TextStyle mainContentTablet =
      GoogleFonts.indieFlower(fontSize: 24.0, fontWeight: FontWeight.normal);
  static TextStyle dateTitleTablet =
      GoogleFonts.indieFlower(fontSize: 18.0, fontWeight: FontWeight.w500);
}
