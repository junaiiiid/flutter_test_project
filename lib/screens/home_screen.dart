import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_project/constants/extensions.dart';
import 'package:flutter_test_project/constants/string_constants.dart';
import 'package:flutter_test_project/models/api_model.dart';
import 'package:flutter_test_project/models/data_grid_model.dart';
import 'package:flutter_test_project/screens/home_screen_mobile.dart';
import 'package:flutter_test_project/screens/home_screen_web.dart';
import 'package:flutter_test_project/services/network_service.dart';
import 'package:flutter_test_project/services/state_service.dart';
import 'package:flutter_test_project/styles/my_colors.dart';
import 'package:flutter_test_project/widgets/my_app_bars.dart';
import 'package:flutter_test_project/widgets/my_popups.dart';
import 'package:flutter_test_project/widgets/my_sheets.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class HomeScreen extends StatelessWidget {
  static const String id = "HOME_SCREEN";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.blueShade3,
      appBar: MyAppBars.genericAppBar(
          leadingOnTap: () => MyPopups.showAlertPopupWithOptions(
              onLeftTap: () => StateService.pop(), onRightTap: () => exit(0)),
          actionOnTap: () => MySheets.showSettingsSheet(),
          titleText: StringConstants.appBarTitle),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: FutureBuilder<ApiModel>(
            future: NetworkService.fetchData(),
            builder: (context, AsyncSnapshot<ApiModel> snapshot) {
              if (snapshot.hasData) {
                populateDataGrid(json: snapshot.data!);
                return ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                    ? const HomeScreenMobile()
                    : const HomeScreenWeb();
              }
              return Center(
                child: CircularProgressIndicator(
                  color: MyColors.white,
                ),
              );
            }),
      ),
    );
  }

  void populateDataGrid({required ApiModel json}) {
    List<DataGridModel> dataGridList = [];
    int index = 0;
    for (var data in json.data!) {
      final jsonParsed = data.toJson();
      final key = jsonParsed.keys.toList()[index].toString();
      dataGridList.add(DataGridModel(
          label: key,
          key: key,
          type: jsonParsed[key].runtimeType.toString(),
          value: jsonParsed[key].toString()));
      index = (index == 10) ? 0 : (index + 1);
    }
    StateService.context.read(StateService.homeStateHandler).dataGridList =
        dataGridList;
    StateService.context
        .read(StateService.homeStateHandler)
        .configurableDataGridList = dataGridList;
  }
}
