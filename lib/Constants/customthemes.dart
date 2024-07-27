// lib/theme.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData customTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white.withOpacity(0.9),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white.withOpacity(0.1),
    elevation: 0
  ),
  primaryColor: CustomColors.primaryColor,
  colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: const Color.fromARGB(255, 44, 44, 81),
      primary: CustomColors.primaryColor,
      surface: CustomColors.deepwhiteColor),
  textTheme: TextTheme(
    displayLarge: GoogleFonts.poppins(
      textStyle: TextStyle(
          color: CustomColors.primaryColor,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600),
    ),
    bodyLarge: GoogleFonts.poppins(
      textStyle: TextStyle(color: Colors.black, fontSize: 16.sp),
    ),
    bodyMedium: GoogleFonts.poppins(
      textStyle: TextStyle(color: Colors.black, fontSize: 14.sp),
    ),
  ),
  useMaterial3: true,
);

class CustomColors {
  static const Color primaryColor = Color(0xFF0c54be); // #0c54be
  static const Color secondaryColor = Color(0xFF303f60); // #303f60
  static const Color deepwhiteColor = Color(0xFFf5f9fd); // #f5f9fd
  static const Color deepgreyColor = Color(0xFFced3dc);
}
