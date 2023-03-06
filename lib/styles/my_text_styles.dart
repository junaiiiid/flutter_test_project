// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:flutter_test_project/styles/my_colors.dart';

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
