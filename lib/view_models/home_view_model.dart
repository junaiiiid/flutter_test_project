import 'package:flutter/material.dart';
import 'package:flutter_test_project/constants/enums.dart';
import 'package:flutter_test_project/models/configurable_dropdown_model.dart';
import 'package:flutter_test_project/models/data_grid_model.dart';
import 'package:collection/collection.dart';

class HomeViewModel extends ChangeNotifier{
  List<String> columnLabels = ["LABEL","KEY","TYPE","VALUE"];

  List<DataGridModel> dataGridList = [];

  List<DataGridModel> configurableDataGridList = [];

  List<String> get configurableDropDown  => ["LABEL","KEY","TYPE","VALUE"];

  String _labelValue = "LABEL";
  String _keyValue = "KEY";
  String _typeValue = "TYPE";
  String _valueValue = "VALUE";

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

  void resetDropDown(){
    configurableDataGridList = dataGridList;
    _labelValue = "LABEL";
    _keyValue = "KEY";
    _typeValue = "TYPE";
    _valueValue = "VALUE";
    notifyListeners();
  }

  void saveConfiguration(){
    List<DataGridModel> tempList = [];
    for(var dataGrid in configurableDataGridList){
      ///SWAP CONFIG FOR LABEL
      switch(_labelValue){
        case "LABEL":
        ///no edit
        break;
        case "KEY":
        String? temp = dataGrid.label;
        dataGrid.label = dataGrid.key;
        dataGrid.key = temp;
        break;
        case "TYPE":
          String? temp = dataGrid.label;
          dataGrid.label = dataGrid.type;
          dataGrid.type = temp;
        break;
        case "VALUE":
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
        case "KEY":
          ///no edit
          break;
        case "TYPE":
          String? temp = dataGrid.key;
          dataGrid.key = dataGrid.type;
          dataGrid.type = temp;
          break;
        case "VALUE":
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
        case "KEY":
          String? temp = dataGrid.type;
          dataGrid.type = dataGrid.key;
          dataGrid.key = temp;
          break;
        case "TYPE":
          ///no edit
          break;
        case "VALUE":
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
        case "KEY":
          String? temp = dataGrid.value;
          dataGrid.value = dataGrid.key;
          dataGrid.key = temp;
          break;
        case "TYPE":
          String? temp = dataGrid.value;
          dataGrid.value = dataGrid.type;
          dataGrid.type = temp;
          break;
        case "VALUE":
          ///no edit
          break;
      }
      tempList.add(dataGrid);
    }
    configurableDataGridList = tempList;
    notifyListeners();
  }
}