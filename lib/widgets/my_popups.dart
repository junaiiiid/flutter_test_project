// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:flutter_test_project/constants/string_constants.dart';
import 'package:flutter_test_project/services/state_service.dart';
import 'package:flutter_test_project/styles/my_colors.dart';
import 'package:flutter_test_project/styles/my_text_styles.dart';
import 'package:flutter_test_project/widgets/my_buttons.dart';

class MyPopups {
  MyPopups._();

  static void showAlertPopupWithOptions(
      {IconData? icon,
      String? leftButtonText,
      String? rightButtonText,
      String? mainText,
      Color? topPortionColor,
      Color? dialogColor,
      required Function() onLeftTap,
      required Function() onRightTap}) {
    showDialog(
        context: StateService.context,
        builder: (context) {
          return Material(
            color: Colors.transparent,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 225.h),
              decoration: BoxDecoration(
                  color: dialogColor ?? MyColors.blueShade2,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.r),
                  )),
              child: Flex(
                direction: Axis.vertical,
                children: [
                  ///TOP PORTION
                  GestureDetector(
                    onTap: () {
                      StateService.pop();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50.h,
                      decoration: BoxDecoration(
                          color: topPortionColor ?? MyColors.blueShade3,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.r),
                              topRight: Radius.circular(10.r))),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: MyColors.blueShade1,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5.r),
                                ),
                              ),
                              child: Icon(
                                Icons.close,
                                color: MyColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  ///MID PORTION
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 25.h),
                    child: CircleAvatar(
                      radius: 60.r,
                      backgroundColor: MyColors.blueShade1,
                      child: Icon(
                        icon ?? Icons.question_mark,
                        size: 60.r,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.w),
                    child: Text(mainText ?? StringConstants.exitDialogTitle,
                        style: MyTextStyles.h1),
                  ),

                  ///BOTTOM PORTION
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 50.w, vertical: 25.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyButtons.shortButton(
                            backgroundColor: MyColors.red,
                            onTap: onLeftTap,
                            buttonText: leftButtonText ?? StringConstants.no),
                        MyButtons.shortButton(
                            backgroundColor: MyColors.green,
                            onTap: onRightTap,
                            buttonText: rightButtonText ?? StringConstants.yes),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
