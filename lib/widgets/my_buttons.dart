// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:flutter_test_project/styles/my_text_styles.dart';

class MyButtons{
  MyButtons._();

  static Widget shortButton({required Color backgroundColor,required Function() onTap,required String buttonText}){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(5.r),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 25.w,vertical: 10.h),
        child: Text(buttonText,style: MyTextStyles.h1,),
      ),
    );
  }
}
