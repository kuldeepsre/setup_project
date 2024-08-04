import 'package:flutter/material.dart';


import 'color_utils.dart';

Color primaryColor = const Color.fromRGBO(21, 29, 86, 1);
Color accentColor = const Color.fromRGBO(19, 173, 244, 1);
Color greyColor = const Color.fromRGBO(131, 146, 165, 1);
Color brightGreyColor = const Color.fromRGBO(241, 243, 249, 1);
Color orangeColor = const Color.fromRGBO(243, 120, 53, 1);
Color yellowColor = const Color.fromRGBO(255, 255, 127, 1);
Color bgColor = const Color.fromRGBO(227, 220, 207, 1);
Color disableButtonColor = const Color.fromRGBO(131, 146, 165, 1);
Color darkPrimaryColor = Color.fromRGBO(198, 153, 10, 1);
Color whiteColor = Colors.white;
Color blackColor = Colors.black;
Color redColor = Colors.red;
Color cementGrey = Color.fromRGBO(85, 85, 85, 1);
Color lightMustard = Color.fromRGBO(255, 247, 125, 1);
Color lightGreyColor = Colors.grey.withOpacity(0.3);
Color lightButtongrey = Color.fromRGBO(214, 216, 234, 1);
Color whitegrey = Color.fromRGBO(234, 235, 245, 1);
Color greenWhitecolor = Color.fromRGBO(235, 255, 238, 1);
Color greenbgColor = Color.fromRGBO(245, 248, 252, 1);
Color greencolor = Color.fromRGBO(36, 182, 75, 1);
Color chiplightButtongrey = Color.fromRGBO(249, 250, 252, 1);
Color tilelightButtongrey = Color.fromRGBO(210, 218, 229, 1);
Color bluetextColor = Color.fromRGBO(42, 49, 134, 1);
Color bgPinkColor = Color.fromRGBO(253, 240, 240, 1);
Color darkGreyText = Color.fromRGBO(131, 146, 165, 1);
Color timeContainerSearch = Color(0xffF9FAFC);
double fixPadding = 10.0;
SizedBox heightSpace = SizedBox(height: 10.0);
SizedBox widthSpace = SizedBox(width: 10.0);
TextStyle bottomBarItemStyle = TextStyle(
  color: greyColor,
  fontSize: 12.0,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w500,
);
TextStyle centerHeadingStyle = TextStyle(
  fontSize: 36.0,
  color: primaryColor,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w600,
);

TextStyle bigHeadingStyle = TextStyle(
  fontSize: 22.0,
  color: blackColor,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w600,
);

TextStyle headingStyle = TextStyle(
  fontSize: 14.0,
  color: blackColor,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w400,
);
TextStyle whiteheadingStyle = const TextStyle(
  fontSize: 12.0,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);
TextStyle redheadingStyle = const TextStyle(
  fontSize: 18.0,
  color: Colors.red,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w600,
);

TextStyle greyHeadingStyle = TextStyle(
  fontSize: 16.0,
  color: greyColor,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w500,
);
TextStyle greenHeadingStyle = TextStyle(
  fontSize: 16.0,
  color: greencolor,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w500,
);

TextStyle blueTextStyle = TextStyle(
  fontSize: 18.0,
  color: Colors.blue,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w600,
);

TextStyle whiteHeadingStyle = TextStyle(
  fontSize: 22.0,
  color: whiteColor,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w500,
);

TextStyle whiteSubHeadingStyle = TextStyle(
  fontSize: 10.0,
  color: whiteColor,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.bold,
);
TextStyle bluetextColorStyle = TextStyle(
  fontSize: 12.0,
  color: Colors.lightBlueAccent,
  fontFamily: 'Poppins',
  decoration: TextDecoration.underline,
  fontWeight: FontWeight.w500,
);
TextStyle listTextStyle = new TextStyle(
    color: Colors.black,
    fontSize: 14.0,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.bold);
TextStyle buttonBlackTextStyle = TextStyle(
  fontSize: 14.0,
  color: blackColor,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w500,
);
TextStyle buttonBlueTextStyle = TextStyle(
  fontSize: 16.0,
  color: ColorUtils.btnBlue,
  fontFamily: 'Poppins',
  decoration: TextDecoration.underline,
  fontWeight: FontWeight.w500,
);
TextStyle moreStyle = TextStyle(
  fontSize: 14.0,
  color: primaryColor,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w500,
);
TextStyle normalListText = TextStyle(
  fontSize: 14.0,
  color: primaryColor,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w300,
);
TextStyle priceStyle = TextStyle(
  fontSize: 18.0,
  color: primaryColor,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.bold,
);
TextStyle lightGreyStyle = TextStyle(
  fontSize: 15.0,
  color: Colors.grey.withOpacity(0.6),
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w500,
);
TextStyle listItemTitleStyle = TextStyle(
  fontSize: 15.0,
  color: blackColor,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w500,
);
TextStyle listItemSubTitleStyle = TextStyle(
  fontSize: 14.0,
  color: greyColor,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.normal,
);

// List Item Style End

// AppBar Style Start
TextStyle appbarHeadingStyle = TextStyle(
  color: darkPrimaryColor,
  fontSize: 14.0,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w500,
);
TextStyle appbarSubHeadingStyle = TextStyle(
  color: whiteColor,
  fontSize: 14.0,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w500,
);
TextStyle btnStyle = TextStyle(
  color: whiteColor,
  fontSize: 13.0,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w500,
);
// AppBar Style End

// Search text style start
TextStyle searchTextStyle = const TextStyle(
  // color: bgColor.withOpacity(0.6),
  fontSize: 16.0,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.bold,
);
TextStyle unselectedHeadingStyle = TextStyle(
  fontSize: 12.0,
  color: blackColor,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w700,
);
TextStyle accentblueTextStyle = TextStyle(
  fontSize: 14.0,
  color: accentColor,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w600,
);
