import 'package:flutter/material.dart';
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
      switch(_labelValue){
        case "LABEL":
          dataGrid.label = dataGrid.label;
          break;
        case "KEY":
          dataGrid.label = dataGrid.key;
          break;
        case "TYPE":
          dataGrid.label = dataGrid.type;
          break;
        case "VALUE":
          dataGrid.label = dataGrid.value;
          break;
      }
      switch(_keyValue){
        case "LABEL":
          dataGrid.key = dataGrid.label;
          break;
        case "KEY":
          dataGrid.key = dataGrid.key;
          break;
        case "TYPE":
          dataGrid.key = dataGrid.type;
          break;
        case "VALUE":
          dataGrid.key = dataGrid.value;
          break;
      }
      switch(_typeValue){
        case "LABEL":
          dataGrid.type = dataGrid.label;
          break;
        case "KEY":
          dataGrid.type = dataGrid.key;
          break;
        case "TYPE":
          dataGrid.type = dataGrid.type;
          break;
        case "VALUE":
          dataGrid.type = dataGrid.value;
          break;
      }
      switch(_valueValue){
        case "LABEL":
          dataGrid.value = dataGrid.label;
          break;
        case "KEY":
          dataGrid.value = dataGrid.key;
          break;
        case "TYPE":
          dataGrid.value = dataGrid.type;
          break;
        case "VALUE":
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
  }*/
}