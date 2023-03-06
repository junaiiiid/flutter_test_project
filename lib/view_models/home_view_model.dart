// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_test_project/constants/string_constants.dart';

// Project imports:
import 'package:flutter_test_project/models/data_grid_model.dart';

class HomeViewModel extends ChangeNotifier {
  List<String> columnLabels = [StringConstants.label, StringConstants.key, StringConstants.type, StringConstants.value];

  List<DataGridModel> dataGridList = [];

  List<DataGridModel> configurableDataGridList = [];

  List<String> get configurableDropDown => [StringConstants.label, StringConstants.key, StringConstants.type, StringConstants.value];

  String _labelValue = StringConstants.label;
  String _keyValue = StringConstants.key;
  String _typeValue = StringConstants.type;
  String _valueValue = StringConstants.value;

  String get labelValue => _labelValue;

  set labelValue(String value) {
    _labelValue = value;
    notifyListeners();
  }

  String get keyValue => _keyValue;

  set keyValue(String value) {
    _keyValue = value;
    notifyListeners();
  }

  String get typeValue => _typeValue;

  set typeValue(String value) {
    _typeValue = value;
    notifyListeners();
  }

  String get valueValue => _valueValue;

  set valueValue(String value) {
    _valueValue = value;
    notifyListeners();
  }

  void resetDropDown() {
    configurableDataGridList = dataGridList;
    _labelValue = StringConstants.label;
    _keyValue = StringConstants.key;
    _typeValue = StringConstants.type;
    _valueValue = StringConstants.value;
    notifyListeners();
  }

  void saveConfiguration() {
    List<DataGridModel> tempList = [];
    for (var dataGrid in configurableDataGridList) {
      switch (_labelValue) {
        case StringConstants.label:
          dataGrid.label = dataGrid.label;
          break;
        case StringConstants.key:
          dataGrid.label = dataGrid.key;
          break;
        case StringConstants.type:
          dataGrid.label = dataGrid.type;
          break;
        case StringConstants.value:
          dataGrid.label = dataGrid.value;
          break;
      }
      switch (_keyValue) {
        case StringConstants.label:
          dataGrid.key = dataGrid.label;
          break;
        case StringConstants.key:
          dataGrid.key = dataGrid.key;
          break;
        case StringConstants.type:
          dataGrid.key = dataGrid.type;
          break;
        case StringConstants.value:
          dataGrid.key = dataGrid.value;
          break;
      }
      switch (_typeValue) {
        case StringConstants.label:
          dataGrid.type = dataGrid.label;
          break;
        case StringConstants.key:
          dataGrid.type = dataGrid.key;
          break;
        case StringConstants.type:
          dataGrid.type = dataGrid.type;
          break;
        case StringConstants.value:
          dataGrid.type = dataGrid.value;
          break;
      }
      switch (_valueValue) {
        case StringConstants.label:
          dataGrid.value = dataGrid.label;
          break;
        case StringConstants.key:
          dataGrid.value = dataGrid.key;
          break;
        case StringConstants.type:
          dataGrid.value = dataGrid.type;
          break;
        case StringConstants.value:
          dataGrid.value = dataGrid.value;
          break;
      }
      tempList.add(dataGrid);
    }
    configurableDataGridList = tempList;
    notifyListeners();
  }

  ///TODO : Implement swapping
  ///IF YOU NEED TO SWAP VALUES
/*  void saveConfiguration(){
    List<DataGridModel> tempList = [];
    for(var dataGrid in configurableDataGridList){
      ///SWAP CONFIG FOR LABEL
      switch(_labelValue){
        case "LABEL":
        ///no edit
          break;
        case StringConstants.key:
          String? temp = dataGrid.label;
          dataGrid.label = dataGrid.key;
          dataGrid.key = temp;
          break;
        case StringConstants.type:
          String? temp = dataGrid.label;
          dataGrid.label = dataGrid.type;
          dataGrid.type = temp;
          break;
        case StringConstants.value:
          String? temp = dataGrid.label;
          dataGrid.label = dataGrid.value;
          dataGrid.value = temp;
          break;
      }
      ///SWAP CONFIG FOR KEY
      switch(_keyValue){
        case "LABEL":
          String? temp = dataGrid.key;
          dataGrid.key = dataGrid.label;
          dataGrid.label = temp;
          break;
        case StringConstants.key:
        ///no edit
          break;
        case StringConstants.type:
          String? temp = dataGrid.key;
          dataGrid.key = dataGrid.type;
          dataGrid.type = temp;
          break;
        case StringConstants.value:
          String? temp = dataGrid.key;
          dataGrid.key = dataGrid.value;
          dataGrid.value = temp;
          break;
      }
      ///SWAP CONFIG FOR TYPE
      switch(_typeValue){
        case "LABEL":
          String? temp = dataGrid.type;
          dataGrid.type = dataGrid.label;
          dataGrid.label = temp;
          break;
        case StringConstants.key:
          String? temp = dataGrid.type;
          dataGrid.type = dataGrid.key;
          dataGrid.key = temp;
          break;
        case StringConstants.type:
        ///no edit
          break;
        case StringConstants.value:
          String? temp = dataGrid.type;
          dataGrid.type = dataGrid.value;
          dataGrid.value = temp;
          break;
      }
      ///SWAP CONFIG FOR VALUE
      switch(_valueValue){
        case "LABEL":
          String? temp = dataGrid.value;
          dataGrid.value = dataGrid.label;
          dataGrid.label = temp;
          break;
        case StringConstants.key:
          String? temp = dataGrid.value;
          dataGrid.value = dataGrid.key;
          dataGrid.key = temp;
          break;
        case StringConstants.type:
          String? temp = dataGrid.value;
          dataGrid.value = dataGrid.type;
          dataGrid.type = temp;
          break;
        case StringConstants.value:
        ///no edit
          break;
      }
      tempList.add(dataGrid);
    }
    configurableDataGridList = tempList;
    notifyListeners();
  }*/
}
