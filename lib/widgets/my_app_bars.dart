// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

// Project imports:
import 'package:flutter_test_project/constants/numeric_constants.dart';
import 'package:flutter_test_project/services/state_service.dart';
import 'package:flutter_test_project/styles/my_colors.dart';
import 'package:flutter_test_project/styles/my_text_styles.dart';

class MyAppBars {
  static AppBar genericAppBar({
    Color? backgroundColor,
    double? elevation,
    IconData? leadingIcon,
    Color? leadingIconColor,
    double? leadingIconRadius,
    required Function() leadingOnTap,
    IconData? actionIcon,
    Color? actionIconColor,
    double? actionIconRadius,
    required Function() actionOnTap,
    required String titleText,
    TextStyle? titleTextStyle,
  }) {
    return AppBar(
      backgroundColor: backgroundColor ?? MyColors.blueShade4,
      elevation: elevation ?? NumericConstants.appBarElevation,
      title: Text(
        titleText,
        style: titleTextStyle ?? MyTextStyles.h1,
      ),
      leading: IconButton(
        onPressed: leadingOnTap,
        icon: Icon(
          leadingIcon ?? Icons.close,
          color: leadingIconColor ?? MyColors.white,
          size: leadingIconRadius ?? 30.r,
        ),
      ),
      actions: [
        ResponsiveWrapper.of(StateService.context).isSmallerThan(TABLET)?
        IconButton(
          onPressed: actionOnTap,
          icon: Icon(
            actionIcon ?? Icons.settings,
            color: actionIconColor ?? MyColors.white,
            size: actionIconRadius ?? 30.r,
          ),
        ):Container(),
      ],
    );
  }
}
