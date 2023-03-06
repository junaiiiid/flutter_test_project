// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:flutter_test_project/constants/extensions.dart';
import 'package:flutter_test_project/models/data_grid_model.dart';
import 'package:flutter_test_project/services/state_service.dart';
import 'package:flutter_test_project/styles/my_colors.dart';
import 'package:flutter_test_project/styles/my_text_styles.dart';

class MyWidgets {
  MyWidgets._();

  static DataColumn labelColumn({required String labelText}) {
    return DataColumn(
      label: Center(
        child: Text(
          labelText,
          style: MyTextStyles.h3,
        ),
      ),
    );
  }

  static DataRow labelRow({
    required String firstLabelText,
    required String secondLabelText,
    required String thirdLabelText,
    required String fourthLabelText,
  }) {
    return DataRow(cells: [
      DataCell(
        Center(
          child: Text(
            firstLabelText,
            style: MyTextStyles.p,
          ),
        ),
      ),
      DataCell(
        Center(
          child: Text(
            secondLabelText,
            style: MyTextStyles.p,
          ),
        ),
      ),
      DataCell(
        Center(
          child: Text(
            thirdLabelText,
            style: MyTextStyles.p,
          ),
        ),
      ),
      DataCell(
        Center(
          child: Text(
            fourthLabelText,
            style: MyTextStyles.p,
          ),
        ),
      ),
    ]);
  }

  static customListTile({required DataGridModel model}) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.blueShade1,
        borderRadius: BorderRadius.all(
          Radius.circular(10.r),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25.r,
          child: Center(
            child: Text(
              model.type.toString(),
              style: MyTextStyles.p,
            ),
          ),
        ),
        title: Text(
          model.label.toString(),
          style: MyTextStyles.h2,
        ),
        subtitle: Text(
          model.key.toString(),
          style: MyTextStyles.h3,
        ),
        trailing: Text(
          model.value.toString(),
          style: MyTextStyles.p,
        ),
      ),
    );
  }

  static customDropDownSettingItem(
      {required String settingsLabel, required String initialValue}) {
    String dropdownValue = initialValue;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 25.h),
      child: StatefulBuilder(builder: (context, setState) {
        final state = context.read(StateService.homeStateHandler);
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 100.w,
              child: Text(
                settingsLabel,
                style: MyTextStyles.h2,
              ),
            ),
            Icon(
              Icons.arrow_forward,
              color: MyColors.blueShade3,
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton<String?>(
                value: dropdownValue,
                icon: Icon(
                  Icons.arrow_drop_down_circle_outlined,
                  color: MyColors.white,
                ),
                dropdownColor: MyColors.blueShade1,
                onChanged: (String? value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                  switch (settingsLabel) {
                    case "LABEL":
                      state.labelValue = value!;
                      break;
                    case "KEY":
                      state.keyValue = value!;
                      break;
                    case "TYPE":
                      state.typeValue = value!;
                      break;
                    case "VALUE":
                      state.valueValue = value!;
                      break;
                  }
                },
                items: state.configurableDropDown
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: MyTextStyles.h2,
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        );
      }),
    );
  }
}
