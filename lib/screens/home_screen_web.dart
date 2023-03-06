// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:flutter_test_project/services/state_service.dart';
import 'package:flutter_test_project/widgets/my_widgets.dart';

class HomeScreenWeb extends ConsumerWidget {
  const HomeScreenWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(StateService.homeStateHandler);

    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTable(
            columns: state.columnLabels
                .map<DataColumn>(
                  (label) => MyWidgets.labelColumn(labelText: label),
                )
                .toList(),
            rows: state.dataGridList
                .map<DataRow>((value) => MyWidgets.labelRow(
                      firstLabelText: value.label.toString(),
                      secondLabelText: value.key.toString(),
                      thirdLabelText: value.type.toString(),
                      fourthLabelText: value.value.toString(),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
