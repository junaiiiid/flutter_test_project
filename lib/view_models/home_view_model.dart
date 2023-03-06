import 'package:flutter/material.dart';
import 'package:flutter_test_project/constants/enums.dart';
import 'package:flutter_test_project/models/configurable_dropdown_model.dart';
import 'package:flutter_test_project/models/data_grid_model.dart';

class HomeViewModel extends ChangeNotifier{
  List<String> columnLabels = ["LABEL","KEY","TYPE","VALUE"];

  List<DataGridModel> dataGridList = [];

  List<DataGridModel> configurableDataGridList = [];

  List<ConfigurableDropDown> get configurableDropDown  => [ConfigurableDropDown(name: "LABEL", type: type)];

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
    _labelValue = "LABEL";
    _keyValue = "KEY";
    _typeValue = "TYPE";
    _valueValue = "VALUE";
    notifyListeners();
  }
  
  void saveConfiguration(){
    for(var dataGrid in configurableDataGridList){
      switch(_labelValue){
        case "LABEL":
          
      }
    }
  }
}