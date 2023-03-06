import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_project/styles/my_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextStyles {
  MyTextStyles._();

  static TextStyle h1 = GoogleFonts.montserrat(
    color: MyColors.white,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle h2 = GoogleFonts.montserrat(
    color: MyColors.white,
    fontSize: 15.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle h3 = GoogleFonts.montserrat(
    color: MyColors.white,
    fontSize: 10.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle p = GoogleFonts.montserrat(
    color: MyColors.white,
    fontSize: 10.sp,
    fontWeight: FontWeight.normal,
  );
}
