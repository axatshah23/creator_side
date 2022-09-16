import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Theme Colors and Fonts
const kScaffoldBackgroundColor = Colors.white;
TextTheme kAppFont = GoogleFonts.urbanistTextTheme();
const kAppThemeRed = Color(0xFFE21221);
const kAppThemeRedLight = Color(0xFFFCE7E9);
// Theme Colors end here

/// NavBar
const kNavBarElevation = 0.0;
const kNavBarBackgroundColor = Colors.white;
const kNavBarSelectedItemColor = kAppThemeRed;
const kNavBarSelectedItemTextStyle = TextStyle(
  fontWeight: FontWeight.w700,
  fontSize: 14.0,
);
const kUnSelectedItemColor = Color(0xFF9E9E9E);
const kNavBarUnSelectedItemTextStyle = TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 13.0,
);
const kNavBarIconSize = 28.0;
// Navbar ends here
