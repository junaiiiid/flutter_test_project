import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_project/constants/extensions.dart';
import 'package:flutter_test_project/services/state_service.dart';
import 'package:flutter_test_project/styles/my_colors.dart';
import 'package:flutter_test_project/styles/my_text_styles.dart';
import 'package:flutter_test_project/widgets/my_buttons.dart';
import 'package:flutter_test_project/widgets/my_widgets.dart';

class MySheets {
  MySheets._();

  static void showSettingsSheet() {
    showModalBottomSheet<void>(
      isDismissible: false,
      backgroundColor: Colors.transparent,
      context: StateService.context,
      builder: (BuildContext context) {
        final state = context.read(StateService.homeStateHandler);
        return Wrap(
          children: [
            Container(
              decoration: BoxDecoration(
                color: MyColors.blueShade2,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 25.h),
                      child: Text(
                        "Settings",
                        style: MyTextStyles.h1,
                      ),
                    ),
                    MyWidgets.customDropDownSettingItem(settingsLabel: "LABEL", initialValue: state.labelValue),
                    MyWidgets.customDropDownSettingItem(settingsLabel: "KEY", initialValue: state.keyValue),
                    MyWidgets.customDropDownSettingItem(settingsLabel: "TYPE", initialValue: state.typeValue),
                    MyWidgets.customDropDownSettingItem(settingsLabel: "VALUE", initialValue: state.valueValue),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyButtons.shortButton(backgroundColor: MyColors.blueShade1, onTap: (){
                          state.saveConfiguration();
                          StateService.pop();
                        }, buttonText: "SAVE"),
                        MyButtons.shortButton(backgroundColor: MyColors.blueShade1, onTap: (){
                          state.resetDropDown();
                          StateService.pop();
                        }, buttonText: "RESET"),
                      ],
                    ),
                    SizedBox(height: 50.h,)
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
