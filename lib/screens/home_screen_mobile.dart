// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:flutter_test_project/services/state_service.dart';
import 'package:flutter_test_project/widgets/my_widgets.dart';

class HomeScreenMobile extends ConsumerWidget {
  const HomeScreenMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(StateService.homeStateHandler);
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: state.configurableDataGridList
            .map<Widget>(
              (value) => MyWidgets.customListTile(model: value),
            )
            .toList(),
      ),
    );
  }
}
