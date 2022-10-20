import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Theme Colors and Fonts
const kScaffoldBackgroundColor = Colors.white;
TextTheme kAppFont = GoogleFonts.urbanistTextTheme();
const kAppThemeRed = Color(0xFFE21221);
const kAppThemeRedLight = Color(0xFFFCE7E9);
const kPinkColor = Color(0xFFFF2D55);
const kSubTextColor = Color(0xFFBDBDBD);
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

/// Home Screen
const kHomeSearchBarBackground = Color(0xFFF1F2F6);
const kHomeSearchBarTextIconColor = Color(0xFFACB1C0);
const kCreateButtonGradient = [
  Color(0xFFFF906A),
  kPinkColor,
];
const kHomeSearchBarTextStyle = TextStyle(
  color: kHomeSearchBarTextIconColor,
  fontSize: 20.0,
  fontWeight: FontWeight.w500,
);
const kSelectedTabTextStyle = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w600,
);
const kSelectedLabelColor = Color(0xFF212121);
const kUnSelectedTabTextStyle = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w400,
);
const kUnSelectedLabelColor = Color(0xFF9E9E9E);
const kStoryUsernameTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 12.0,
  fontWeight: FontWeight.w400,
);
const kAppBarTitleTextStyle = TextStyle(
  fontSize: 24.0,
  fontWeight: FontWeight.w400,
  color: Colors.black,
);
const kAppBarUsernameTextStyle = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.w700,
  color: Colors.black,
);
const kUserNameTextStyle = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w700,
  color: Colors.black,
);
const kPrivacyDropDownLabelStyle = TextStyle(
  fontSize: 14.0,
  color: Colors.grey,
);
const List<BoxShadow> kPostElevation = [
  BoxShadow(
    color: Color(0x24000000),
    offset: Offset(
      2.0,
      2.0,
    ),
    blurRadius: 8.0,
    spreadRadius: 2.0,
  ),
];
BoxDecoration kPostContainerDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(12.0),
  boxShadow: kPostElevation,
  color: Colors.white,
);
const kPostTitleTextStyle = TextStyle(
  fontWeight: FontWeight.w700,
  fontSize: 18.0,
);
const kCommentTitleTextStyle = TextStyle(
  fontWeight: FontWeight.w700,
  fontSize: 16.0,
);
const kPostLocationTextStyle = TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 15.0,
  color: kSubTextColor,
);
const kCommentLocationTextStyle = TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 13.0,
  color: kSubTextColor,
);
const kPostCaptionTextStyle = TextStyle(fontSize: 16.0);
const kLightBlackBackground = Color(0x55000000);
double commonVolume = 1.0;
// End of Home Screen

/// Widgets
const kFollowBarNameTextStyle = TextStyle(
  fontSize: 17.0,
  fontWeight: FontWeight.bold,
);
const kFollowBarSubTextStyle = TextStyle(
  color: kSubTextColor,
  fontSize: 15.0,
);
const kSearchBarBorderColor = Color(0xFFACB1C0);
// End of Widgets
