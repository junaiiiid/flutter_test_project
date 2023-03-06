import 'package:flutter/material.dart';
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

  static DataRow labelRow({required String firstLabelText,required String secondLabelText,required String thirdLabelText,required String fourthLabelText,}) {
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
}
