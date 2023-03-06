import 'package:flutter/material.dart';
import 'package:flutter_test_project/models/data_grid_model.dart';

class HomeViewModel extends ChangeNotifier{
  List<String> columnLabels = ["LABEL","KEY","TYPE","VALUE"];

  List<DataGridModel> dataGridList = [];
}