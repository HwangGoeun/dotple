import 'package:dotple/constants/constants.dart';
import 'package:flutter/material.dart';

var dotPleTheme = ThemeData(
  primaryColor: const Color(0xff252525),
  appBarTheme: AppBarTheme(
    toolbarHeight: screenHeight * 0.08,
    titleTextStyle: TextStyle(
      color: Colors.black.withOpacity(1),
      fontSize: 20,
      fontFamily: "NanumSquareEB",
      fontWeight: FontWeight.w300,
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    elevation: 5, // Elevation to add shadow
    shadowColor: Colors.grey.withOpacity(0.3),
    surfaceTintColor: Colors.white,
  ),
  fontFamily: "NanumSquareB",
  textTheme: const TextTheme(
      bodyMedium: TextStyle(
    color: Colors.black,
  )),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      overlayColor: WidgetStateProperty.all(Colors.transparent),
    ),
  ),
);

class DotPleTextStyle {
  static TextStyle appBarText = TextStyle(
    color: Colors.black.withOpacity(1),
    fontSize: 25,
    fontFamily: "NanumSquareEB",
    fontWeight: FontWeight.w300,
  );
  static const TextStyle circularButtonTextBlack = TextStyle(
    fontFamily: "NanumSquareEB",
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle circularButtonTextWhite = TextStyle(
    fontFamily: "NanumSquareEB",
    color: Color(0xffA6A6A6),
    fontWeight: FontWeight.bold,
  );
  static const TextStyle sqaureButtonTextBlack = TextStyle(
    fontFamily: "NanumSquareEB",
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle sqaureButtonTextWhite = TextStyle(
    fontFamily: "NanumSquareEB",
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
}
